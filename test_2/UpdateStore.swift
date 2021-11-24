//
//  UpdateStore.swift
//  test_2
//
//  Created by 杨杰 on 2021/11/24.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updatesDates: [Update] = updates
}
