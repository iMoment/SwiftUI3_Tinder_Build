//
//  LikesView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            if !user.isGoldSubscriber {
                Text("Upgrade to Gold to see people who already liked you.")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 24)
            }
            
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                alignment: .center,
                spacing: nil,
                pinnedViews: [],
                content: {
                    // TODO: Fill with person images
                })
        })
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(UserManager())
    }
}
