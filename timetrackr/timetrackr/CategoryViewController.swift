//
//  ViewController.swift
//  timetrackr
//
//  Created by Nada Al-Alusi on 12/3/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var goalTextField3: UITextField!

    @IBOutlet weak var nameTextField: UITextField!
    
    var category : Category?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        goalTextField3.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
    }

    @IBAction func createCategory(_ sender: Any) {
    }
}

