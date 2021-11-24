//
//  RingView.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/24.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.black.opacity(0.1),
                style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity))
                .frame(width: 44, height: 44, alignment: .center)
            
            Circle()
                .trim(from: 0.2, to: 1)
                .stroke(
                    LinearGradient(colors: [Color.purple, Color.green], startPoint: .topLeading, endPoint: .bottomTrailing),
                style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity))
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .frame(width: 44, height: 44, alignment: .center)
                .shadow(color: Color.purple.opacity(0.2), radius: 20, x: 0, y: 3)
            
            Text("80%")
                .font(.system(size: 15, weight: .bold, design: .default))
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
