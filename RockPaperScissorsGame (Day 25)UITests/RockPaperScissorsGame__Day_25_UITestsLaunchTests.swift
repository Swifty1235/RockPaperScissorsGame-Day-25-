//
//  RockPaperScissorsGame__Day_25_UITestsLaunchTests.swift
//  RockPaperScissorsGame (Day 25)UITests
//
//  Created by Pedro Romero on 1/11/25.
//

import XCTest

final class RockPaperScissorsGame__Day_25_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
