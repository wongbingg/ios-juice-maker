//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    private var fruitStore: FruitStore?
    private var beverageMaker: BeverageMaker?
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBeverageMaker()
        setCountLabel()
        bindCountLabel()
    }
    
    private func setupBeverageMaker() {
        fruitStore = FruitStoreImp()
        guard let store = fruitStore else { return }
        beverageMaker = BeverageMakerImp(fruitStore: store)
    }
    
    private func setCountLabel() {
        guard let fruitStore = fruitStore else { return }
        fruitCountLabels[0].text = "\(fruitStore.fetchCount(of: .mango))"
        fruitCountLabels[1].text = "\(fruitStore.fetchCount(of: .kiwi))"
        fruitCountLabels[2].text = "\(fruitStore.fetchCount(of: .pineapple))"
        fruitCountLabels[3].text = "\(fruitStore.fetchCount(of: .banana))"
        fruitCountLabels[4].text = "\(fruitStore.fetchCount(of: .strawberry))"
    }
    
    private func bindCountLabel() {
        guard let fruitStore = fruitStore else { return }
        fruitStore.didChangedStorage.append {
            self.setCountLabel()
        }
    }
    
    @IBAction func OrderButtonDidTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        let list = title.split(separator: " ").compactMap { $0 }
        switch list[0] {
        case Beverage.strawberryBananaJuice.rawValue:
            beverageMaker?.make(baverage: .strawberryBananaJuice)
        case Beverage.mangoKiwiJuice.rawValue:
            beverageMaker?.make(baverage: .mangoKiwiJuice)
        case Beverage.strawberryJuice.rawValue:
            beverageMaker?.make(baverage: .strawberryJuice)
        case Beverage.bananaJuice.rawValue:
            beverageMaker?.make(baverage: .bananaJuice)
        case Beverage.pineappleJuice.rawValue:
            beverageMaker?.make(baverage: .pineappleJuice)
        case Beverage.kiwiJuice.rawValue:
            beverageMaker?.make(baverage: .kiwiJuice)
        case Beverage.mangoJuice.rawValue:
            beverageMaker?.make(baverage: .mangoJuice)
        default:
            return
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? FruitStoreViewController else { return }
        destinationVC.fruitStore = fruitStore
    }
}
