//
//  CardView.swift
//  maps-swift
//
//  Created by Icaro on 20/08/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var currentImage = 1
    @State private var randomNumber = 1
    
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        randomNumber = Int.random(in: 1...5)
        if(randomNumber == currentImage) {
            randomNumber = Int.random(in: 1...5)
            currentImage = randomNumber
        }else {
            currentImage = randomNumber
        }
        
    }
    
    var body: some View {
        // MARK: - CARD
        
        ZStack{
            CustomBackgroundView()
            
            VStack{
                // MARK: - HEADER
                
                HeaderCardView()
                
                // MARK: - MAIN CONTENT
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.customIndigoMedium,
                                    Color.customSalmonLight
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 256, height: 256)
                        
                    Image("image-\(currentImage)")
                        .resizable()
                        .scaledToFit()
                }
                
                // MARK: - FOOTER
                Button {
                    // ACTION: GENERATE a random number
                    randomImage()
                }label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenDark],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25),radius: 0.2, x: 1, y: 2)
                }.buttonStyle(GradientButton())
                
            }
           
            
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .padding()
    }
}
