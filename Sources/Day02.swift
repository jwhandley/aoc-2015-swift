import Algorithms

struct Box {
  let length: Int
  let width: Int
  let height: Int

  func surfaceArea() -> Int {
    return 2 * length * width + 2 * width * height + 2 * height * length
  }

  func smallestSide() -> Int {
    return min(length * width, width * height, height * length)
  }

  func wrappingPaper() -> Int {
    return surfaceArea() + smallestSide()
  }

  func ribbon() -> Int {
    let bow = length * width * height
    let lengths = [length, width, height].sorted()
    let a = lengths[0]
    let b = lengths[1]

    return bow + 2 * a + 2 * b
  }
}

struct Day02: AdventDay {
  let data: String

  var boxes: [Box] {
    data.components(separatedBy: "\n").map { line in
      let parts = line.components(separatedBy: "x")
      let length = Int(parts[0]) ?? 0
      let width = Int(parts[1]) ?? 0
      let height = Int(parts[2]) ?? 0
      return Box(length: length, width: width, height: height)
    }
  }

  func part1() -> Int {
    boxes.map { $0.wrappingPaper() }.reduce(0, +)
  }

  func part2() -> Int {
    boxes.map { $0.ribbon() }.reduce(0, +)
  }
}
