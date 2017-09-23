//
//  TableViewController.swift
//  ArrayController
//
//  Created by Ios8dian on 2017/9/23.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class TableViewController: NSViewController,NSTextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBOutlet var ArrayController: NSArrayController!
    
    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var ageTextField: NSTextField!
    
    @IBAction func clickAdd(_ sender: Any) {
        
        let name = nameTextField.stringValue.trimmingCharacters(in: .whitespaces)
        let age = Int(ageTextField.stringValue.trimmingCharacters(in: .whitespaces))
        if  ageTextField.stringValue.trimmingCharacters(in: .whitespaces).isEmpty || nameTextField.stringValue.trimmingCharacters(in: .whitespaces).isEmpty {
            return
        }
        
        let person = Person(name: name,age: age!)
        ArrayController.addObject(person)
        
        nameTextField.stringValue = ""
        ageTextField.stringValue = ""
        
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: - NSTextFieldDelegate
    
}
