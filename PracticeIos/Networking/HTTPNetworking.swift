//
//  HTTPNetworking.swift
//  PracticeIos
//
//  Created by Apple on 2018-11-05.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import Foundation
import RxSwift

protocol Networking {
    func loadTodos() -> RxSwift.Observable<Data?>
}

struct HTTPNetworking: Networking {
    
    func loadTodos() -> Observable<Data?> {
        
        return Observable<Data?>.create() { observer in
            
            guard let url: URL = URL(string: Endpoints.TODOS.GET_TODOS) else {return Disposables.create{
                //clean up
                }}
            let urlSessionTest = URLSession.shared.dataTask(with: url) { data, httpResponse, error in
                guard let dataJSON = data else {observer.onCompleted(); return}
                
                observer.onNext(dataJSON)
            }
            
            urlSessionTest.resume()
            
            return Disposables.create{
                //clean up
                urlSessionTest.cancel()
            }
            
        }
    }
    
}
