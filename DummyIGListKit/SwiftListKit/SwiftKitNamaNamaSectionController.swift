//
//  SwiftKitNamaNamaSectionController.swift
//  DummyIGListKit
//
//  Created by nakama on 15/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import AsyncDisplayKit

class SwiftKitNamaNamaSectionController: SectionController<SwiftKitNamaNamaModel> {
    
    override func nodeForItem(at _: Int, value _: SwiftKitNamaNamaModel) -> ASCellNode {
        return SwiftKitNamaNamaCell(namanama: value)
    }
}


