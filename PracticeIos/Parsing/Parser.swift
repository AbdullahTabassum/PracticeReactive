//
//  Parser.swift
//  PracticeIos
//
//  Created by Apple on 2018-11-05.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import Foundation

protocol Parser {
    func decode<T: Decodable>(to: T.Type, from: Data? ) -> T?
}

struct ParerImpl: Parser {
    
    func decode<T: Decodable>(to: T.Type, from: Data? ) -> T? {
        
        guard let data = from else {return nil}
        
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let parsedData = try? decoder.decode(to, from: data) else {return nil}
        
        return parsedData
    }
}
