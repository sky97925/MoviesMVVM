//
//  CellModel.swift
//  MoviesMVVM
//
//  Created by Mac 3 on 24/07/1942 Saka.
//

import Foundation
import UIKit

struct MoviesCellModel: ImageProtocal {
    var imageURL: String
    var title: String
    var releaseYear:Int
    var rating:Double?
    var genre:[String] = []

    init(viewModel: MoviesModel) {
        self.imageURL = viewModel.image ?? ""
        self.title = viewModel.title ?? ""
        self.releaseYear = viewModel.releaseYear ?? 0
        self.genre = viewModel.genre
        self.rating = viewModel.rating

    }
}
