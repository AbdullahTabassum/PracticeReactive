//
//  ViewController.swift
//  PracticeIos
//
//  Created by Apple on 2018-11-01.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    var tvm : TodosViewModel!;
    
    let bag = DisposeBag()
    
    var choices: StackChoiceButtons!;
    
    override func loadView() {
        let screen = UIScreen().bounds
        
        choices = StackChoiceButtons(name1: "choice one",
                           name2: "choice2", name3: "choice 3",
                           name4: "choice 4")
        
        let tempView: UIView = QuestionaireView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height), choicesView: choices)
        
        tvm = TodosViewModel(mm: ModelManagerImpl(p: ParerImpl(), net: HTTPNetworking()))
        
        self.view = tempView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvm.todos
           .asObservable()
           .subscribe(onNext: { todosArray in
            
                for todo in todosArray {
                    print("Todo: \(todo)")
                }
                    
            }).disposed(by: bag)
        
        tvm.refreshTodos()
        
        self.choices.rx()
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe( onNext: { [weak self] value in
                print("this is the value for the selection: \(value)")
            }).disposed(by: bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

