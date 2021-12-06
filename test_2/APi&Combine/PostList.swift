//
//  PostList.swift
//  test_2
//
//  Created by 杨杰 on 2021/12/3.
//

import SwiftUI

struct PostList: View {
    @State var _posts: [Post] = []
    let api = Api()
    
    @ObservedObject var store = DataStore()
    
    var body: some View {
        
        ZStack {
            List(store.postsList) { item in
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.system(.title, design: .default))
                    Text(item.body).font(.subheadline).foregroundColor(.secondary)
                }
                Text("dsete2")
            }
            
            Text("hello")
                .font(.system(.title))
                .foregroundColor(.red)
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
