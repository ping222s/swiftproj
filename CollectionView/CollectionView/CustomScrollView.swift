//
//  CustomScrollView.swift
//  CollectionView
//
//  Created by Ios8dian on 2017/9/26.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class CustomScrollView: NSScrollView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func awakeFromNib() {
        let area = NSTrackingArea(rect: bounds, options: [.inVisibleRect, .activeAlways, .mouseMoved], owner: self, userInfo: nil)
        addTrackingArea(area)
    }
    
    override func scrollWheel(with event: NSEvent) {
        super.scrollWheel(with: event)
    }
    
    override func mouseMoved(with event: NSEvent) {
        var pointInView = convert(event.locationInWindow, from: nil)
        pointInView.y += documentVisibleRect.origin.y
        
        if let collectionView = documentView as? NSCollectionView {
            
            for item in collectionView.visibleItems() {
                (item as? CollectionViewItem)?.setBackground(false)
            }
            
            if let indexPath = collectionView.indexPathForItem(at: pointInView) {
                if let item = collectionView.item(at: indexPath) as? CollectionViewItem {
                    item.setBackground(true)
                }
            }
        }
    }
}
