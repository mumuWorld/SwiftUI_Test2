//
//  HomeView.swift
//  test_2
//
//  Created by Mumu on 2021/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    
    @State var presented: Bool = false

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Welocome")
                        .modifier(CustomFontModifiers(size: 28))
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)

                    Button(action: {
                        self.presented.toggle()
                    }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .frame(width: 36, height: 36, alignment: .center)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $presented) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchingView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 20)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(sectionDatas) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(
                                        Angle(degrees: Double((geometry.frame(in: .global).minX - 30) / -20)), axis: (x: 0, y: 1, z: 0)
                                    )
                            }
                            .frame(width: 275, height: 275, alignment: .leading)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                
                Spacer()
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct WatchingView: View {
    var body: some View {
        HStack(spacing: 20) {
            HStack {
                RingView(color1: Color("background9"), color2: Color("background5"), width: 44, height: 44, percent: 70, show: .constant(true))
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack {
                    Text("6 分钟之前")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("副标题这是这是")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
            HStack {
                RingView(color1: Color("background4"), color2: Color("background3"), width: 30, height: 30, percent: 70, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
            HStack {
                RingView(color1: Color("background8"), color2: Color("background7"), width: 30, height: 30, percent: 70, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifiers())
        }
    }
}
