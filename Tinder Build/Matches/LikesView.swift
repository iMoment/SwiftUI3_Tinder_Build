//
//  LikesView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appManager: AppStateManager
    
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
                    ForEach(userManager.matches) { person in
                        PersonCard(person: person, shouldBlur: !user.isGoldSubscriber)
                            .frame(height: 240)
                            .onTapGesture(perform: {
                                personTapped(person)
                            })
                    }
                })
                .padding(.horizontal, 6)
        })
    }
    
    func personTapped(_ person: Person) {
        if user.isGoldSubscriber {
            appManager.setShowPersonProfile(person)
        } else {
            appManager.showPurchaseScreen()
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
