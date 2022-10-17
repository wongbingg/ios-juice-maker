//
//  Beverage.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/10/17.
//

struct Ingredient {
    let fruit: Fruit
    let count: Int
}

enum Beverage {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

extension Beverage {
    func requireIngredients() -> [Ingredient] {
        switch self {
        case .strawberryJuice:
            let firstIngredient = Ingredient(fruit: .strawberry, count: 16)
            return [firstIngredient]
        case .bananaJuice:
            let firstIngredient = Ingredient(fruit: .banana, count: 2)
            return [firstIngredient]
        case .kiwiJuice:
            let firstIngredient = Ingredient(fruit: .kiwi, count: 3)
            return [firstIngredient]
        case .pineappleJuice:
            let firstIngredient = Ingredient(fruit: .pineapple, count: 2)
            return [firstIngredient]
        case .strawberryBananaJuice:
            let firstIngredient = Ingredient(fruit: .strawberry, count: 10)
            let secondIngredient = Ingredient(fruit: .banana, count: 1)
            return [firstIngredient, secondIngredient]
        case .mangoJuice:
            let firstIngredient = Ingredient(fruit: .mango, count: 3)
            return [firstIngredient]
        case .mangoKiwiJuice:
            let firstIngredient = Ingredient(fruit: .mango, count: 2)
            let secondIngredient = Ingredient(fruit: .kiwi, count: 1)
            return [firstIngredient, secondIngredient]
        }
    }
}
