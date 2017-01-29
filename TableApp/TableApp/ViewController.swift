//
//  ViewController.swift
//  TableApp
//
//  Created by Neetu Tyagi on 18/01/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let subjects = ["Physics","Chemistry", "Maths", "English", "Hindi", "Social Science", "Geography"]
    let grade = ["Class I", "Class II", "Class III"]
    @IBOutlet weak var tblV: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       self.tblV.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
        tblV.delegate = self;
        tblV.dataSource = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return subjects.count
        }else{
            return grade.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if(indexPath.section == 0){
            cell.textLabel?.text = subjects[indexPath.row]
        }else{
            cell.textLabel?.text = grade[indexPath.row]
        }
        
        cell.backgroundColor = UIColor.cyan
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selected row: \(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit Row") { (action, indexPath) in
            print("Edit tapped for \(indexPath.row)")
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete Row") { (action, indexPath) in
            print("Delete tapped for \(indexPath.row)")
        }
        editAction.backgroundColor = UIColor.yellow;
        
        
        return [editAction, deleteAction]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSp :CGFloat = 50.0
        return cellSp
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Subjects"
        }
        else{
            return "Grades"
        }
    }
}

