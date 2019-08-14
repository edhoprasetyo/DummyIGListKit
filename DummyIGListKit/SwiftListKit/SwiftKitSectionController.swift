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
    let image: ASImageNode = {
        let node = ASImageNode()
        node.style.preferredSize = CGSize(width: 100, height: 100)
        node.cornerRadius = 50
        return node
    }()
    
    init(namanama: SwiftKitNamaNamaModel) {
        super.init()
        style.width = ASDimensionMake("100%")
        automaticallyManagesSubnodes = true
        textNode.attributedText = NSAttributedString(string: namanama.namaku, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textNode.style.flexGrow = 1
        image.image = namanama.image
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stacks = ASStackLayoutSpec(direction: .horizontal,
                                       spacing: 0,
                                       justifyContent: .start,
                                       alignItems: .center,
                                       children: [textNode, image])
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: stacks)
    }
}
