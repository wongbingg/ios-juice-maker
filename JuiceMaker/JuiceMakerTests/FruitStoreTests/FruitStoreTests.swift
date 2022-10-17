//
//  FruitStoreTests.swift
//  FruitStoreTests
//
//  Created by 이원빈 on 2022/10/17.
//

import XCTest
@testable import JuiceMaker

final class FruitStoreTests: XCTestCase {
    var fruitStore: FruitStoreImp!

    override func setUpWithError() throws {
        try super.setUpWithError()
        fruitStore = FruitStoreImp()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        fruitStore = nil
    }
    
    func test_초기값에서_딸기를2개소모할경우_딸기재고량이8이되는지() {
        // given
        let expectation = 8
        // when
        try! fruitStore.change(fruit: .strawberry, amount: -2)
        let result = fruitStore.fetchCount(of: .strawberry)
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_초기값에서_딸기를10개추가할경우_딸기재고량이20이되는지() {
        // given
        let expectation = 20
        // when
        try! fruitStore.change(fruit: .strawberry, amount: 10)
        let result = fruitStore.fetchCount(of: .strawberry)
        // then
        XCTAssertEqual(expectation, result)
    }
}
