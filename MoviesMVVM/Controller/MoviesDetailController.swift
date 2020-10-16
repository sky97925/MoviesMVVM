    //
    //  MoviesDetailController.swift
    //  MoviesMVVM
    //
    //  Created by Mac 3 on 24/07/1942 Saka.
    
    import UIKit
    class MoviesDetailController: UIViewController {
        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var imageTitle: UILabel!
        @IBOutlet var releaseYearLbl: UILabel!
        @IBOutlet var rateLbl: UILabel!
        @IBOutlet var genreLbl: UILabel!
        var imageURL: String? = Constants.emptyString
        var imageLabelText: String? = Constants.emptyString
        var releaseYear: String? = Constants.emptyString
        var rateIng: String? = Constants.emptyString
        var genre:[String] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            setupScreen()
        }
        func setupScreen() {
            if Connectivity.isConnectedToInternet() {
                if imageURL != "" {
                    imageView.downloadImageLink(link: imageURL!, contentMode: .scaleToFill)
                }
             }
            else
            {
                Utility.showAlert(message: "Opps internet connection not available", onController: self)

            }
           
            imageTitle.text = imageLabelText
            releaseYearLbl.text = "Release Year" + ":" + (releaseYear ?? "")
            rateLbl.text = "Rating" + ":" + (rateIng ?? "")
            genreLbl.text = "Genre" + ": " + genre.joined(separator: ",")
        }

    }
