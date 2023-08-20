//
//  MotionAnimationView.swift
//  maps-swift
//
//  Created by Icaro on 20/08/23.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    
    @State private var randomCircle = Int.random(in: 6...12)
    @State private var isAnimating = false
    
    // MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func ranndomCoordiante()-> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    // 2. RANDOM SIZE
    func randomSize()-> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    // 3. RANDOM SCALE
    func randomScale()->CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed()-> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    // 5. RANDOM DELEAY
    func randomDelay()-> Double {
        return Double.random(in: 0...2)
    }
    
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { idx in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .position(
                        x: ranndomCoordiante(),
                        y: ranndomCoordiante()
                    )
                    .frame(width: randomSize(), height: randomSize())
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    })
                    .scaleEffect(isAnimating ? randomScale(): 1)
            }
            
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        //Conecta com a gpu do celular
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
            MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal)
            )
    }
}
