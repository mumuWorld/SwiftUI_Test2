//
//  SectionView.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/23.
//

import SwiftUI

struct SectionView: View {
    var section: Section
    
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Text(section.title)
                    .font(.system(size: 28, weight: .bold, design: .default))
                .frame(width: 160, alignment: .leading)
                Spacer()
                Image(section.logoStr)
            }
            Text(section.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(section.imgStr)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: 275, alignment: .center)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: Section(title: "Section0", text: "Section0Section0Section0Section0Section0", imgStr: "Illustration1", logoStr: "Logo", color: Color.green.opacity(0.7)))
    }
}
