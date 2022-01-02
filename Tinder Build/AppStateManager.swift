//
//  AppStateManager.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import Foundation

class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .home
    @Published var showPersonProfile: Person? = nil
    @Published var shouldShowPurchasePopup: Bool = false
    
    public func setShowPersonProfile(_ person: Person) {
        self.showPersonProfile = person
    }
    
    public func showPurchaseScreen() {
        self.shouldShowPurchasePopup = true
    }
}
