//
//  GameViewController.swift
//  othello-reversi
//
//  Created by Yoshiki Izumi on 2020/05/23.
//  Copyright © 2020 Yoshiki Izumi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Data {
    var tag: Int = 0
    var turn: Int = 0
}

class GameViewController: UIViewController, UIGestureRecognizerDelegate, MyImageViewDelegate {

    @IBOutlet weak var board: UIStackView!
    
    private let boardTapped = PublishRelay<Data>()

    private let disposeBag = DisposeBag()
    
    lazy var viewModel = ViewModel(
        boardTappedXObservable: boardTapped.asObservable(), model: Model()
    )

    var turn = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.boardTapped.subscribe(onNext: { data in
            let v = self.board.subviews[data.tag / 8].subviews[data.tag % 8] as! MyImageView
            if data.turn % 2 == 0 {
                self.viewModel.put1.bind(to: v.rx.backgroundColor).disposed(by: self.disposeBag)
            } else {
                self.viewModel.put2.bind(to: v.rx.backgroundColor).disposed(by: self.disposeBag)
            }
        }).disposed(by: disposeBag)
        
        var tagCount = 0
        for views in board.subviews {
            for view in views.subviews {
                let v = view as! MyImageView
                v.delegate = self   
                v.tag = tagCount
                viewModel.background.bind(to: v.rx.backgroundColor).disposed(by: disposeBag)
                tagCount += 1
            }
        }
    }
    
    func touchBeganInside(tag: Int) {
        let data = Data()
        data.tag = tag
        turn += 1
        data.turn = turn
        boardTapped.accept(data)
    }
}
