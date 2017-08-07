//
//  FirstViewController.swift
//  To Do List
//
//  Created by Vladislav Fedotovskiy on 29.03.16.
//  Copyright © 2016 Vladislav Fedotovskiy. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var toDoListTable: UITableView!
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    

    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            toDoList.remove(at: indexPath.row)
            
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
        }
        
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (UserDefaults.standard.object(forKey: "toDoList") != nil) {
        
        toDoList = UserDefaults.standard.object(forKey: "toDoList") as! [String]
        
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        toDoListTable.reloadData()
    }

}

