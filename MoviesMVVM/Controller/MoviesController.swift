    //
    //  MoviesController.swift
    //  MoviesMVVM
    //
    //  Created by Mac 3 on 24/07/1942 Saka.
    //
    
    import UIKit
    
    class MoviesController: UIViewController
    {
        @IBOutlet weak private var activityIndicatorView: UIActivityIndicatorView!
        @IBOutlet var tableView: UITableView!
        var dataSource = [MoviesCellModel]()
        let fetchMoviesService = FetchMoviesService()
        override func viewDidLoad() {
            super.viewDidLoad()
            self.tableView.isHidden = true
            fetchAllMovies()
        }
        override func viewWillAppear(_ animated: Bool) {
            activityIndicatorView.startAnimating()
        }
        
        fileprivate func fetchAllMovies() {
            
            if Connectivity.isConnectedToInternet() {
                guard let url = Movie.Url.feedURL else {
                    return
                }
                activityIndicatorView.startAnimating()
                fetchMoviesService.fetchMovies(withURL: url) { (result) in
                    switch (result) {
                    case .failure(let error):
                        self.activityIndicatorView.stopAnimating()
                        Utility.showAlert(message: error.errorMessage, onController: self)
                    case .success(let json):
                        var moviesData: [MoviesModel] = []
                        let moviesArr = json.arrayValue
                        for item in moviesArr {
                            if let model =  MoviesModel(json: item) {
                                moviesData.append(model)
                                self.dataSource.append(MoviesCellModel.init(viewModel: model))
                            }
                        }
                        self.activityIndicatorView.stopAnimating()
                        DispatchQueue.main.async {
                            self.tableView.isHidden = false
                            self.tableView.reloadData()
                            self.activityIndicatorView.stopAnimating()
                        }
                    }
                }
            }
            else
            {
                self.activityIndicatorView.stopAnimating()
                Utility.showAlert(message: "Opps internet connection not available", onController: self)
                
            }
        }
    }
    // MARK: collection view datasource and delegates methods
    extension MoviesController : UITableViewDelegate,UITableViewDataSource
    {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataSource.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath)
            
            if let cellView = cell as? MoviesTableViewCell {
                cellView.updateCell(with: self.dataSource[indexPath.row])
                cellView.showDetailBtn.tag = indexPath.row
                cellView.showDetailBtn.addTarget(self, action: #selector(showDetail(sender:)), for: .touchUpInside)
            }
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return 120
        }
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return tableView.estimatedRowHeight
        }
        @objc func showDetail(sender: UIButton)
        {
            let storyBoard = UIStoryboard.init(name: Constants.MainStoryBoard, bundle: nil)
            let detailVC = storyBoard.instantiateViewController(withIdentifier: Constants.imageVC ) as! MoviesDetailController
            detailVC.imageURL = dataSource[sender.tag].imageURL
            detailVC.imageLabelText = dataSource[sender.tag].title
            detailVC.releaseYear = String(dataSource[sender.tag].releaseYear)
            detailVC.rateIng = String(dataSource[sender.tag].rating ?? 0.0)
            detailVC.genre = dataSource[sender.tag].genre
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
