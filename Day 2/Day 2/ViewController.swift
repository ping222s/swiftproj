//
//  ViewController.swift
//  Day 2
//
//  Created by Ios8dian on 2017/9/20.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSCollectionViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    // MARK: NSCollectionViewDataSource
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier:"CollectionViewItem", for: indexPath);
        return item;
    }
}

