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
            List(updates) { item in
                NavigationLink {
                    Text(item.text)
                } label: {
                    HStack {
                        Image(item.image)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.trailing, 4)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(item.title)
                                .font(.system(size: 20, weight: .bold))
                            //限制两行
                            Text(item.text)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Text(item.date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }.padding(.vertical, 8)
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

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updates: [Update] = [
    Update(image: "Illustration1", title: "title_1", text: "text_1", date: "Jan 1"),
    Update(image: "Illustration2", title: "title_1", text: "text_1", date: "Jan 1"),
    Update(image: "Illustration3", title: "title_1", text: "text_1", date: "Jan 1"),
    Update(image: "Illustration4", title: "title_1", text: "text_1", date: "Jan 1"),
    Update(image: "Illustration5", title: "title_1", text: "text_1", date: "Jan 1")
]
