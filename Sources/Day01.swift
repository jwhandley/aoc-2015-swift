import Algorithms

struct Day01: AdventDay {
  var data: String

  func part1() -> Int {
    let up = data.count { $0 == "(" }
    let down = data.count { $0 == ")" }
    return up - down
  }

  func part2() -> Int {
    var floor = 0

    for (i, c) in data.enumerated() {
      switch c {
      case "(": floor += 1
      case ")": floor -= 1
      default: break
      }

      if floor < 0 { return i + 1 }
    }

    return 0
  }
}
