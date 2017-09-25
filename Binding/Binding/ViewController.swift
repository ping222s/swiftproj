//
//  ViewController.swift
//  Binding
//
//  Created by Ios8dian on 2017/9/25.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var nameList :[User] = []
    var curUser :User?
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var firstNameField: NSTextField!
    @IBOutlet weak var lastNameField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

extension ViewController: NSTableViewDelegate{
    func tableViewSelectionDidChange(_ notification: Notification) {
        let user = nameList[tableView.selectedRow]
        
        curUser = user
        
        firstNameField.stringValue = user.firstName
        lastNameField.stringValue = user.lastName
        
    }
}

extension ViewController: NSTextFieldDelegate{
    
    override func controlTextDidChange(_ obj: Notification) {
        curUser?.firstName = firstNameField.stringValue
        curUser?.lastName = lastNameField.stringValue
        
        let user = nameList[tableView.selectedRow]
        print(user.firstName)
    }
}
