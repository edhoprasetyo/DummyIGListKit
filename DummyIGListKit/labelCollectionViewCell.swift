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
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 25
        imageView.contentMode = .scaleAspectFill
        backgroundColor = .white
    }
}
