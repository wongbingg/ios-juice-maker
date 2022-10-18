//
//  BeverageMaker.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/10/17.
//

protocol BeverageMaker {
    var fruitStore: FruitStore { get }
    func make(baverage: Beverage)
}