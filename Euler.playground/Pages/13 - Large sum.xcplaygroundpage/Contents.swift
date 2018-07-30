// Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.

import Foundation

var sortedArray = [String](), sum = BInt(0)

do {
    guard let fileUrl = Bundle.main.url(forResource: "digits", withExtension: "txt") else { fatalError() }
    sortedArray = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8).components(separatedBy: "\n")
} catch { print(error) }

for x in 0...sortedArray.count - 1 { sum += BInt(sortedArray[x]) }

print(String(describing: sum).substring(to: String(describing: sum).index(String(describing: sum).startIndex, offsetBy: 10)))
