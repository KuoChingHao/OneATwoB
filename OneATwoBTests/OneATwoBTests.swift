//
//  OneATwoBTests.swift
//  OneATwoBTests
//
//  Created by 郭景豪 on 2018/10/6.
//  Copyright © 2018 Tank. All rights reserved.
//

import XCTest
@testable import OneATwoB

class OneATwoBTests: XCTestCase {

    
    var vc : ViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateInitialViewController() as? ViewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testCreateResultNumber(){
        
        let numbers = vc.createResultNumberString()
        if numbers.count == 4 {
            XCTAssert(true, "\(numbers)")
        }else {
            XCTAssert(false, "產生數字錯誤")
        }
    }
    
    func testCheckEnterNumber1(){
        
        let currentContentText = "123"
        
        let resultString = vc.enterNumber(currentContentText: currentContentText, enter: "1")
        
        if resultString == "123" {
            XCTAssert(true)
        }else {
            XCTAssert(false)
        }
        
        
        
    }

    func testCheckEnterNumber2(){
        
        let currentContentText = "123"
        
        let resultString = vc.enterNumber(currentContentText: currentContentText, enter: "4")
        
        if resultString == "1234" {
            XCTAssert(true)
        }else {
            XCTAssert(false)
        }
    }
    
    func testCheckEnterNumber3(){
        
        let currentContentText = "1234"
        
        let resultString = vc.enterNumber(currentContentText: currentContentText, enter: "5")
        
        if resultString == "1234" {
            XCTAssert(true)
        }else {
            XCTAssert(false)
        }
    }
    
    
    func testCheckResult(){
        
        let userEnterNumberString = "1234"
        let resultString = "1234"
        let result = vc.checkResult(userEnterNumberString: userEnterNumberString, resultNumberString: resultString)
        
        if result == "4A"{
            XCTAssert(true,result)
        }else {
            XCTAssert(false,result)
        }
        
        
    }
    
}
