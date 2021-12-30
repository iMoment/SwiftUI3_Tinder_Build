//
//  RoundedImage.swift
//  Tinder Build
//
//  Created by Stanley Pan on 2021/12/30.
//

import SwiftUI
import Kingfisher

struct RoundedImage: View {
    var imageURL: URL?
    
    var body: some View {
        KFImage(imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(imageURL: URL(string: "https://picsum.photos/400"))
    }
}
