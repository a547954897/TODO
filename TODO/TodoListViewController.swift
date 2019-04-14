//
//  ViewController.swift
//  TODO
//
//  Created by mac on 2019/4/14.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = ["购买水杯","吃药","修改密码"]
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
       
        let alert = UIAlertController(title: "添加一个新的ToDo项目", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "添加项目", style: .default){(action) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField{(alertTextField) in alertTextField.placeholder = "创建一个新项目..."
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

