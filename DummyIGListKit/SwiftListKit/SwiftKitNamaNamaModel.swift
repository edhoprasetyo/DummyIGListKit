//
//  SwiftKitNamaNamaModel.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import Foundation

struct SwiftKitNamaNamaModel {
    let id = UUID().uuidString
    let namaku: String
    
    init(namakuadalah: String) {
        self.namaku = namakuadalah
    }
}

extension SwiftKitNamaNamaModel: Diffable, Equatable {
    var diffIdentifier: String {
        return id
    }
}
