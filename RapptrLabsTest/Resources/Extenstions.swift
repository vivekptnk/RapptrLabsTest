//
//  Extenstions.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/18/21.
//

import Foundation

import UIKit

extension UIViewController {
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
