//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var quizResultTitile: UILabel!
    @IBOutlet weak var quizResultDescription: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
}

extension ResultViewController {
    private func funalResult() {
        var animalTypesCounter: [AnimalType : Int] = [:]
        for answer in answers{
            
            if let animalTypeCount = animalTypesCounter[answer.type] {
                animalTypesCounter.updateValue(animalTypeCount + 1, forKey: answer.type)
            } else {
                animalTypesCounter.updateValue(1, forKey: answer.type)
            }
        }
        
        let animalTypeSorted = animalTypesCounter.sorted() { $0.value > $1.value }
        guard let animalTypeWithMaxResult = animalTypeSorted.first?.key else { return }
        showResult(animal: animalTypeWithMaxResult)
        
    }
    
    private func showResult(animal: AnimalType){
        quizResultTitile.text = "\(animal) - \(animal.rawValue)"
        quizResultDescription.text = animal.definition
    }
}
