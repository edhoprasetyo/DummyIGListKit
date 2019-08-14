//
//  IgListKitController.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import AsyncDisplayKit

class IgListKitController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    lazy var adapter: ListAdapter = {
       ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    var dummyData: [NamaNamaModel] = [
        NamaNamaModel(namakuadalah: "Alviani"),
        NamaNamaModel(namakuadalah: "Nicole"),
        NamaNamaModel(namakuadalah: "Bang James"),
        NamaNamaModel(namakuadalah: "Bang Nabil")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    @IBAction func onAdd(_ sender: Any) {
        self.insertdata()
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func insertdata(){
        let moreData: [NamaNamaModel] = [
            NamaNamaModel(namakuadalah: "Selo"),
            NamaNamaModel(namakuadalah: "Oles"),
            NamaNamaModel(namakuadalah: "Olwes"),
            NamaNamaModel(namakuadalah: "Solwe")
        ]
        
        dummyData += moreData
    }
    
    func deleteData(){
        dummyData.remove(at: 1)
    }
    
    func moveData(){
        let temp = dummyData[0]
        dummyData[0] = dummyData[1]
        dummyData[1] = temp
    }
    
    func updateData(){
        dummyData[2] = NamaNamaModel(namakuadalah: "Pace")
    }
}

extension IgListKitController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return dummyData
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return NamaNamaSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
