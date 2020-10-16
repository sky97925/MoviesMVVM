//
//  FetchMoviesService.swift
//  MoviesMVVM
//
//  Created by Mac 3 on 24/07/1942 Saka.
//

import Foundation
import UIKit
import SwiftyJSON
enum NetworkResult {
    case success(JSON)
    case failure(NetworkError)
}
class FetchMoviesService: FetchServiceProtocal {

    func fetchMovies(withURL url: URL, completionHandler:@escaping (NetworkResult) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(NetworkResult.failure(NetworkError.fetchError))
                }
                return
            }
            do {
                let json = try JSON(data: data)
                DispatchQueue.main.async {
                    completionHandler(NetworkResult.success(json))
                }
            }
            catch( _) {
                DispatchQueue.main.async {
                    completionHandler(NetworkResult.failure(NetworkError.networkError))
                }
            }
            }.resume()
    }
}
