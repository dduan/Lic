//
//  Lic.swift
//  Lic
//
//  Created by Daniel Duan on 7/18/15.
//

/// - parameter start: any integer to indicate the beginning of the range
/// - parameter end: any integer to indicate the end of the range
/// - parameter total: maximum available length
/// - returns: (start, end), the safe range indicators
internal func normalize(start: Int?, end: Int?, total: Int) -> (Int, Int) {
    var actualStart = start == nil ? 0 : start!
    var actualEnd = end == nil ? total : end!
    actualStart = actualStart < 0 ? total + actualStart : actualStart
    actualEnd = actualEnd < 0 ? total + actualEnd : actualEnd
    actualStart = actualStart < 0 ? 0 : actualStart
    actualEnd = actualEnd < 0 ? 0 : actualEnd
    let safeEnd = min(actualEnd, total)
    return (min(actualStart, safeEnd), safeEnd)
}


extension CollectionType where Self.Index: RandomAccessIndexType {
    /// - parameter start: any integer or `nil` to indicate the beginning of the range
    /// - parameter end: any integer or `nil` to indicate the end of the range
    /// - returns: an Subsequence with content as specified by the input
    public subscript(start:Int?, end:Int?) -> Self.SubSequence {
        let (safeStart, safeEnd) = normalize(start, end: end, total: self.count as! Int)
        let safeStartIndex = startIndex.advancedBy(safeStart as! Self.Index.Distance)
        let safeEndIndex = startIndex.advancedBy(safeEnd as! Self.Index.Distance)
        return self[safeStartIndex..<safeEndIndex]
    }
}

public extension String {
    /// - parameter start: any integer or `nil` to indicate the beginning of the range
    /// - parameter end: any integer or `nil` to indicate the end of the range
    /// - returns: a substring with content as specified by the input
    public subscript(start:Int?, end:Int?) -> String {
        let (safeStart, safeEnd) = normalize(start, end: end, total: self.characters.count)

        let startIndex = self.startIndex.advancedBy(safeStart)
        let endIndex = self.startIndex.advancedBy(safeEnd)
        return self[startIndex..<endIndex]
    }
}

