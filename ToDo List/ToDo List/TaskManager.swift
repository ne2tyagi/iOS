//
//  TaskManager.swift
//  ToDo List
//
//  Created by Neetu Tyagi on 11/02/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import UIKit
var taskMgr = TaskManager()
class TaskManager: UIViewController {

    struct Task{
        var name:String
        var description:String
    }
    var tasks = [Task]()
    //taskMgr.tasks.append(Task(name: "name", description: "description"))
    func addTask(name: String, description:String){
        tasks.append(Task(name: name, description: description))
    }
    
    
}
