//
//  LicTests.swift
//  LicTests
//
//  Created by Daniel Duan on 7/18/15.
//
//

import XCTest
import Lic

class LicTests: XCTestCase {
    let emptySlice: ArraySlice<Int> = ArraySlice([])
    let anIntArray : [Int] = [0,1,2,3,4,5,6,7,8,9]
    let anIntArraySlice : ArraySlice<Int> = [0,1,2,3,4,5,6,7,8,9]
    let aString: String = "abcdefghijklmnopqrstuvwxyz"

    // MARK: Array slicing
    func testNormalArraySlicing() {
        XCTAssertEqual(anIntArray[0, anIntArray.count], anIntArraySlice, "full normal range")
        XCTAssertEqual(anIntArray[0, 4], ArraySlice([0,1,2,3]), "start to a normal position")
        XCTAssertEqual(anIntArray[4, anIntArray.count], ArraySlice([4,5,6,7,8,9]), "a normal position to end")
        XCTAssertEqual(anIntArray[1, 4], ArraySlice([1,2,3]), "a normal range")
    }

    func testOutOfBoundArraySlicing() {
        XCTAssertEqual(anIntArray[0, 100], anIntArraySlice, "start to out of bound")
        XCTAssertEqual(anIntArray[4, 100], ArraySlice([4,5,6,7,8,9]), "normal index to out of bound")
        XCTAssertEqual(anIntArray[100, 1000], ArraySlice(emptySlice), "positive out of bound to positive out of bound")
        XCTAssertEqual(anIntArray[-100, anIntArray.count], anIntArraySlice, "negative out of bound to the end")
        XCTAssertEqual(anIntArray[-100, 4], ArraySlice([0,1,2,3]), "negative out of bound to a normal position")
        XCTAssertEqual(anIntArray[-1000, -100], emptySlice, "negative out of bound to a normal position")
        XCTAssertEqual(anIntArray[-1000, 1000], anIntArraySlice, "negative out of bound to positive out of bound")
    }

    func testArraySlicingWithNormalNegativeBounds() {
        XCTAssertEqual(anIntArray[0, -6], ArraySlice([0,1,2,3]), "start to in-bound negative index")
        XCTAssertEqual(anIntArray[-6, anIntArray.count], ArraySlice([4,5,6,7,8,9]), "in-bound negative index to the end")
        XCTAssertEqual(anIntArray[-6, -4], ArraySlice([4,5]), "two in-bound negative indexes")
    }

    func testArraySlicingWithOutOfOrderBounds() {
        XCTAssertEqual(anIntArray[6, 4], emptySlice, "from a bigger positive index to a smaller positive index")
        XCTAssertEqual(anIntArray[-4, -6], emptySlice, "from a bigger negative index to a smaller negative index")
    }

    func testArraySlicingWithEqualStartAndEndIndex() {
        XCTAssertEqual(anIntArray[0, 0], emptySlice, "(0,0)")
        let length = anIntArray.count
        XCTAssertEqual(anIntArray[length, length], emptySlice, "(\(length), \(length)) - end position")
        XCTAssertEqual(anIntArray[100, 100], emptySlice, "(100,100) - out of bound range indexes")
        XCTAssertEqual(anIntArray[4, 4], emptySlice, "(4,4) - normal range")
        XCTAssertEqual(anIntArray[-4, -4], emptySlice, "(-4,-4) - normal range by negative indexes")
        XCTAssertEqual(anIntArray[-100, -100], emptySlice, "(-100,-100) - out of bound range by negative indexes")
    }

    func testArraySlicingWithNilInput() {
        let length = anIntArray.count
        XCTAssertEqual(anIntArray[nil, nil], anIntArraySlice, "two nils")
        XCTAssertEqual(anIntArray[0, nil], anIntArraySlice, "start to nil")
        XCTAssertEqual(anIntArray[nil, length], anIntArraySlice, "nil to end")
        XCTAssertEqual(anIntArray[4, nil], ArraySlice([4,5,6,7,8,9]), "nil to end")
        XCTAssertEqual(anIntArray[nil, 4], ArraySlice([0,1,2,3]), "nil to end")
    }

    // MARK: ArraySlice slicing
    func testNormalArraySliceSlicing() {
        XCTAssertEqual(anIntArraySlice[0, anIntArray.count], anIntArraySlice, "full normal range")
        XCTAssertEqual(anIntArraySlice[0, 4], ArraySlice([0,1,2,3]), "start to a normal position")
        XCTAssertEqual(anIntArraySlice[4, anIntArray.count], ArraySlice([4,5,6,7,8,9]), "a normal position to end")
        XCTAssertEqual(anIntArraySlice[1, 4], ArraySlice([1,2,3]), "a normal range")
    }

