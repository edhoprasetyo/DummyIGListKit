//
//  ViewController.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    
    var dummyData: [String] = []
    
    let loadMoreData: [String] = [
        "Alviani",
        "Nicole",
        "Bang James",
        "Bang Nabil"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "labelCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
        
        addButton.addTarget(self, action: #selector(addData), for: .touchDown)
        
        for _ in 0...1000 {
            dummyData += loadMoreData
        }
    }
    
    @objc func addData() {
        // reload data
//        dummyData += loadMoreData
//        collectionView.reloadData()
        
        //perform batch update
        collectionView.performBatchUpdates({
            let oldDataCount = dummyData.count
            dummyData += loadMoreData
            let lastIndexDataCount = dummyData.count - 1
            
            var indexPaths = [IndexPath]()
            for i in oldDataCount...lastIndexDataCount {
                indexPaths.append(IndexPath(item: i, section: 0))
            }
            collectionView.insertItems(at: indexPaths)
        })
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! labelCollectionViewCell
        cell.labeled.text = dummyData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
}


