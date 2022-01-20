//
//  LottieWrapper.swift
//  glare
//
//  Created by NAVEEN MADHAN on 1/19/22.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    @State var fileName = "nil"
    var loopMode: LottieLoopMode = .loop
    var contentMode: UIView.ContentMode = .scaleAspectFit
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView(frame: .zero)
        
        let animationView: AnimationView = AnimationView()
        let animation = Animation.named(fileName)
        animationView.animation = animation
        animationView.loopMode = loopMode
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.shouldRasterizeWhenIdle = true
        
        animationView.contentMode = contentMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) { }
    
    func dismantleUIViewController(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        print("LottieView Dismantle\(fileName)")
    }
    
}
