//
//  RingView.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/24.
//

import SwiftUI

struct RingView: View {
    var color1 = Color("background9")
    var color2 = Color("background5")
    var width: CGFloat = 300
    var height: CGFloat = 300
    //完成度
    var percent: CGFloat = 88
    
    var body: some View {
        let multiplier: CGFloat = width / 44
        let progress = 1 - percent / 100
        ZStack {
            Circle()
                .stroke(
                    Color.black.opacity(0.1),
                style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity))
                .frame(width: width, height: height, alignment: .center)
            
            Circle()
                .trim(from: progress, to: 1)
                .stroke(
                    LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing),
                style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity))
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height, alignment: .center)
                .shadow(color: color2.opacity(0.2), radius: 3 * multiplier, x: 0, y: 3)
            
            Text("\(Int(percent))%")
                .font(.system(size: 15 * multiplier, weight: .bold, design: .default))
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
