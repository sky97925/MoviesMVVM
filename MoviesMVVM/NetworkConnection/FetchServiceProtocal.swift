//
//  FetchServiceProtocal.swift
//  MoviesMVVM
//
//  Created by Mac 3 on 24/07/1942 Saka.
//

import Foundation

protocol FetchServiceProtocal {
    func fetchMovies(withURL url: URL, completionHandler:@escaping (NetworkResult) -> Void)
}
