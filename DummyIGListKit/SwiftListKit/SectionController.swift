//
//  SectionController.swift
//  SwiftListKit
//
//  Created by Samuel Edwin on 08/05/19.
//

import AsyncDisplayKit
import Foundation
import IGListKit

open class SectionController<Element: Equatable>: ListSectionController, ASSectionController {
    /**
     The value stored in the section controller extracted from object received didUpdate(to:)

     Value is implicitly unwrapped because most of the time they are available unless you call it from section controller's initializer
     */
    public private(set) var value: Element!

    public final func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let item = value!

        return { [weak self] in
            self?.nodeForItem(at: index, value: item) ?? ASCellNode()
        }
    }

    open func nodeForItem(at _: Int, value _: Element) -> ASCellNode {
        fatalError("nodeForItem(at:value:) must be implemented by \(type(of: self))")
    }

    public final override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }

    public final override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }

    public final override func didUpdate(to object: Any) {
        guard let box = object as? DiffableBox, let item = box.diffable as? Element else {
            fatalError("Cannot extract \(Element.self) from \(object). Please contact library maintainer")
        }

        // in certain cases, this method is called with a new object which has equal value to currently stored
        if value != item {
            value = item
            valueUpdated(to: item)
        }
    }

    /**
     Override this method if you want to be notified when the value is updated
     */
    open func valueUpdated(to _: Element) {}

    /**
     The default implementation of this method returns
     ```
     ASSizeRange(min: CGSize.zero, max: CGSize(width: self.containerSize.width, height: .infinity))
     ```

     The reason it returns above value because our use cases most likely we will have vertical scrolling contents with variable heights
     */
    open func sizeRangeForItem(at _: Int) -> ASSizeRange {
        return collectionContext!.flexibleHeightSizeRange
    }
}
