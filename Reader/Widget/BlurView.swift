//
//  BlurView.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import Foundation
import SwiftUI

struct BlurView: UIViewRepresentable {
    let blurEffect: UIBlurEffect
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView;
    }
    
    func updateUIView(_ nsView: UIVisualEffectView, context: Context) {}
};
