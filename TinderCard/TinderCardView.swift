//
//  TinderCardView.swift
//  TinderCard
//
//  Created by HideakiTouhara on 2018/02/25.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import Foundation

public protocol TinderCardViewDataSource: class {
    func numberOfCards(_ tinderCard: TinderCardView) -> Int
    func tinderCard(_ tinderCard: TinderCardView, viewForCardAt index: Int) -> UIView
}

open class TinderCardView: UIView {
    
    public weak var dataSource: TinderCardViewDataSource? {
        didSet {
            setUp()
        }
    }
    private func setUp() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        print("pan")
        let location = sender.translation(in: self)
        self.center = CGPoint(x: self.center.x + location.x, y: self.center.y + location.y)
    }
}
