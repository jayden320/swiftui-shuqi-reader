//
//  UIKitExtension.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import Foundation
import UIKit

extension UIAlertController {
    func show() {
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.present(self, animated: true)
        }
    }
}
