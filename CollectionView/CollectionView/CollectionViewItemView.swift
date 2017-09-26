//
//  CollectionViewItemView.swift
//  CollectionView
//
//  Created by Ios8dian on 2017/9/26.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class CollectionViewItemView: NSView {

    @IBOutlet weak var lblField: NSTextField!
    @IBOutlet weak var imgv: NSImageView!
    
    var mouseInside: Bool = false {
        didSet {
            needsDisplay = true
        }
    }
    
    override func awakeFromNib() {
        wantsLayer = true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        layer?.backgroundColor = NSColor.red.cgColor
        
        if mouseInside {
            layer?.backgroundColor = NSColor.yellow.cgColor
        }
        
    }
    
    public func setModel(_ string: String){
        lblField?.stringValue = string as String
        imgv?.image = NSImage(named: "Star")
    }
    
}
