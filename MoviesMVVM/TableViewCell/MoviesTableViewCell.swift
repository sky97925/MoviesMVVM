//
//  MoviesTableViewCell.swift
//  MoviesMVVM
//
//  Created by Mac 3 on 25/07/1942 Saka.
//

import UIKit
import FloatRatingView
class MoviesTableViewCell: UITableViewCell {

    @IBOutlet var moviesTitle: UILabel!
    @IBOutlet var yearLbl: UILabel!
    @IBOutlet var genreLbl: UILabel!
    @IBOutlet var showDetailBtn: UIButton!
    @IBOutlet var imgName: UIImageView!
    @IBOutlet var ratView: FloatRatingView!
    @IBOutlet var rateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(with cellModel: MoviesCellModel) {
        self.imgName.downloadImageLink(link: cellModel.imageURL , contentMode: .scaleToFill)
        self.moviesTitle.text = cellModel.title
        let releaseYear = String(cellModel.releaseYear)
        self.yearLbl.text = "Release Year" + ": " + releaseYear
        self.rateLbl.text = "Ratings" + ": " + String(cellModel.rating ?? 0.0)
        self.genreLbl.text = "Genre" + ": " + cellModel.genre.joined(separator: ",")

    }
}
