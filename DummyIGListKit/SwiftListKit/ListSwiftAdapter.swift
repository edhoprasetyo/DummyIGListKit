//
//  Helper.swift
//  SwiftListKit
//
//  Created by Samuel Edwin on 03/05/19.
//  Copyright © 2019 Samuel Edwin. All rights reserved.
//

import AsyncDisplayKit
import Foundation
import IGListKit

public class ListSwiftAdapterDataSource: NSObject {
    public var itemsBlock: ((ListAdapter) -> [Diffable])?
    public var sectionControllerBlock: ((ListAdapter, Diffable) -> ListSectionController)?
    public var emptyViewBlock: ((ListAdapter) -> UIView)?
}

extension ListSwiftAdapterDataSource: ListAdapterDataSource {
    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return emptyViewBlock?(listAdapter)
    }

    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return itemsBlock?(listAdapter).map { DiffableBox(diffable: $0) } ?? []
    }

    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let object = object as! DiffableBox

        return sectionControllerBlock!(listAdapter, object.diffable)
    }
}
