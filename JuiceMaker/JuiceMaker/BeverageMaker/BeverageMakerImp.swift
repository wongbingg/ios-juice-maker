//
//  BaverageMakerImp.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/10/17.
//

struct BeverageMakerImp: BeverageMaker {
    private(set) var fruitStore: FruitStroe
    
    init(fruitStore: FruitStroe) {
        self.fruitStore = fruitStore
    }
    
    func make(baverage: Beverage) throws {
        let ingredients = baverage.requireIngredients()
        try ingredients.forEach { ingredient in
            try fruitStore.change(
                fruit: ingredient.fruit,
                amount: -ingredient.count
            )
        }
    }
}
