//
//  ResizeImage.swift
//  FinalProject
//
//  Created by Farhan Permana on 09/05/23.
//

import UIKit

extension UIImageView {
    // async image from url and resize it
    public func imageFromURL(urlString: String, size: CGSize) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                guard let data = data, let image = UIImage(data: data) else { return }
                let renderer = UIGraphicsImageRenderer(size: size)
                let resizedImage = renderer.image { _ in
                    image.draw(in: CGRect(origin: .zero, size: size))
                }
                self.image = resizedImage
            })

        }).resume()
    }
}

