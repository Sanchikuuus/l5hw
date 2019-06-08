//
//  ViewController.swift
//  l5hw
//
//  Created by Sashko Shel on 6/6/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var modeButton: UIButton!
    @IBOutlet weak var makeButton: UIButton!
    
    private var currentMode = 0
    private var currentCoffeeService : [Int] = [0, 0]
    private var currentCoffee = 0
    private var currentService = 0
    private var coffeeMashine = CoffeMashine()
    private var status : [Int] = [0]
    
    private var serviceFuncs = Array<() -> (Int, String)>()
    private var coffeeTypes = Array<Coffee>()

    //private var totalFuncs = [serviceFuncs, coffeeFuncs]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateStatus()
        updateFuncs()
    }
    
    @IBAction func switchType(_ sender: UIButton) {
        currentMode = currentMode + 1 > 1 ? 0 : 1
        changeModeTo(currentMode)
    }
    
    @IBAction func makeFunction(_ sender: Any) {
        var code = 0
        var message = ""
        if currentMode == 1 {
            (code, message) = serviceFuncs[currentCoffeeService[1]]()
        } else {
            (code, message) = coffeeMashine.make(coffeeTypes[currentCoffeeService[0]])
        }
        if code == 1 {
            if currentMode == 0 {
                currentMode = 1
                changeModeTo(currentMode)
            }
            messageLabel.textColor = .red
        } else {
            messageLabel.textColor = .black
        }
        messageLabel.text = message
        updateStatus()
    }
    
    @IBAction func scrollMenu(_ sender: UIButton) {
        if sender.currentTitle == "->" {
            currentCoffeeService[currentMode] = currentCoffeeService[currentMode] + 1 > 3 ? 0 : currentCoffeeService[currentMode] + 1
        } else {
            currentCoffeeService[currentMode] = currentCoffeeService[currentMode] - 1 < 0 ? 3 : currentCoffeeService[currentMode] - 1
        }
        changeFunction(currentCoffeeService[currentMode])
    }
    
    func changeModeTo(_ mode : Int) {
        if mode == 0 {
            modeButton.setTitle("Switch to service", for: .normal)
        } else {
            modeButton.setTitle("Switch to make coffee", for: .normal)
        }
        changeFunction(currentCoffeeService[currentMode])
    }
    
    func changeFunction(_ index : Int) {
        if currentMode == 0 {
            let coffees : [String] = ["Espresso", "Americano", "Cappuccino", "Latte"]
            makeButton.setTitle("Make \(coffees[index])", for: .normal)
        } else {
            let services : [String] = ["Add water", "Add coffee", "Add milk", "Clean trash"]
            makeButton.setTitle("\(services[index])", for: .normal)
        }
    }
    
    func updateStatus() {
        status = coffeeMashine.status()
        statusLabel.text = """
        Status:
        water tank : \(status[0])
        coffee tank : \(status[1])
        milk tank : \(status[2])
        trash : \(status[3])
        """
    }
    
    func updateFuncs() {
        serviceFuncs.append(coffeeMashine.addWater)
        serviceFuncs.append(coffeeMashine.addCoffee)
        serviceFuncs.append(coffeeMashine.addMilk)
        serviceFuncs.append(coffeeMashine.clearTrash)
        
        coffeeTypes.append(Espresso())
        coffeeTypes.append(Americano())
        coffeeTypes.append(Cappuccino())
        coffeeTypes.append(Latte())
    }
}

