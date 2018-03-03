//
//  UIImageView.swift
//
//  Created by Josue Meza Peña on 21-08-17.
//  Copyright © 2017 Ilógica. All rights reserved.
//

import UIKit

public extension UIImageView {
    
    /**
     **imageFrom(url:,defaultImageName:,completion:)**
     
     Set in this image view, an image from an URL.
     
     - Parameters:
         - url: String with the image URL.
         - defaultImageName: (optional) String with the image name in Bundle to use while the image of URL is downloading.
         - completion: (optional) Callback for the image download completion.
         - image: Downloaded image from URL.
     */
    func imageFrom(url: String, defaultImageName: String? = nil, completion: ((_ image: UIImage) -> Void)? = nil) {
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                if (response as! HTTPURLResponse).statusCode == 404, let imageName = defaultImageName {
                    self.image = UIImage(named: imageName)
                } else {
                    let image = UIImage(data: data!)
                    self.image = image
                    if let completionCallback = completion, let strictImage = image {
                        completionCallback(strictImage)
                    }
                }
            })
            
        }).resume()
    }
    
}
