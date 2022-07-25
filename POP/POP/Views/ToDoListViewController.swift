//
//  ToDoListViewController.swift
//  POP
//
//  Created by jc.kim on 7/25/22.
//

import UIKit

class ToDoListViewController: UITableViewController {
    let service: ToDoService

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateNewItem", let toVC = segue.destination as? AddItemViewController {
            toVC.createdItem = { [weak self] title, createdAt in
                self?.service.create(title: title)
                self?.tableView.reloadData()
            }
        }
    }
}

extension ToDoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.service.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as? ToDoItemTableViewCell else {
            fatalError("tableViewCell has not dequeued!")
        }

        let item = service.item(at: indexPath.row)
        cell.todo = item
        return cell
    }
}

