//
//  CircleButtonView.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2022/01/04.
//

import SwiftUI

enum ButtonType: String {
    case back = "gobackward"
    case no = "xmark"
    case star = "star.fill"
    case heart = "heart.fill"
    case lightning = "cloud.bolt.fill"
}

struct CircleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Circle()
                    .foregroundColor(Color.white)
            )
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct ColorButton: ViewModifier {
    var buttonType: ButtonType
    
    func body(content: Content) -> some View {
        switch buttonType {
        case .back:
            return AnyView(content
                .foregroundColor(Color.yellow)
            )
        case .no:
            return AnyView(content
                .foregroundColor(Color.red)
            )
        case .star:
            return AnyView(content
                .foregroundColor(Color.blue)
            )
        case .heart:
            return AnyView(content
                .foregroundColor(Color.green)
            )
        case .lightning:
            return AnyView(content
                .foregroundColor(Color.purple)
            )
        }
    }
}

extension View {
    func colorButton(buttonType: ButtonType) -> some View {
        self.modifier(ColorButton(buttonType: buttonType))
    }
}

struct CircleButtonView: View {
    var buttonType: ButtonType
    var action: () -> Void
    
    var body: some View {
        Button(action: { action() }, label: {
            Image(systemName: buttonType.rawValue)
                .resizable()
                .font(.system(size: 12, weight: .bold))
                .aspectRatio(contentMode: .fit)
                .padding(12)
        })
        .buttonStyle(CircleButton())
        .colorButton(buttonType: buttonType)
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                CircleButtonView(buttonType: .back) {}
                .frame(height: 50)
                CircleButtonView(buttonType: .no) {}
                .frame(height: 50)
                CircleButtonView(buttonType: .star) {}
                .frame(height: 50)
                CircleButtonView(buttonType: .heart) {}
                .frame(height: 50)
                CircleButtonView(buttonType: .lightning) {}
                .frame(height: 50)
            }
        }
    }
}
