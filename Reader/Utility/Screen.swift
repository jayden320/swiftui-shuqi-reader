//
//  Screen.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import Foundation
import UIKit
import SwiftUI

class Screen {
    static var safeAreaInsets: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
    }
    
    static var navigationBarHeight: CGFloat {
        49.0 + safeAreaInsets.top
    }
    
    static var tabbarHeight: CGFloat {
        50.0 + safeAreaInsets.bottom
    }
    
    static func horizontalSafeAreaInsets(padding: CGFloat = 0) -> EdgeInsets {
        EdgeInsets(top: 0, leading: safeAreaInsets.left + padding, bottom: 0, trailing: safeAreaInsets.right + padding)
    }
}
