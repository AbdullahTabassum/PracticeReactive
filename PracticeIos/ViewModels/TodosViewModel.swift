//
//  TodosViewModel.swift
//  PracticeIos
//
//  Created by Apple on 2018-11-05.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import Foundation
import RxSwift

class TodosViewModel {
    
    private let modelManager : ModelManager?
    
    var todos = Variable<[Todos]>([])
    
    init(mm: ModelManager) {
        modelManager = mm
    }
    
    func refreshTodos() {
        self.modelManager?.refreshTodos{ [weak self] refreshedTodos in
            self?.todos.value = refreshedTodos
        }
    }
    
}
