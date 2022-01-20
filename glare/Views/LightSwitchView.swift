//
//  LightSwitchView.swift
//  glare
//
//  Created by NAVEEN MADHAN on 1/19/22.
//

import SwiftUI
import Lottie

struct LightSwitchView: View {
    
    let animationDuration: TimeInterval = 0.35
    
    @State var xScale: CGFloat = 2
    @State var yScale: CGFloat = 0.4
    @State var yOffset: CGFloat = UIScreen.main.bounds.height * 0.8
    
    @State var isOff: Bool = true
    @State private var appMode: Mode = .dark
    
    var body: some View {
        ZStack {
            
            
            LottieView(fileName: "DayBG", loopMode: .loop, contentMode: .scaleAspectFit)
                .opacity(appMode == .light ? 1 : 0)
            
            LottieView(fileName: "DarkBG", loopMode: .loop, contentMode: .scaleAspectFill)
                .opacity(appMode == .dark ? 0 : 1)
            
            
            ZStack {
                
                BlurView(style: .regular)
                    .frame(width: 52, height: UIScreen.main.bounds.height * 0.25 + 6)
                    .cornerRadius(30)
                    .offset(x: UIScreen.main.bounds.width / 2 - 48, y: 16)
                
                ZStack {
                    Capsule()
                        .frame(width: 3, height: self.isOff ? UIScreen.main.bounds.height * 0.41 : UIScreen.main.bounds.height * 0.625)
                        .foregroundColor(.white)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 42, height: 42)
                        .offset(y: self.isOff ? UIScreen.main.bounds.height * 0.225: UIScreen.main.bounds.height * 0.25 + 42)
                        .onTapGesture(perform: switchModes)
                    
                }.offset(x: UIScreen.main.bounds.width / 2 - 48, y: -UIScreen.main.bounds.height / 2)
                .frame(height: 0, alignment: .top)
            }
            .animation(Animation.spring(dampingFraction: 0.65).speed(1.25))
        }.edgesIgnoringSafeArea(.all)
    }
    
    // MARK:- functions
    func toggleAllLights() {
        if (isOff) {
            withAnimation(Animation.easeIn(duration: animationDuration)) {
                xScale = 1
                yScale = 1
                yOffset = 0
            }
        } else {
            withAnimation(Animation.easeOut(duration: animationDuration * 0.75)) {
                yScale = 0.4
                xScale = 1
                yOffset = UIScreen.main.bounds.height * 0.8
            }
        }
        isOff.toggle()
    }
    
    func switchModes() {
        if appMode == .light {
            withAnimation(Animation.easeOut(duration: animationDuration * 0.75)) {
                appMode = .dark
                isOff = true
            }
            
        } else {
            withAnimation(Animation.easeOut(duration: animationDuration * 0.75)) {
            appMode = .light
            isOff = false
            }
        }
    }
}


struct LightSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        LightSwitchView()
    }
}
