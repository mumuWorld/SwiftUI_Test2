//
//  HomeView.swift
//  test_2
//
//  Created by Mumu on 2021/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool

    var body: some View {
        VStack {
            HStack {
                Text("Welocome")
                    .font(.system(size: 28, weight: .bold, design: .default))
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
