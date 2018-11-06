//
//  StackChoiceButtons.swift
//  PracticeIos
//
//  Created by Apple on 2018-11-04.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class StackChoiceButtons: UIView {
    
    let selection = Variable<String>("empty")
    
    //will have four buttons
    let button1: UIButton
    let button2: UIButton
    let button3: UIButton
    let button4: UIButton
    
    //will have a stack view to organize the buttons
    let stack: UIStackView
    
    let rxBag = DisposeBag()
    
    init(name1: String, name2: String, name3: String, name4: String) {
        button1 = UIButton()
        button1.setTitle(name1, for: .normal)
        
        button2 = UIButton()
        button2.setTitle(name2, for: .normal)
       
        button3 = UIButton()
        button3.setTitle(name3, for: .normal)
        
        button4 = UIButton()
        button4.setTitle(name4, for: .normal)
        
        stack = UIStackView(arrangedSubviews: [])
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        self.layoutViews()
        self.setupListeners()
        
    }
    
    private func setupListeners() {
        
        button1.rx.tap.debounce(1.0, scheduler: MainScheduler.instance).subscribe(  onNext: { [weak self] in
            print("button1 was presed")
            self?.selection.value = "first"
        }).disposed(by: rxBag)
        
        button2.rx.tap.debounce(1.0, scheduler: MainScheduler.instance).subscribe(  onNext: { [weak self] in
            print("button2 was presed")
            self?.selection.value = "second"
        }).disposed(by: rxBag)
        
        button3.rx.tap.debounce(1.0, scheduler: MainScheduler.instance).subscribe(  onNext: { [weak self] in
            print("button3 was presed")
            self?.selection.value = "third"
        }).disposed(by: rxBag)
        
        button4.rx.tap.debounce(1.0, scheduler: MainScheduler.instance).subscribe(  onNext: { [weak self] in
            print("button4 was presed")
            self?.selection.value = "fourth"
        }).disposed(by: rxBag)
        
    }
    
    private func layoutViews() {
        self.backgroundColor = .brown
        
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.backgroundColor = .white
    
        self.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        stack.addArrangedSubview(button1)
        stack.addArrangedSubview(button2)
        stack.addArrangedSubview(button3)
        stack.addArrangedSubview(button4)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    public func rx() -> Observable<String> {
        return self.selection.asObservable()
    }
}
