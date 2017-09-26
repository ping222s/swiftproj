//
//  ViewController.swift
//  CollectionView
//
//  Created by Ios8dian on 2017/9/26.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var strings = ["aa","bb","cc","dd","ee","ff","gg","hh","ii","jj","kk"]
    
    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.backgroundColors = [NSColor.gray]
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSCollectionViewDelegate {
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print(indexPaths)
        
    }
}

extension ViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return strings.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: "CollectionViewItem", for: indexPath)
        
        if item is CollectionViewItem {
            let it = item as! CollectionViewItem
            it.setModel(strings[indexPath.item])
        }
        return item
    }
    
}

