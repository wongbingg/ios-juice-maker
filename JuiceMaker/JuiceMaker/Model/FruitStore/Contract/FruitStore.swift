//
//  FruitStore.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/10/17.
//

protocol FruitStore: AnyObject {
    var didChangedStorage: [(() -> Void)?] { get set }
    
    func change(fruit: Fruit, amount: Int) throws
    func fetchCount(of fruit: Fruit) -> Int
}
