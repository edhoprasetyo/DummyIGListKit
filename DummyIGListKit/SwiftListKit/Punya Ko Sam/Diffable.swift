//
//  Diffable.swift
//  SwiftListKit
//
//  Created by Samuel Edwin on 08/05/19.
//

import Foundation
import IGListKit

/**
 Replacement for IGListKit's ListDiffable.

 Now you can use Swift structs to represent list data, and leverage Equatable operator for automatic isEqual implementation
 */
public protocol Diffable {
    var diffIdentifier: String { get }
    func isEqual(to other: Any) -> Bool
}

extension Diffable where Self: Equatable {
    public func isEqual(to other: Any) -> Bool {
        guard let other = other as? Self else {
            return false
        }

        return self == other
    }
}

class DiffableBox: ListDiffable {
    let diffable: Diffable

    init(diffable: Diffable) {
        self.diffable = diffable
    }

    func diffIdentifier() -> NSObjectProtocol {
        return "\(type(of: diffable))_\(diffable.diffIdentifier)" as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let other = object as? DiffableBox else {
            return false
        }

        return diffable.isEqual(to: other.diffable)
    }
}

extension DiffableBox: CustomStringConvertible {
    var description: String {
        return "DiffableBox(\(diffable))"
    }
}
