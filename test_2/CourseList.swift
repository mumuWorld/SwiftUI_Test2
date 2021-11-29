//
//  CourseList.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/29.
//

import SwiftUI

struct CourseList: View {
    var section: Section  = Section(title: "Section0", text: "Section0Section0Section0Section0Section0", imgStr: "Illustration1", logoStr: "Logo", color: Color.green.opacity(0.7))
    var title: String = "section title"
    var logoStr: String = "section title"

    var body: some View {
            CourseView()
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @State var show: Bool = false
    
    var section: Section  = Section(title: "Section0", text: "Section0Section0Section0Section0Section0", imgStr: "Illustration1", logoStr: "Logo", color: Color.green.opacity(0.7))
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading) {
                    Text(section.title)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .frame(width: 160, alignment: .leading)
                    Text(section.text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                Image(section.logoStr)
            }
            .padding(.top)
            Spacer()
            Image(section.imgStr)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        
        .padding(.horizontal, 20)
        .padding(.top, show ? 30 : 0)
        .frame(
            maxWidth: show ? .infinity : screen.width - 60,
            maxHeight: show ? .infinity : 280
        )
//        .frame(width: screen.width - 60, height: 275, alignment: .center)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
//        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
//        .animation(.interactiveSpring())
//        .animation(.spring())
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 1))
        .onTapGesture {
            self.show.toggle()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
