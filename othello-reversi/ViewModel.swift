//
//  ViewModel.swift
//  othello-reversi
//
//  Created by Yoshiki Izumi on 2020/05/23.
//  Copyright © 2020 Yoshiki Izumi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewModel {
    private let disposeBag = DisposeBag()
    var background: Observable<UIColor> = Observable.just(UIColor.green)
    var put1: Observable<UIColor> = Observable.just(UIColor.green)
    var put2: Observable<UIColor> = Observable.just(UIColor.green)
    var model: ModelProtocol
    
        
    init(boardTappedXObservable: Observable<Data>, model: ModelProtocol) {

        self.model = model
        

        self.model.putColor1.subscribe(onNext: { UIColor in
            self.put1 = Observable.just(UIColor)
        }).disposed(by: disposeBag)

        self.model.putColor2.subscribe(onNext: { UIColor in
            self.put2 = Observable.just(UIColor)
        }).disposed(by: disposeBag)

        self.model.backgroundColor.subscribe(onNext: { UIColor in
            self.background = Observable.just(UIColor)
        }).disposed(by: disposeBag)
    }
}
