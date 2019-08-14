//
//  SwiftKitController.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import AsyncDisplayKit

class SwiftKitController: ASViewController<ASDisplayNode> {
    private let rootNode = ASDisplayNode()
    
    private let collectionNode: ASCollectionNode = {
        return ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
    }()
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    private let dataSource = ListSwiftAdapterDataSource()
    
    private let addButton: ASButtonNode = {
        let node = ASButtonNode()
        node.backgroundColor = UIColor.blue
        node.setAttributedTitle(NSAttributedString(string: "Mutate Data", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        node.style.width = ASDimensionMake("100%")
        node.style.height = ASDimensionMake(50)
        return node
    }()
    
    var dummyData: [SwiftKitNamaNamaModel] = [
        SwiftKitNamaNamaModel(namakuadalah: "Alviani"),
        SwiftKitNamaNamaModel(namakuadalah: "Nicole"),
        SwiftKitNamaNamaModel(namakuadalah: "Bang James"),
        SwiftKitNamaNamaModel(namakuadalah: "Bang Nabil")
    ]
    
    init() {
        super.init(node: rootNode)
        rootNode.automaticallyManagesSubnodes = true
        
        collectionNode.style.flexGrow = 1
        rootNode.layoutSpecBlock = { [weak self] _, _ in
            guard let self = self else { return ASLayoutSpec() }
            return ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [self.collectionNode, self.addButton])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        addButton.addTarget(self, action: #selector(onMutated), forControlEvents: .touchDown)
    }
    
    @objc func onMutated(){
        insert()
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func insert(){
        var moreData: [SwiftKitNamaNamaModel] = [
            SwiftKitNamaNamaModel(namakuadalah: "Oles"),
            SwiftKitNamaNamaModel(namakuadalah: "Selo"),
            SwiftKitNamaNamaModel(namakuadalah: "Olwes"),
            SwiftKitNamaNamaModel(namakuadalah: "Solwe")
        ]
        
        dummyData += moreData
    }
    
    func configureCollection(){
        adapter.setASDKCollectionNode(collectionNode)
        adapter.dataSource = dataSource
        
        dataSource.itemsBlock = { [weak self] _ in
            guard let self = self else { return [] }
            return self.dummyData
        }
        
        dataSource.sectionControllerBlock = { _, _ in
            return SwiftKitSectionController()
        }
        
        adapter.performUpdates(animated: true, completion: nil)
    }
}
