//
//  OrgFormatTests.swift
//  TextTable
//
//  Created by Cristian Filipov on 8/13/16.
//
//

import XCTest
@testable import TextTable

private typealias TestFormat = Format.Org

class OrgFormatTests: XCTestCase {

    func testPerformanceExample() {
        self.measure {
            let _ = table.string(for: data, format: TestFormat())
        }
    }

    func testTable() {
        let expectedOutput = "" +
            "| Name  |  Age   | Birthday |      Notes |      Notes |\n" +
            "|-------+--------+----------+------------+------------|\n" +
            "| Alice |   42   |  8/14/16 | Lorem ips… | … rhoncus. |\n" +
            "| Bob   |   22   |  8/14/16 | Nunc vari… | …enenatis. |\n" +
            "| Eve   |  142   |  8/14/16 | Etiam qui… | …ulus mus. |\n" +
        ""
        let s = table.string(for: data, format: TestFormat())!
        XCTAssertEqual(s, expectedOutput)
    }
    
}

