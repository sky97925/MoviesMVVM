//
//  MoviesModel.swift
//  MoviesMVVM
//
//  Created by Mac 3 on 24/07/1942 Saka.
//

import Foundation
import SwiftyJSON
struct MoviesModel: Codable {
    var releaseYear:Int?
    var rating:Double?
    var image:String?
    var title:String?
    var genre:[String] = []
    
    init?(json:JSON) {
        guard let data = try? json.rawData() else {
            return nil
        }
        self = try! JSONDecoder().decode(MoviesModel.self, from: data)
    }
}
