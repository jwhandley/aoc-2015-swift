import CryptoKit
import Foundation

struct Day04: AdventDay {
    var data: String

    func part1() -> Int {
        findNumber(data: data, prefix: "00000")
    }

    func part2() -> Int {
        findNumber(data: data, prefix: "000000")
    }
}

func findNumber(data: String, prefix: String) -> Int {
    let dataBytes = Data(data.utf8)

    return (0...).first { i in
        let numBytes = Data("\(i)".utf8)
        let combined = dataBytes + numBytes

        let hash = Insecure.MD5.hash(data: combined)
        return hash.map({ String(format: "%02x", $0) }).joined().starts(with: prefix)
    } ?? 0
}
