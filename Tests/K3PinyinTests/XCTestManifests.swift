import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [
        testCase(K3PinyinTests.allTests),
    ]
}
#endif
