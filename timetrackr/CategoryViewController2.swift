//
//  CategoryViewController2.swift
//  timetrackr
//
//  Created by Nada Al-Alusi on 12/5/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class CategoryViewController2: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var categoryTextField: UITextField!

    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var timerButton: UIButton!
    var category:Category?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        goalTextField.keyboardType = UIKeyboardType.numberPad
        categoryTextField.delegate = self
        goalTextField.delegate = self
        
        if let category = category {
            navigationItem.title = category.name
            goalTextField.text = category.goal
            categoryTextField.text = category.name
            
            
            if category.timing {
                timerButton.setTitle("End Timer", for: .normal)
            } else {
                timerButton.setTitle("Start Timer", for: .normal)

            }
            
        } else {
            timerButton.setTitle("Start Timer", for: .normal)

        }
        
        categoryTextField.addTarget(self, action: #selector(CategoryViewController2.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        
        goalTextField.addTarget(self, action: #selector(CategoryViewController2.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        
        checkValidCategoryName()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func time(_ sender: Any) {
        print("button is hit")
        if (category != nil){
            category!.timing = !category!.timing
            if category!.timing {
                //just started timer
                timerButton.setTitle("End Timer", for: .normal)
                category!.startTime = Double(CFAbsoluteTimeGetCurrent())
            } else {
                //just ended timer
                timerButton.setTitle("Start Timer", for: .normal)
                let diff = (CFAbsoluteTimeGetCurrent() - category!.startTime!)
                category!.totalTime += diff
                let (h, m) = secondsToHoursMinutes(seconds: Int(category!.totalTime))
                category!.timeLabel = "Completed: " + String(h) + " Hours and " + String(m) + " Minutes"
                print(category!.timeLabel)
                
            }
            
        } else{
            category = Category(name: "a", goal: "0")
            category!.startTime = Double(CFAbsoluteTimeGetCurrent())
            category!.timing = true
            timerButton.setTitle("End Timer", for: .normal)
            
        }
        self.reloadInputViews()
        
    }
    
    func secondsToHoursMinutes (seconds : Int) -> (Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60)
    }
    
    // MARK: - Navigation

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentInAddCatMode = presentingViewController is UINavigationController
        
        if isPresentInAddCatMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
        
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if saveButton! == sender! as! UIBarButtonItem {
            let nameText = categoryTextField.text ?? ""
            let goalText = goalTextField.text ?? ""
            var newtimelabel = "Completed: 0 Hours"
            var newtiming = false
            var newstarttime:Double? = nil
            var newtotaltime = Double(0)
            if (category != nil) {
                newtimelabel  = category!.timeLabel
                newtiming = category!.timing
                newstarttime = category!.startTime
                newtotaltime = category!.totalTime
            }
            
            category = Category(name: nameText, goal: goalText)
            category!.timeLabel = newtimelabel
            category!.timing = newtiming
            category!.startTime = newstarttime
            category!.totalTime = newtotaltime
        }
    }
    
    //Mark: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        checkValidCategoryName()
        navigationItem.title = textField.text
    }
    
    func textFieldDidChange(_ textField: UITextField){
        checkValidCategoryName()
    }
    
    
    
    func checkValidCategoryName(){
        let text = categoryTextField.text ?? ""
        let textgoal = goalTextField.text ?? ""
        var check = true
        if (!textgoal.isEmpty){
            check = goalTextField.text!.characters.count <= 2
            let startIndex = goalTextField.text!.startIndex
            let start = goalTextField.text![startIndex]
            let end = goalTextField.text!.characters.last!
            if (goalTextField.text!.characters.count == 2 && (start != "2" && start != "1")) {
                check = false
            }
            if (goalTextField.text!.characters.count == 2 && start == "2" && (end == "9" || end == "8"
                || end == "7" || end == "6" || end == "5")) {
                    check = false
                }

        }
        saveButton.isEnabled = !text.isEmpty && !textgoal.isEmpty && check
    }
    

}
