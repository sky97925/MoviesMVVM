//
//  Connectivity.swift
//  MoviesMVVM
//
//  Created by Mac 3 on 25/07/1942 Saka.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
