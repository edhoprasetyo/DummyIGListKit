//
//  ViewController.swift
//  DummyIGListKit
//
//  Created by Edho Prasetyo on 14/08/19.
//  Copyright © 2019 love. All rights reserved.
//

import UIKit
import GDPerformanceView_Swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        PerformanceMonitor.shared().start()
    }
}
