//
//  BlurView.swift
//  test_2
//
//  Created by 杨杰 on 2021/12/7.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    

}
