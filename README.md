Lic - easy, safe object slicing for Swift


## Summary
*Lic* is a μ-framework that makes getting slices of arrays and strings in Swift 2 safe and easy:

```swift
[0,1,2,3][1, -1]            // => ArraySlice([1, 2])
"Hello"[-1000, nil]         // => "ello"
[1,2,3,4,5,6,7,8][1,5][2,3] // => ArraySlice([4])
```

*Lic* has no dependencies, not even `Foundation`.

## Range Free Slices

To make a slice, you must give two indexes, indicating the start and end positions where the slice will be produced.
*Lic* tries to make sense of the indexes following these rules:

*   a negative index indicates a position counted in the reverse direction
*   `nil` is equivalent to the start or end index
*   an out-of-bound index is treated as the same as start or end index, depending on which bound it goes beyond
*   if the start index ends up at a position after the end index, *Lic* returns the empty value

When it comes to slicing, your ranges are always safe and accepted.

## Install

### Carthage

    github "dduan/Lic"

### Source File
Include the single source file in your project.

(There's no dependencies at all).

## What kind of name is "Lic"?

It's `"slice"[1,-1]` - a slice of the word "slice", you know, what *Lic* produces.

## License

BSD, see [LICENSE](https://github.com/dduan/Lic/blob/master/LICENSE)
