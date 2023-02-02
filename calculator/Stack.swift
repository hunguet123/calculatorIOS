//
//  Stack.swift
//  calculator
//
//  Created by Hà Quang Hưng on 02/02/2023.
//

import Foundation

struct Stack {
    fileprivate var array: [String] = []
    
    mutating func push(_ element: String) {
        array.append(element)
    }
    
    mutating func pop()-> String? {
        return array.popLast()
    }
    
    mutating func peek()-> String? {
        return array.last
    }
    
    mutating func isEmpty()-> Bool {
        return array.isEmpty
    }
    
    mutating func count()-> Int {
        return array.count
    }
}
