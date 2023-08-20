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
    @State private var isShowingSheet = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        print("--- BUTTON WAS PRESSD ---")
        print("Status: Old Image Number = \(currentImage)")
        repeat {
        
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")
        }while randomNumber == currentImage
        
        currentImage = randomNumber
        
        print("Resul: New Image number = \(currentImage)")
        print("--- THE END ---")
        print("\n")
    }
    
    
    var body: some View {
        // MARK: - CARD
        
        ZStack{
            CustomBackgroundView()
            
            VStack{
                // MARK: - HEADER
                
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
                        Button{
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                        
                            
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }.padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(currentImage)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: currentImage)
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
