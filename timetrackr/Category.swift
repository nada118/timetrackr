//
//  Category.swift
//  timetrackr
//
//  Created by Nada Al-Alusi on 12/3/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class Category {
    var name: String
    var goal: String
    var startTime:Double? = nil
    var totalTime:Double
    var timing: Bool
    var timeLabel:String
    
    //MARK: Initialization
     init?(name: String, goal: String){
        self.name = name
        self.goal = goal
        self.timing = false
        if name.isEmpty || goal.isEmpty {
            return nil
        }
        self.totalTime = 0
        self.timeLabel = "Completed: 0 Hours"
        
    }


}
