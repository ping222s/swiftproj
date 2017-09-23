//
//  ViewController.swift
//  Day 3
//
//  Created by Ios8dian on 2017/9/20.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class ViewController: NSViewController ,NSTableViewDataSource,NSTextFieldDelegate{

    @IBOutlet weak var TableView: NSTableView!
    
    var strings = ["1111","2222","3333","44444","5555555"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func clickpush(_ sender: Any) {
    }
    @IBOutlet weak var TextField: NSTextField!
    
    @IBAction func clickButoon(_ sender: Any?) {
        if TextField.stringValue.trimmingCharacters(in: .whitespaces).isEmpty {
            return
        }
        strings.append(TextField.stringValue)
        TextField.stringValue = ""
        TableView.reloadData()
    }
    
    // MARK: NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return strings.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return strings[row];
    }

    // MARK: NSTextFieldDelegate
    override func controlTextDidEndEditing(_ obj: Notification) {
        clickButoon(nil)
    }

}

