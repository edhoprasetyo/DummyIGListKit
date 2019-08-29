//
//  SwiftKitNamaNamaModel.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import Foundation
import UIKit

struct SwiftKitNamaNamaModel {
    let id: String
    let namaku: String
    let image: UIImage
    
    init(id: String, namakuadalah: String, image: UIImage) {
        self.id = id
        self.namaku = namakuadalah
        self.image = image
    }
}

extension SwiftKitNamaNamaModel: Diffable, Equatable {

    var diffIdentifier: String {
        return id
    }
}
