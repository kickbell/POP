//
//  ToDoService.swift
//  POP
//
//  Created by jc.kim on 7/25/22.
//

import Foundation

protocol ToDoService {
    func create(title: String)
    func count() -> Int
    func item(at: Int) -> ToDo
}
