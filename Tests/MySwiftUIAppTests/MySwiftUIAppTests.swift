import XCTest
@testable import MySwiftUIApp

final class MySwiftUIAppTests: XCTestCase {
    func testExample() throws {
        // This test verifies that our ContentView exists and can be initialized
        let contentView = ContentView()
        XCTAssertNotNil(contentView, "ContentView should be initialized successfully")
    }
    
    func testAppBundle() throws {
        // Test that we can access the main bundle
        let bundle = Bundle.main
        XCTAssertNotNil(bundle, "Main bundle should be accessible")
        
        // Verify bundle identifier matches our project settings
        let bundleId = bundle.bundleIdentifier
        XCTAssertEqual(bundleId, "com.example.MySwiftUIApp", "Bundle identifier should match project settings")
    }
} 