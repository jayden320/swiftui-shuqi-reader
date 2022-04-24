//
//  FoundationExtension.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/23.
//

import Foundation

extension Double {
    public func toStringAsFixed(_ fractionDigits: Int) -> String {
        let format = String(format: "%%0.%df", fractionDigits)
        return String(format: format, self)
    }
}
