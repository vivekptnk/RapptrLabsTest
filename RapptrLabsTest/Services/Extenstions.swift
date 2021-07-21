//
//  Extenstions.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/18/21.
//

import Foundation

import UIKit

// Extension in UITextField to set the padding of the UItextField
extension UITextField {
    
    
    // left padding
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    // right padding ( probably wont be used. )
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


// Extension in UIView to simulate fade in and fade out animation.
public extension UIView {
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
}

// UI Image to make a circle mask on the avatars
extension UIImage {
    var circleMask: UIImage? {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: .init(origin: .init(x: 0, y: 0), size: square))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
}

// Load images for avatar url 
extension UIImageView {
    func loadImage(imageURL : String) {
        guard let url = URL(string: imageURL) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data  = try? Data(contentsOf: url) {
                if let image  = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image.circleMask
                    }
                }
            }
        }
    }
}
