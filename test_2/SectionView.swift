//
//  SectionView.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/23.
//

import SwiftUI

struct SectionView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Text("Hello, World! test designs in ")
                    .font(.system(size: 28, weight: .bold, design: .default))
                .frame(width: 160, alignment: .leading)
                Spacer()
                Image("Logo")
            }
            Text("Hello, World! test designs in")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("Illustration4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275, alignment: .center)
        .background(Color("background6"))
        .cornerRadius(30)
        .shadow(color: Color("background5").opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
