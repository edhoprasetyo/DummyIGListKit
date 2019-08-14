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

    var dummyData: [NamaNamaModel] = [
        NamaNamaModel(namakuadalah: "Alviani", image: #imageLiteral(resourceName: "alviani")),
        NamaNamaModel(namakuadalah: "Nicole", image: #imageLiteral(resourceName: "nicole")),
        NamaNamaModel(namakuadalah: "Bang James", image: #imageLiteral(resourceName: "pace")),
        NamaNamaModel(namakuadalah: "Bang Nabil", image: #imageLiteral(resourceName: "nabil"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAdd(_ sender: Any) {
        self.insertdata()
    }
    
    func insertdata(){
        let moreData: [NamaNamaModel] = [
            NamaNamaModel(namakuadalah: "Selo", image: #imageLiteral(resourceName: "oles")),
            NamaNamaModel(namakuadalah: "Melvina", image: #imageLiteral(resourceName: "melvina")),
            NamaNamaModel(namakuadalah: "Kristabel", image: #imageLiteral(resourceName: "kristabel")),
            NamaNamaModel(namakuadalah: "Lovinska", image: #imageLiteral(resourceName: "lovinska"))
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
        dummyData[2] = NamaNamaModel(namakuadalah: "Pace", image: #imageLiteral(resourceName: "pace"))
    }
}
