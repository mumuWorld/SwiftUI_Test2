//
//  CourseList.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/29.
//

import SwiftUI

struct CourseList: View {
    
    @State var courses = courseDatas

    @State var active: Bool = false
    
    @State var activeIndex: Int = -1

    var body: some View {
        ZStack {
            Color.black.opacity(active ? 0.5 : 0)
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Course")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                    
                    //遍历数据源 添加组件
                    ForEach(courses.indices, id: \.self) { index in
                        GeometryReader { gemetry in
                            CourseView(
                                show: self.$courses[index].show,
                                section: courses[index],
                                active: $active,
                                index: index,
                                activeIndex: $activeIndex
                            )
                                .offset(y: self.courses[index].show ? -gemetry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280, alignment: .center)
                        .frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.courses[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            //加入此动画配置，会影响到子时图
//            .animation(.interactiveSpring())
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    
    var section: Course
    
    @Binding var active: Bool
    
    var index: Int
    
    @Binding var activeIndex: Int
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Text(section.title)
                    .font(.title).bold()
                Text(section.text)
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
                            .foregroundColor(.white)
                        Text(section.text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white.opacity(0.7))
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
                maxHeight: show ? 460 : 280
            )
            .background(section.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
//            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            //        .animation(.interactiveSpring())
            //        .animation(.spring())
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show {
                    self.activeIndex = index
                } else {
                    self.activeIndex = -1
                }
            }
        }
        .frame(height: show ? screen.height : 280)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var imgStr: String
    var logoStr: String
    var color: Color
    var show: Bool = false
}

let courseDatas = [
    Course(title: "Section0", text: "Section0Section0Section0Section0Section0", imgStr: "Illustration1", logoStr: "Logo", color: Color.green.opacity(0.7)),
    Course(title: "Section1", text: "Illustration2", imgStr: "Illustration2", logoStr: "Logo", color: Color.blue.opacity(0.7)),
    Course(title: "Section0", text: "sdfasdf", imgStr: "Illustration3", logoStr: "Logo", color: Color.black.opacity(0.7)),
    Course(title: "Section0", text: "sdfasdfasdfs", imgStr: "Illustration4", logoStr: "Logo", color: Color.green.opacity(0.7)),
    Course(title: "Section5", text: "sdfsdfsdfsdfs", imgStr: "Illustration5", logoStr: "Logo", color: Color.red.opacity(0.7))
]
