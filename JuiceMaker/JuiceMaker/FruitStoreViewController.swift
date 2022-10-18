//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/10/18.
//

import UIKit

final class FruitStoreViewController: UIViewController {
    var fruitStore: FruitStore?
    @IBOutlet var steppers: [UIStepper]!
    @IBOutlet var countLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCountLabel()
        setupInitialStepValue()
        bindCountLabel()
    }
    
    private func setupInitialStepValue() {
        guard let fruitStore = fruitStore else { return }
        steppers[0].value = Double(fruitStore.fetchCount(of: .strawberry))
        steppers[1].value = Double(fruitStore.fetchCount(of: .banana))
        steppers[2].value = Double(fruitStore.fetchCount(of: .pineapple))
        steppers[3].value = Double(fruitStore.fetchCount(of: .kiwi))
        steppers[4].value = Double(fruitStore.fetchCount(of: .mango))
    }
    
    private func setCountLabel() {
        guard let fruitStore = fruitStore else { return }
        countLabels[0].text = "\(fruitStore.fetchCount(of: .strawberry))"
        countLabels[1].text = "\(fruitStore.fetchCount(of: .banana))"
        countLabels[2].text = "\(fruitStore.fetchCount(of: .pineapple))"
        countLabels[3].text = "\(fruitStore.fetchCount(of: .kiwi))"
        countLabels[4].text = "\(fruitStore.fetchCount(of: .mango))"
    }
    
    private func bindCountLabel() {
        guard let fruitStore = fruitStore else { return }
        fruitStore.didChangedStorage.append {
            self.setCountLabel()
        }
    }
    
    private func changeCount(of fruit: Fruit, with sender: UIStepper) {
        guard let prevCount = fruitStore?.fetchCount(of: fruit) else { return }
        let currentCount = Int(sender.value)
        let amount = currentCount - prevCount
        try? fruitStore?.change(fruit: fruit, amount: amount)
    }
    
    @IBAction func strawberryStepperDidTapped(_ sender: UIStepper) {
        changeCount(of: .strawberry, with: sender)
    }
    
    @IBAction func bananaStepperDidTapped(_ sender: UIStepper) {
        changeCount(of: .banana, with: sender)
    }
    
    @IBAction func pineappleStepperDidTapped(_ sender: UIStepper) {
        changeCount(of: .pineapple, with: sender)
    }
    
    @IBAction func kiwiStepperDidTapped(_ sender: UIStepper) {
        changeCount(of: .kiwi, with: sender)
    }
    
    @IBAction func mangoStepperDidTapped(_ sender: UIStepper) {
        changeCount(of: .mango, with: sender)
    }
    
    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        self.dismiss(animated: true)
        fruitStore?.didChangedStorage.popLast()
    }
}
