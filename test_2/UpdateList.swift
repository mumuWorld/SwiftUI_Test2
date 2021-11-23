//
//  UpdateList.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/23.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                NavigationLink {
                    Text("1")
                } label: {
                    Text("jump")
                }
            }
            .navigationBarTitle(Text("Updates"))
            
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
