//
//  MainView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                HStack {
                    TabBarButton(buttonType: .fire) {
                        // TODO: Action
                    }
                    
                    TabBarButton(buttonType: .star) {
                        // TODO: Action
                    }
                    
                    TabBarButton(buttonType: .message) {
                        // TODO: Action
                    }
                    
                    TabBarButton(buttonType: .profile) {
                        // TODO: Action
                    }
                }
                .frame(height: 100)
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
