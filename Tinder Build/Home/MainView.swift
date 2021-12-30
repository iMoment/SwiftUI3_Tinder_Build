//
//  MainView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appManager: AppStateManager
    
    func presentViewForState() -> some View {
        switch appManager.selectedTab {
        case .home:
            let view = Text("Home View")
            return AnyView(view)
        case .premium:
            let view = Text("Premium View")
            return AnyView(view)
        case .messages:
            let view = Text("Messages View")
            return AnyView(view)
        case .profile:
            let view = Text("Profile View")
            return AnyView(view)
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                HStack {
                    Spacer()
                    
                    TabBarButton(buttonType: .home)
                    
                    Spacer()
                    
                    TabBarButton(buttonType: .premium)
                    
                    Spacer()
                    
                    TabBarButton(buttonType: .messages)
                    
                    Spacer()
                    
                    TabBarButton(buttonType: .profile)
                    
                    Spacer()
                }
                .frame(height: 100)
                .padding(.top, 30)
                
                presentViewForState()
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
    }
}
