//
//  Blur Component.swift
//  glare
//
//  Created by NAVEEN MADHAN on 1/19/22.
//

import Foundation
import SwiftUI

struct BlurView: UIViewRepresentable {

    init(style: UIBlurEffect.Style) {
        self.style = style
    }

    private let style: UIBlurEffect.Style

    typealias Context = UIViewRepresentableContext<BlurView>

    func makeUIView(context: Context) -> UIView { createView() }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

// MARK: - Test Extensions
extension BlurView {

    func createView() -> UIView {
        let view = UIView(frame: .zero)
        let blurView = createBlurView()
        add(blurView, to: view)
        return view
    }
}

// MARK: - Private Extensions
extension BlurView {

    func add(_ blurView: UIVisualEffectView, to view: UIView) {
        view.backgroundColor = .clear
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    func createBlurView() -> UIVisualEffectView {
        let effect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: effect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIBlurEffect.Style {

    static var allCases: [UIBlurEffect.Style] {
        [
            .regular,
            .prominent,

            .systemUltraThinMaterial,
            .systemThinMaterial,
            .systemMaterial,
            .systemThickMaterial,
            .systemChromeMaterial,

            .systemUltraThinMaterialLight,
            .systemThinMaterialLight,
            .systemMaterialLight,
            .systemThickMaterialLight,
            .systemChromeMaterialLight,

            .systemUltraThinMaterialDark,
            .systemThinMaterialDark,
            .systemMaterialDark,
            .systemThickMaterialDark,
            .systemChromeMaterialDark,

            .extraLight,
            .light,
            .dark
        ]
    }
}

extension View {

    func systemBlur(style: UIBlurEffect.Style) -> some View {
        overlay(BlurView(style: style))
    }
}
