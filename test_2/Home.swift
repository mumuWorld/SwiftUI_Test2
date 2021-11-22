//
//  Home.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Welocome")
                        .font(.system(size: 28, weight: .bold, design: .default))
                    Spacer()
                    Button(action: {}) {
                        Image("avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36, alignment: .leading)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            
            MenuView()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
