//
//  labelCollectionViewCell.swift
//  DummyIGListKit
//
//  Created by nakama on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import UIKit

class labelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labeled: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .yellow
    }
}
