//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by İbrahim Doğan on 11.05.2020.
//  Copyright © 2020 Ibrahim Dogan. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var toDoName: UILabel!
    var toDo = ToDo()
    
    var todoTableVC: ToDoTableViewController? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if toDo.important {
            toDoName.text = "❗️" + toDo.name
        } else {
            toDoName.text = toDo.name
        }
        
    }
    @IBAction func completeTapped(_ sender: Any) {
        
        if let toDos = todoTableVC?.toDos {
            var index = 0
            for x in toDos {
                if x.name == toDo.name {
                    todoTableVC?.toDos.remove(at: index)
                    todoTableVC?.tableView.reloadData()
                    
                    navigationController?.popViewController(animated: true)
                    return
                }
                index += 1
            }
        }
    }

}
