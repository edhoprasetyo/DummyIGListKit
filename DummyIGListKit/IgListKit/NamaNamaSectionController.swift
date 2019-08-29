//
//  NamaNamaSectionController.swift
//  DummyIGListKit
//
//  Created by nakama on 15/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import IGListKit

class NamaNamaSectionController: ListSectionController {
    var namanama: NamaNamaModel?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: "labelCollectionViewCell", bundle: .main, for: self, at: index)
        
        if let cell = cell as? labelCollectionViewCell {
            cell.labeled.text = namanama?.namaku
            cell.imageView.image = namanama?.image
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    override func didUpdate(to object: Any) {
        namanama = object as? NamaNamaModel
    }
}