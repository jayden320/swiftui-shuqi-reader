//
//  Avatar.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct Avatar: View {
    let url: String
    var size: CGFloat? = nil
    
    var body: some View {
        let content = WebImage(url: URL(string: url)).resizable().clipShape(Circle())
        if let size = size {
            content.frame(width: size, height: size)
        } else {
            content
        }
    }
}





struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(url: "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX")
        
        Avatar(url: "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX", size: 100)
    }
}
