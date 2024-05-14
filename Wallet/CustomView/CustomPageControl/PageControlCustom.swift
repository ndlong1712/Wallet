//
//  PageControlCustom.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import Foundation
import SwiftUI

struct PageControlCustom: UIViewRepresentable {
    @Binding var currentPage: Int
    let numberOfPages: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = .black
        page.numberOfPages = numberOfPages
        page.pageIndicatorTintColor = .gray
        page.isUserInteractionEnabled = false
        page.addTarget(context.coordinator, action: #selector(Coordinator.pageChanged), for: .valueChanged)
        return page
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
        uiView.numberOfPages = numberOfPages
    }
    
    func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }
    
    class Coordinator: NSObject {
        var parent: PageControlCustom
        
        init(_ parent: PageControlCustom) {
            self.parent = parent
        }
        
        @objc func pageChanged(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
        }
    }
}
