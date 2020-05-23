//
//  Model.swift
//  othello-reversi
//
//  Created by Yoshiki Izumi on 2020/05/23.
//  Copyright © 2020 Yoshiki Izumi. All rights reserved.
//

import RxSwift

enum ModelError: Error {
    case invalidId
}

protocol ModelProtocol {
    var backgroundColor: Observable<UIColor> { get }
    var putColor1: Observable<UIColor> { get }
    var putColor2: Observable<UIColor> { get }

}

// モデル
final class Model: ModelProtocol {
        
    var backgroundColor: Observable<UIColor> {
        return Observable.just(UIColor.init(red: 0, green: 0.5, blue: 0, alpha: 1.0))
    }
    var putColor1: Observable<UIColor> {
        return Observable.just(UIColor.white)
    }
    var putColor2: Observable<UIColor> {
        return Observable.just(UIColor.black)
    }

}

