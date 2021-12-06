//
//  DataStore.swift
//  test_2
//
//  Created by 杨杰 on 2021/12/6.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
   
    @Published var postsList: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        Api().getPosts { (posts) in
            DispatchQueue.main.async {
                self.postsList = posts
            }
        }
    }
}
