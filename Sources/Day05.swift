struct Day05: AdventDay {
    let data: String

    func part1() -> Int {
        data.components(separatedBy: "\n").count { $0.isNice() }
    }

    func part2() -> Int {
        data.components(separatedBy: "\n").count { line in
            let pairs = line.indices.dropLast(1).reduce(into: [String: Set<Int>]()) { pairs, i in
                let pair = String(line[i...line.index(after: i)])
                pairs[pair, default: []].insert(line.distance(from: line.startIndex, to: i))
            }

            let foundPair = pairs.contains { key, indices in
                indices.count > 1
                    && indices.contains(where: { i in
                        indices.contains(where: { j in abs(i - j) >= 2 })
                    })
            }

            let foundTriple = zip(line, line.dropFirst(2)).contains { $0 == $1 }

            return foundPair && foundTriple
        }
    }
}

extension String {
    func isNice() -> Bool {
        let vowels = "aeiou"
        let vowel_count = self.count { vowels.contains($0) }

        let twice_in_a_row = self.adjacentPairs().contains { (a, b) in
            a == b
        }

        let banned = ["ab", "cd", "pq", "xy"]
        let has_banned = banned.contains {
            self.contains($0)
        }

        return vowel_count >= 3 && twice_in_a_row && !has_banned
    }
}
