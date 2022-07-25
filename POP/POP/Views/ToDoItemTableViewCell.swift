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
}
