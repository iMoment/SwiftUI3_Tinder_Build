//
//  TabBarButton.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import SwiftUI

enum TabBarButtonType: String {
    case home = "flame.fill"
    case premium = "star.fill"
    case messages = "message.fill"
    case profile = "person.fill"
}

struct TabBarButton: View {
    var buttonType: TabBarButtonType
    @EnvironmentObject var appManager: AppStateManager
    
    var body: some View {
        Button(action: { appManager.selectedTab = buttonType }, label: {
            Image(systemName: buttonType.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .if(appManager.selectedTab == buttonType, transform: {
                    $0.foregroundColor(buttonType == .premium ? Color.yellow : Color.red)
                })
                .foregroundColor(Color.gray.opacity(0.5))
        })
        .frame(height: 32)
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonType: .profile)
            .environmentObject(AppStateManager())
    }
}
