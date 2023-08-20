//
//  HeaderCardView.swift
//  maps-swift
//
//  Created by Icaro on 20/08/23.
//

import SwiftUI

struct HeaderCardView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("Hiking")
                    .font(.system(size: 52))
                    .fontWeight(.black)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.customGrayLight, .customGrayMedium],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                Spacer()
                CustomButtonView()
            }
            Text("Fun and enjoyable outdoor activity for friends and families.")
                .multilineTextAlignment(.leading)
                .italic()
                .foregroundColor(.customGrayMedium)
        }.padding(.horizontal, 30)
    }
}

struct HeaderCardView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCardView()
    }
}
