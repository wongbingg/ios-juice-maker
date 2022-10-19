//
//  BaverageMakerImp.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/10/17.
//

struct BeverageMakerImp: BeverageMaker {
    private(set) var fruitStore: FruitStore
    var noStockError: (() -> Void)?
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(baverage: Beverage) {
        let ingredients = baverage.requireIngredients()
        do {
            try ingredients.forEach { ingredient in
                try fruitStore.change(
                    fruit: ingredient.fruit,
                    amount: -ingredient.count
                )
            }
        } catch let error {
            switch error {
            case FruitStoreError.noStock:
                print("재고량이 부족합니다")
                noStockError?()
            default:
                print(error.localizedDescription)
            }
        }
    }
}
