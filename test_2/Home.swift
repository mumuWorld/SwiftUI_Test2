//
//  Home.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/22.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile: Bool = false
    
    @State var viewState: CGSize = CGSize.zero

    var body: some View {
        ZStack {
            
            Color.gray.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Welocome")
                        .font(.system(size: 28, weight: .bold, design: .default))
                    Spacer()
                    Button(action: {
                        showProfile.toggle()
                    }) {
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
            .padding(.top, 44)
            .background(Color.white)
            //圆角
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10: 0), axis: (x: 1, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : 600)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged({ value in
                        self.viewState = value.translation
                    })
                    .onEnded({ value in
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                        self.viewState = .zero
                    })
                )
               
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}