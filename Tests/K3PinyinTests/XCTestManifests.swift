import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(K3PinyinTests.allTests),
    ]
}
#endif
