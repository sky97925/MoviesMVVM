//
//  AppError.swift
//  MoviesMVVM
//
//  Created by Mac 3 on 24/07/1942 Saka.
//

import Foundation

enum NetworkError {
    case networkError
    case fetchError
    var errorMessage: String {
        switch self {
        case .networkError: return "Something went wrong!"
        case .fetchError: return "Unable to Fetch!"
        }
    }
}
