//
//  PurchaseOptionView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/03.
//

import SwiftUI

struct PurchaseOptionView: View {
    var subscription: Subscription
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(subscription.durationInMonths)")
                .font(.system(size: 44, weight: .light))
            
            Spacer()
                .frame(height: 2)
            
            Text("month\(subscription.durationInMonths > 1 ? "s" : "")")
                .if(isSelected) {
                    $0.font(.system(size: 14, weight: .bold))
                }
            
            Spacer()
                .frame(height: 2)
            
            Text("$\(String(format: "%.2f", subscription.monthlyCost))/mo")
                .foregroundColor(.textPrimary)
            
            Spacer()
                .frame(height: 10)
            
            if subscription.savePercent != nil {
                Text("SAVE \(subscription.savePercent ?? 0)%")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 16, weight: .heavy))
                    .frame(height: 22)
            } else {
                Spacer()
                    .frame(height: 22)
            }
            
            Spacer()
                .frame(height: 12)
            
            Text("$\(String(format: "%.2f", subscription.totalCost))")
                .font(.system(size: 20, weight: .bold))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 18)
        .if(!isSelected) {
            $0.foregroundColor(Color.textPrimary)
        }
        .if(isSelected && subscription.tagLine == .none) {
            $0.overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.yellow, lineWidth: 1.5)
            )
        }
        .if(isSelected && subscription.tagLine != .none) {
            $0.overlay(
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(Color.yellow)
                        .frame(height: 20)
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                    
                    Text(subscription.tagLine.rawValue)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color.white)
                        .lineLimit(1)
                        .padding(.top, 2)
                        .padding(.horizontal, 6)
                        .minimumScaleFactor(0.1)
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.yellow, lineWidth: 1.5)
                }
            )
        }
    }
}

struct PurchaseOptionView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            PurchaseOptionView(subscription: Subscription.example1, isSelected: false)
            PurchaseOptionView(subscription: Subscription.example2, isSelected: true)
            PurchaseOptionView(subscription: Subscription.example3, isSelected: false)
        }
    }
}
