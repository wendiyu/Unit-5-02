

// Created on: November-20-2018
// Created by: Wendi Yu
// Created for: ICS3U
// This program is the UIKit solution for find the largest random number  
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    var counter = 0
    var answer = 0
    
    let introLable = UILabel()
    let displayLable = UILabel()
    let checkNumberLable = UILabel()
    let answerLable = UILabel()
    let answerButton = UIButton()
    
    func biggestNumber(anNumberArray: [Int])-> Int {
        // function for finding max number
        
        let biggestNumber = anNumberArray.max()!
        
        return biggestNumber
    }

    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        introLable.text = "Click the check button, we will generate 7 random numbers and find the largest number to you."
        view.addSubview(introLable)
        introLable.translatesAutoresizingMaskIntoConstraints = false
        introLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        introLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // display 10 random numbers 
        view.addSubview(displayLable)
        displayLable.translatesAutoresizingMaskIntoConstraints = false
        displayLable.topAnchor.constraint(equalTo: introLable.topAnchor, constant: 40).isActive = true
        displayLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        answerButton.setTitle("Check", for: .normal)
        answerButton.setTitleColor(.blue, for: .normal)
        answerButton.addTarget(self, action: #selector(checkLargeRandomNumber), for: .touchUpInside)
        view.addSubview(answerButton)
        answerButton.translatesAutoresizingMaskIntoConstraints = false
        answerButton.topAnchor.constraint(equalTo: displayLable.bottomAnchor, constant: 10).isActive = true
        answerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(answerLable)
        answerLable.translatesAutoresizingMaskIntoConstraints = false
        answerLable.topAnchor.constraint(equalTo: answerButton.bottomAnchor, constant: 20).isActive = true
        answerLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
    }
    
    @objc func checkLargeRandomNumber() {
        // show answers 
        
        var anNumberArray : [Int] = []
        
        for counter in 0 ... 6 {
            let randomNumber : Int = Int(arc4random_uniform(100) + 1)
            anNumberArray.append(randomNumber)
            displayLable.text = ("There are 7 random numbers: \(anNumberArray)")
        }
        
        let number : Int = biggestNumber(anNumberArray: anNumberArray)
            answerLable.text = ("The maximum number is: \(number)")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
