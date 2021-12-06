//
//  View+Extension.swift
//  test_2
//
//  Created by 杨杰 on 2021/12/6.
//

import Foundation
import SwiftUI

extension View {
    func debugPrint(value: String) -> some View {
        print(value)
        return self
    }
}
