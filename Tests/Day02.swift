import Testing

@testable import AdventOfCode

struct Day02Tests {
    // Smoke test data provided in the challenge question
    let testData = """
        2x3x4
        1x1x10
        """

    @Test func testPart1() async throws {
        let challenge = Day02(data: testData)
        #expect(String(describing: challenge.part1()) == "101")
    }

    @Test func testPart2() async throws {
        let challenge = Day02(data: testData)
        #expect(String(describing: challenge.part2()) == "48")
    }
}
