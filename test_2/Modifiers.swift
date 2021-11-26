//
//  Modifiers.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/25.
//

import SwiftUI

struct ShadowModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}


struct FontModifiers: ViewModifier {
    
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content.font(.system(style, design: .rounded))
    }
}

struct CustomFontModifiers: ViewModifier {

    var size: CGFloat = 17
    
    func body(content: Content) -> some View {
        content.font(.custom("ZCOOLQingKeHuangYou-Regular", size: size))
    }
}
