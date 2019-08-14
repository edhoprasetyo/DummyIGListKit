//
//  NamaNamaSectionController.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import AsyncDisplayKit

class NamaNamaSectionController: ListSectionController {
    var namanama: NamaNamaModel?
    
    internal override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: "labelCollectionViewCell", bundle: .main, for: self, at: index)
        
        if let cell = cell as? labelCollectionViewCell {
            cell.labeled.text = namanama?.namaku
            cell.imageView.image = namanama?.image
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    override func didUpdate(to object: Any) {
        namanama = object as? NamaNamaModel
    }
}
