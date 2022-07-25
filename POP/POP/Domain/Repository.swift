//
//  Repository.swift
//  POP
//
//  Created by jc.kim on 7/26/22.
//

import Foundation

protocol Repository {
    func load() -> [ToDo]
    func save(todos: [ToDo])
}
