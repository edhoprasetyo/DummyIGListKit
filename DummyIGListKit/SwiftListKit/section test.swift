//
//  section test.swift
//  DummyIGListKit
//
//  Created by nakama on 19/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import AsyncDisplayKit

class SectionTest: SectionController<testmodelambuy> {
    
    override func nodeForItem(at _: Int, value _: testmodelambuy) -> ASCellNode {
        return testCell(namanama: value)
    }
}
