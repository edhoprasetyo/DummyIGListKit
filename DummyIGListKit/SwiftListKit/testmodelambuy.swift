//
//  testmodelambuy.swift
//  DummyIGListKit
//
//  Created by nakama on 19/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import Foundation
import UIKit

struct testmodelambuy {
    let id: String
    let namaku: String
    let image: UIImage
    
    init(id: String, namakuadalah: String, image: UIImage) {
        self.id = id
        self.namaku = namakuadalah
        self.image = image
    }
}

extension testmodelambuy: Diffable, Equatable {
    
    var diffIdentifier: String {
        return id
    }
}
