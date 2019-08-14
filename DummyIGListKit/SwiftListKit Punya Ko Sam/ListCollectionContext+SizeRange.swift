//
//  ListCollectionContext+SizeRange.swift
//  SwiftListKit
//
//  Created by Samuel Edwin on 08/05/19.
//

import AsyncDisplayKit
import Foundation
import IGListKit

extension ListCollectionContext {
    /// Returns a size range between CGSize.zero and CGSize with container width and infinite height
    /// for most vertical collection views you will probably need this one
    public var flexibleHeightSizeRange: ASSizeRange {
        return ASSizeRange(min: .zero, max: CGSize(width: containerSize.width, height: .infinity))
    }

    /// Returns a size range between CGSize.zero and CGSize with infinite width and container height
    /// for most horizontal collection views you will probably need this one
    public var flexibleWidthSizeRange: ASSizeRange {
        return ASSizeRange(min: .zero, max: CGSize(width: .infinity, height: containerSize.height))
    }
}
