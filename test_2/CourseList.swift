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
        ZStack(alignment: .top) {
            VStack {
                Text("The stiffness of the spring, defined as an approximate duration in seconds. A value of zero requests an infinitely-stiff spring, suitable for driving interactive animations")
                
                Text("response")
                    .font(.title).bold()
                
                Text("The stiffness of the spring, defined as an approximate duration in seconds. A value of zero requests an infinitely-stiff spring, suitable for driving interactive animation The amount of drag applied to the value being animated, as a fraction of an estimate of amount needed to produce critical damping. The duration in seconds over which to interpolate changes to the response value of the spring The duration in seconds over which to interpolate changes to the response value of the springThe duration in seconds over which to interpolate changes to the response value of the springThe duration in seconds over which to interpolate changes to the response value of the spring The stiffness of the spring, defined as an approximate duration in seconds. A value of zero requests an infinitely-stiff spring, suitable for driving interactive animations")
                
                Text("The duration in seconds over which to interpolate changes to the response value of the spring The duration in seconds over which to interpolate changes to the response value of the spring The duration in seconds over which to interpolate changes to the response value of the spring ")
            }
            .padding(30)
            .frame(
                maxWidth: show ? .infinity : screen.width - 60,
                maxHeight: show ? .infinity : 280,
                alignment: .top
            )
            .offset(y: show ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
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
                    ZStack {
                        Image(section.logoStr)
                            .opacity(show ? 0 : 1)
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .opacity(show ? 1 : 0)
                    }
                    .frame(width: 36, height: 36, alignment: .center)
                    .background(Color.black)
                    .clipShape(Circle())
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
                maxHeight: show ? 480 : 280
            )
            //        .frame(width: screen.width - 60, height: 275, alignment: .center)
            .background(section.color)
            .cornerRadius(30)
            .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
            //        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            //        .animation(.interactiveSpring())
            //        .animation(.spring())
            .onTapGesture {
                self.show.toggle()
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 1))
        .edgesIgnoringSafeArea(.all)
    }
}
