//
//  ToDoItemTableViewCell.swift
//  POP
//
//  Created by jc.kim on 7/25/22.
//

import UIKit


class ToDoItemTableViewCell: UITableViewCell {
    @IBOutlet var isDone: UISwitch!
    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var updatedAt: UILabel!
    
    weak var toggable: Toggable?
    
    @IBAction func onToggle(_ sender: UISwitch) {
        toggable?.toggle(withId: todo.id)
    }
    
    var todo: ToDo {
        get {
            self.todo
        }
        set {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
            
            itemTitle.text = newValue.title
            isDone.isOn = newValue.done
            updatedAt.text = formatter.string(from: newValue.createdAt)
        }
    }
}