    func testOutOfBoundArraySliceSliceSlicing() {
        XCTAssertEqual(anIntArraySlice[0, 100], anIntArraySlice, "start to out of bound")
        XCTAssertEqual(anIntArraySlice[4, 100], ArraySlice([4,5,6,7,8,9]), "normal index to out of bound")
        XCTAssertEqual(anIntArraySlice[100, 1000], ArraySlice(emptySlice), "positive out of bound to positive out of bound")
        XCTAssertEqual(anIntArraySlice[-100, anIntArray.count], anIntArraySlice, "negative out of bound to the end")
        XCTAssertEqual(anIntArraySlice[-100, 4], ArraySlice([0,1,2,3]), "negative out of bound to a normal position")
        XCTAssertEqual(anIntArraySlice[-1000, -100], emptySlice, "negative out of bound to a normal position")
        XCTAssertEqual(anIntArraySlice[-1000, 1000], anIntArraySlice, "negative out of bound to positive out of bound")
    }

    func testArraySliceSlicingWitSlicehNormalNegativeBounds() {
        XCTAssertEqual(anIntArraySlice[0, -6], ArraySlice([0,1,2,3]), "start to in-bound negative index")
        XCTAssertEqual(anIntArraySlice[-6, anIntArray.count], ArraySlice([4,5,6,7,8,9]), "in-bound negative index to the end")
        XCTAssertEqual(anIntArraySlice[-6, -4], ArraySlice([4,5]), "two in-bound negative indexes")
    }

    func testArraySliceSlicingWitSlicehOutOfOrderBounds() {
        XCTAssertEqual(anIntArraySlice[6, 4], emptySlice, "from a bigger positive index to a smaller positive index")
        XCTAssertEqual(anIntArraySlice[-4, -6], emptySlice, "from a bigger negative index to a smaller negative index")
    }

    func testArraySliceSlicingWitSlicehEqualStartAndEndIndex() {
        XCTAssertEqual(anIntArraySlice[0, 0], emptySlice, "(0,0)")
        let length = anIntArraySlice.count
        XCTAssertEqual(anIntArraySlice[length, length], emptySlice, "(\(length), \(length)) - end position")
        XCTAssertEqual(anIntArraySlice[100, 100], emptySlice, "(100,100) - out of bound range indexes")
        XCTAssertEqual(anIntArraySlice[4, 4], emptySlice, "(4,4) - normal range")
        XCTAssertEqual(anIntArraySlice[-4, -4], emptySlice, "(-4,-4) - normal range by negative indexes")
        XCTAssertEqual(anIntArraySlice[-100, -100], emptySlice, "(-100,-100) - out of bound range by negative indexes")
    }

    // MARK: string slicing
    func testNormalStringSlicing() {
        let length = aString.characters.count
        XCTAssertEqual(aString[0, length], aString, "full normal range")
        XCTAssertEqual(aString[0, 4], "abcd", "start to a normal position")
        XCTAssertEqual(aString[4, length], "efghijklmnopqrstuvwxyz", "a normal position to end")
        XCTAssertEqual(aString[1, 4], "bcd", "a normal range")
    }

    func testOutOfBoundStringSlicing() {
        let length = aString.characters.count
        XCTAssertEqual(aString[0, 100], aString, "start to out of bound")
        XCTAssertEqual(aString[4, 100], "efghijklmnopqrstuvwxyz", "normal index to out of bound")
        XCTAssertEqual(aString[100, 1000], "", "positive out of bound to positive out of bound")
        XCTAssertEqual(aString[-100, length], aString, "negative out of bound to the end")
        XCTAssertEqual(aString[-100, 4], "abcd", "negative out of bound to a normal position")
        XCTAssertEqual(aString[-1000, -100], "", "negative out of bound to a normal position")
        XCTAssertEqual(aString[-1000, 1000], aString, "negative out of bound to positive out of bound")
    }

    func testStringSlicingWithNormalNegativeBounds() {
        let length = aString.characters.count
        XCTAssertEqual(aString[0, -6], "abcdefghijklmnopqrst", "start to in-bound negative index")
        XCTAssertEqual(aString[-6, length], "uvwxyz", "in-bound negative index to the end")
        XCTAssertEqual(aString[-6, -4], "uv", "two in-bound negative indexes")
    }

    func testStringSlicingWithOutOfOrderBounds() {
        XCTAssertEqual(aString[6, 4], "", "from a bigger positive index to a smaller positive index")
        XCTAssertEqual(aString[-4, -6], "", "from a bigger negative index to a smaller negative index")
    }

    func testStringSlicingWithEqualStartAndEndIndex() {
        let length = aString.characters.count
        XCTAssertEqual(aString[0, 0], "", "(0,0)")
        XCTAssertEqual(aString[length, length], "", "(\(length), \(length)) - end position")
        XCTAssertEqual(aString[100, 100], "", "(100,100) - out of bound range indexes")
        XCTAssertEqual(aString[4, 4], "", "(4,4) - normal range")
        XCTAssertEqual(aString[-4, -4], "", "(-4,-4) - normal range by negative indexes")
        XCTAssertEqual(aString[-100, -100], "", "(-100,-100) - out of bound range by negative indexes")
    }
}
