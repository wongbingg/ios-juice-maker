//
//  BeverageMakerTests.swift
//  JuiceMakerTests
//
//  Created by 이원빈 on 2022/10/17.
//

import XCTest
@testable import JuiceMaker

final class BeverageMakerTests: XCTestCase {
    var baverageMaker: BeverageMakerImp!
    var fruitStore: FruitStoreImp!

    override func setUpWithError() throws {
        try super.setUpWithError()
        fruitStore = FruitStoreImp()
        baverageMaker = BeverageMakerImp(fruitStore: fruitStore)
        
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        fruitStore = nil
        baverageMaker = nil
    }
    
    func test_딸기쥬스를만들때_딸기재고가부족하다는오류가뜨는지() {
        // given
        // when
        // then
        XCTAssertThrowsError(try baverageMaker.make(baverage: .strawberryJuice))
    }
    
    func test_바나나쥬스를만들고_재고가8개남았는지() {
        // given
        let expectation = 8
        // when
        try! baverageMaker.make(baverage: .bananaJuice)
        let result = baverageMaker.fruitStore.fetchCount(of: .banana)
        // then
        XCTAssertEqual(expectation, result)
    }
    

}
