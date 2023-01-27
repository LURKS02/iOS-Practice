//: [Previous](@previous)

import Foundation

let sampleFiles = ["how.md", "back.md", "Hello.swift", "main.md", "Bye.swift"]
let filteredFiles = sampleFiles.filter{$0.hasSuffix(".md")}
print(filteredFiles)

//: [Next](@next)
