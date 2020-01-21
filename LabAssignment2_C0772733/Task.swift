//
//  Task.swift
//  LabAssignment2_C0772733
//
//  Created by MacStudent on 2020-01-21.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
 
class Task {
    
    internal init(tasks: String, days: Int, date: Date, desc: String) {
        self.tasks = tasks
        self.days = days
        self.date = date
        self.desc = desc
    }
    
    
    var tasks: String
    var days: Int
    var date : Date
    var desc: String
}
