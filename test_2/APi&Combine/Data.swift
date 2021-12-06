//
//  Data.swift
//  test_2
//
//  Created by 杨杰 on 2021/12/3.
//

import Foundation

struct Post: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
}

class Api {
    func getPosts(complete: @escaping ([Post]) -> Void) {
        print("startt")
        let url = URL(string: "http://jsonplaceholder.typicode.com/posts")
        let task = URLSession.shared.dataTask(with: URLRequest(url: url!)) { data, res, error in
            print("complete")
            guard let _data = data else { return }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: _data)
//                print(posts)
                print("test->\(posts.count)")
                complete(posts)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
