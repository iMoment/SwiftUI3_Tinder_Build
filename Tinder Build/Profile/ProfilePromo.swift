//
//  ProfilePromo.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import SwiftUI

struct ProfilePromo: View {
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                VStack(spacing: 9) {
                    Spacer()
                    
                    Text("Get Tinder Gold")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("See who Likes You & more!")
                }
                .padding(.bottom, 64)
                
                VStack(spacing: 9) {
                    Spacer()
                    
                    Text("Get Matches Faster")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("Boost your profile once a month!")
                }
                .padding(.bottom, 64)
                
                VStack(spacing: 9) {
                    Spacer()
                    
                    Text("Increase Your Chances")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("Gold subscribers get 5x more matches!")
                }
                .padding(.bottom, 64)
            }
            .tabViewStyle(PageTabViewStyle())
            
            Button(action: { action() }, label: {
                Text("MY TINDER PLUS")
                    .foregroundColor(Color.red)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.2), radius: 10)
            })
            .padding(.bottom, 30)
        }
    }
}

struct ProfilePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            ProfilePromo {
                print("My Tinder Plus button pressed.")
            }
        }
        .frame(height: 400)
    }
}
