//
//  FirstViewController.swift
//  ToDo List
//
//  Created by Neetu Tyagi on 11/02/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblVU: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional hash after loading the view, typically from a nib.
        self.tblVU.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        tblVU.delegate = self
        tblVU.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ Animated: Bool){
        print("RELOADING VIEW \(taskMgr.tasks.count)")
        tblVU.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete){
            print("delete row \(indexPath.row)")
            taskMgr.tasks.remove(at: indexPath.row)
            tblVU.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print("tasks\(taskMgr.tasks.count)")
        return taskMgr.tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "default")
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].description
        return cell
    }
}

