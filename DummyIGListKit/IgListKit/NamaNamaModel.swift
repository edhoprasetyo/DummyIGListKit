//
//  NamaNamaModel.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import IGListKit

class NamaNamaModel {
    let namaku: String
    
    init(namakuadalah: String) {
        self.namaku = namakuadalah
    }
}

extension NamaNamaModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return namaku as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let object = object as? NamaNamaModel {
            return namaku == object.namaku
        }
        return false
    }
}
