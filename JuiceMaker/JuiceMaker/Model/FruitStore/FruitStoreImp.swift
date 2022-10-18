//
//  FruitStoreImp.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/10/17.
//

final class FruitStoreImp: FruitStore {
    private var storage: [Fruit: Int] {
        didSet {
            didChangedStorage.forEach { $0?() }
        }
    }
    var didChangedStorage: [(() -> Void)?] = []
    
    init() {
        storage = [
            .banana: 10,
            .kiwi: 10,
            .mango: 10,
            .pineapple: 10,
            .strawberry: 10
        ]
    }
    
    func fetchCount(of fruit: Fruit) -> Int {
        guard let count = storage[fruit] else { return 0 }
        return count
    }
    
    func change(fruit: Fruit, amount: Int) throws {
        guard let count = storage[fruit] else { return }
        let changedCount = count + amount
        if changedCount < 0 {
            throw FruitStoreError.noStock
        }
        storage[fruit] = changedCount
    }
}
