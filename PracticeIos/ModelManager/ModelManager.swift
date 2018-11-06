//
//  ModelManager.swift
//  PracticeIos
//
//  Created by Apple on 2018-11-05.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import Foundation
import RxSwift



protocol ModelManager {
    typealias FinishingClosure = ([Todos]) -> Void
    
    func refreshTodos(finisher: @escaping FinishingClosure) -> Void
}

class ModelManagerImpl: ModelManager {
    
    let parser: Parser
    let networking: Networking?
    let bag = DisposeBag();
    
    init(p: Parser, net: Networking) {
        parser = p
        networking = net
    }
    
    // will subscribe to the networking class to get todos data
    // will call parser to parse the data into Todo objects
    // will delegate the list of todos back to the view model layer
    func refreshTodos(finisher: @escaping FinishingClosure) {
        
        self.networking!.loadTodos().asObservable().subscribe(
            onNext: {[weak self] data in
                    //check for data
                guard let raw = data else {return}
            
                //check for self
                guard let strongSelf = self else{ return }
            
                //here we will do the parsing
                guard let todos = try? strongSelf.parser.decode(to: [Todos].self, from: raw) else {return}
                
                finisher(todos!)
                
            }, onError:{ error in
                print("Eror loading data")
            }, onCompleted: {
                print("completed")
            }).disposed(by: bag)
        
    }
    
}
