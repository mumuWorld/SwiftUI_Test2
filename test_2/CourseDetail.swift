//
//  CourseDetail.swift
//  test_2
//
//  Created by 杨杰 on 2021/12/1.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course = Course(title: "Section0", text: "Section0Section0Section0Section0Section0", imgStr: "Illustration1", logoStr: "Logo", color: Color.green.opacity(0.7))
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail()
    }
}
