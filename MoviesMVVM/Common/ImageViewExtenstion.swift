//
//  ImageViewExtenstion.swift
//  MoviesMVVM
//
//  Created by Mac 3 on 24/07/1942 Saka.
//

import Foundation
import UIKit
extension UIImageView {
    func downloadImageLink(link: String, contentMode: UIView.ContentMode) {
        guard let url = URL(string: link) else {
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode = contentMode
                if let data = data {
                    self.image = UIImage(data: data)
                }
            }
        }).resume()
    }
}
