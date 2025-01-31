import Algorithms

struct Point: Hashable {
  var x: Int
  var y: Int

  static let right = Point(x: 1, y: 0)
  static let left = Point(x: -1, y: 0)
  static let up = Point(x: 0, y: 1)
  static let down = Point(x: 0, y: -1)
  static let zero = Point(x: 0, y: 0)

  static func + (lhs: Point, rhs: Point) -> Point {
    Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }

  static func += (lhs: inout Point, rhs: Point) {
    lhs.x += rhs.x
    lhs.y += rhs.y
  }
}

struct Day03: AdventDay {
  let data: String

  func part1() -> Int {
    var pos = Point.zero
    var seen: Set<Point> = [pos]

    for c in data {
      switch c {
      case ">": pos += Point.right
      case "<": pos += Point.left
      case "^": pos += Point.up
      case "v": pos += Point.down
      default: break
      }

      seen.insert(pos)
    }

    return seen.count
  }

  func part2() -> Int {
    var santa = Point.zero
    var robot = Point.zero

    var seen: Set<Point> = [santa, robot]

    for (i, c) in data.enumerated() {
      let dir =
        switch c {
        case ">": Point.right
        case "<": Point.left
        case "^": Point.up
        case "v": Point.down
        default: Point.zero
        }

      if i % 2 == 0 {
        santa += dir
        seen.insert(santa)
      } else {
        robot += dir
        seen.insert(robot)
      }
    }

    return seen.count
  }
}
