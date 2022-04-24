//
//  ReaderBottomView.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import SwiftUI

struct ReaderBottomView: View {
    @ObservedObject var vm: ReaderViewModel
    @State var currentDate = Date()
    
    var currentDateDescription: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: currentDate)
    }
    
    var body: some View {
        HStack {
            Image("reader_battery")
            Spacer()
            Text(currentDateDescription) .font(.custom("Courier", size: 15)).foregroundColor(ThemeColor.gray).font(.subheadline).onReceive(vm.timer) { input in
                currentDate = input
            }
        }
    }
}

struct ReaderBottomView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderBottomView(vm: ReaderViewModel(bookId: "1"))
    }
}
