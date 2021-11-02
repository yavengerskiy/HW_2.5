//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet weak var quizResultTitile: UILabel!
    @IBOutlet weak var quizResultDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        var animalTypesCounter: [AnimalType : Int] = [:]
        for answerIdentifier in 1..<answers.count{
            
            if let animalTypeCount = animalTypesCounter[answers[answerIdentifier].type] {
                animalTypesCounter.updateValue(animalTypeCount + 1, forKey: answers[answerIdentifier].type)
            } else {
                animalTypesCounter.updateValue(1, forKey: answers[answerIdentifier].type)
            }
        }
        
        guard let animalTypeWithMaxResult = (animalTypesCounter.sorted() { $0.value > $1.value }).first else { return }
        
        quizResultTitile.text = "\(animalTypeWithMaxResult.key) - \(animalTypeWithMaxResult.key.rawValue)"
        quizResultDescription.text = animalTypeWithMaxResult.key.definition
    }
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
}
