//
//  CreateToDoViewController.swift
//  ToDo List
//
//  Created by İbrahim Doğan on 11.05.2020.
//  Copyright © 2020 Ibrahim Dogan. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    var todoTableVC: ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToDo(_ sender: Any) {
        let newToDo = ToDo()
        if let name = nameTextField.text {
            newToDo.name = name
            newToDo.important = importantSwitch.isOn
            todoTableVC?.toDos.append(newToDo)
            todoTableVC?.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}
