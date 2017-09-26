//
//  CollectionViewItem.swift
//  CollectionView
//
//  Created by Ios8dian on 2017/9/26.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {
    
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            updateColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    public func setModel(_ string: String){
        (view as? CollectionViewItemView)?.setModel(string)
    }
    
    func updateColor() {
        if isSelected {
            switch highlightState {
            case .none, .forDeselection:
                view.layer?.backgroundColor = NSColor.red.cgColor
                break
            case .forSelection:
                view.layer?.backgroundColor = NSColor.green.cgColor
                break
            default:break
                
            }
        }else {
            view.layer?.backgroundColor = NSColor.red.cgColor
        }
    }
    
    func setBackground(_ highlight: Bool) {
        (view as? CollectionViewItemView)?.mouseInside = highlight
    }
}
