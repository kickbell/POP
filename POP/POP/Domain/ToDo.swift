//
//  ToDo.swift
//  POP
//
//  Created by jc.kim on 7/25/22.
//

import Foundation

struct ToDo: Identifiable {
    var id: String
    var title: String
    var done: Bool
    let createdAt: Date
}
