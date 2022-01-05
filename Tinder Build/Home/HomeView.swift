//
//  HomeView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/05.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appManager: AppStateManager
    
    var body: some View {
        VStack {
            CardStack(people: userManager.personCardStack)
            
            Spacer()
            
            HStack {
                CircleButtonView(buttonType: .back) {
                    appManager.showPurchaseScreen()
                }
                
                Spacer()
                
                CircleButtonView(buttonType: .no) {
                    if let person = userManager.personCardStack.last {
                        userManager.swipe(person, .reject)
                    }
                }
                
                Spacer()
                
                CircleButtonView(buttonType: .star) {
                    if let person = userManager.personCardStack.last {
                        if userManager.currentUser.isGoldSubscriber {
                            userManager.superLike(person)
                        } else {
                            appManager.showPurchaseScreen()
                        }
                    }
                }
                
                Spacer()
                
                CircleButtonView(buttonType: .heart) {
                    if let person = userManager.personCardStack.last {
                        userManager.swipe(person, .like)
                    }
                }
                
                Spacer()
                
                CircleButtonView(buttonType: .lightning) {
                    appManager.showPurchaseScreen()
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical, 25)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
