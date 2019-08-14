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
    let id = UUID().uuidString
    let namaku: String
    let image: UIImage
    
    init(namakuadalah: String, image: UIImage) {
        self.namaku = namakuadalah
        self.image = image
    }
}
