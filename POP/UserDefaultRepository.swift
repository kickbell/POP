//
//  UserDefaultRepository.swift
//  POP
//
//  Created by jc.kim on 7/26/22.
//

import Foundation

class UserDefaultRepository: Repository {
    private let TodoKey = "todos"
    private var database: UserDefaults { UserDefaults.standard }

    func load() -> [ToDo] {
        guard let json = UserDefaults.standard.string(forKey: TodoKey),
              let data = json.data(using: .utf8) else {
            return []
        }
        return (try? JSONDecoder().decode([ToDo].self, from: data)) ?? []
    }

    func save(todos: [ToDo]) {
        guard let data = try? JSONEncoder().encode(todos),
              let json = String(data: data, encoding: .utf8) else {
            return
        }
        UserDefaults.standard.set(json, forKey: TodoKey)
    }
}
