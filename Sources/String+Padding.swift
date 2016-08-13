//
//  String+Padding.swift
//  TextTable
//
//  Created by Cristian Filipov on 8/13/16.
//
//

import Foundation

internal typealias PaddingFunction = (length: Int, character: Character) -> String

internal extension String {
    internal mutating func append(_ c: Character, repeat count: Int) {
        append(String(repeating: c, count: count))
    }

    // https://github.com/coryalder/SwiftLeftpad
    internal func leftpad(length: Int, character: Character = " ") -> String {
        var outString: String = self
        let extraLength = length - outString.characters.count
        var i = 0
        while (i < extraLength) {
            outString.insert(character, at: outString.startIndex)
            i += 1
        }
        return outString
    }

    internal func rightpad(length: Int, character: Character = " ") -> String {
        return padding(toLength: length, withPad: String(character), startingAt: 0)
    }

    internal func centerpad(length: Int, character: Character = " ") -> String {
        let count = characters.count
        let leftlen = (length - count)/2 + count
        return leftpad(length: leftlen).rightpad(length: length)
    }

    internal func replaceAll(_ character: Character) -> String {
        var out = ""
        for _ in characters {
            out.append(character)
        }
        return out
    }

    internal func pad(_ align: Alignment, length: Int) -> String {
        let padfunc: PaddingFunction
        switch align {
        case .left: padfunc = rightpad
        case .right: padfunc = leftpad
        case .center: padfunc = centerpad
        }
        return padfunc(length: length, character: " ")
    }
}