//
//  MyImageView.swift
//  othello-reversi
//
//  Created by Yoshiki Izumi on 2020/05/23.
//  Copyright © 2020 Yoshiki Izumi. All rights reserved.
//

import UIKit
import RxSwift

class MyImageView: UIImageView {
    public weak var delegate: MyImageViewDelegate?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.touchesBegan(touches, with: event)
        
        delegate?.touchBeganInside(tag: tag)
    }
}

public protocol MyImageViewDelegate: class {
    func touchBeganInside(tag: Int)
}
