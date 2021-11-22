//
//  MenuView.swift
//  test_2
//
//  Created by Mumu on 2021/11/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("meng- 28%")
                    .font(.caption)
                
                Color.white
                    .frame(width: 38, height: 4, alignment: .center)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6)
                    .background(Color("gradient2").opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24, alignment: .center)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "gear")
                MenuRow(title: "Sign out", icon: "gear")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(
                LinearGradient(
                    gradient:
                        Gradient(colors: [
                        Color.white,
                        Color("background")]),
                    startPoint: .top,
                    endPoint: .bottom))            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            //覆盖一个头像
            .overlay(
                Image("avatar", bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
            
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .bold, design: .default))
                .imageScale(.large)
                .frame(width: 32, height: 32, alignment: .center)
                .foregroundColor(Color("background10"))
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
