//
//  TopPicksView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/02.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appManager: AppStateManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            if !user.isGoldSubscriber {
                Text("Upgrade to Tinder Gold for more Top Picks!")
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
                        PersonCard(person: person, shouldBlur: false)
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

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
