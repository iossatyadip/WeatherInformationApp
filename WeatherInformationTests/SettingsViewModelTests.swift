//
//  SettingsViewModelTests.swift
//  WeatherInformationTests
//
//  Created by Satyadip Singha on 06/04/22.//  Created by Satyadip Singha on 08/04/22.
//  Copyright © 2022 Satyadip Singha. All rights reserved.
//

import XCTest
@testable import WeatherInformation

class SettingsViewModelTests: XCTestCase {

    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }
    
    func testShouldReturnCorrectDisplayNameForFahrenheit() {
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Fahrenheit")
    }
    
    func testShouldMakeSureThatDefaultSelectedUnitIsFahrenheit() {
        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
    }
    
    func testShouldBeAbleToSaveUserUnitSelection() {
        self.settingsVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Celcius")
        self.settingsVM.selectedUnit = .fahrenheit
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Fahrenheit")
    }
    
    override func tearDown() {
        super.tearDown()
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
