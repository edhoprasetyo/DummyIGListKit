//
//  SwiftListKitCellNode.swift
//  DummyIGListKit
//
//  Created by nakama on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import AsyncDisplayKit

class SwiftKitNamaNamaCell: ASCellNode {
    let textNode = ASTextNode()
    let image: ASImageNode = {
        let node = ASImageNode()
        node.style.preferredSize = CGSize(width: 50, height: 50)
        node.cornerRadius = 25
        return node
    }()
    
    init(namanama: SwiftKitNamaNamaModel) {
        super.init()
        style.width = ASDimensionMake("100%")
        automaticallyManagesSubnodes = true
        textNode.attributedText = NSAttributedString(string: namanama.namaku, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
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
