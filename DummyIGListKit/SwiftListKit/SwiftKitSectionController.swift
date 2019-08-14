//
//  SwiftKitSectionController.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import AsyncDisplayKit

class SwiftKitSectionController: SectionController<SwiftKitNamaNamaModel> {
    
    override func nodeForItem(at _: Int, value _: SwiftKitNamaNamaModel) -> ASCellNode {
        guard let data = value else { return ASCellNode() }
        return SwiftKitNamaNamaCell(namanama: data)
    }
}

class SwiftKitNamaNamaCell: ASCellNode {
    let textNode = ASTextNode()
    
    init(namanama: SwiftKitNamaNamaModel) {
        super.init()
        automaticallyManagesSubnodes = true
        textNode.attributedText = NSAttributedString(string: namanama.namaku, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: textNode)
    }
}
