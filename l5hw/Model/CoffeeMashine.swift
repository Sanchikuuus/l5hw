//
//  CoffeeMashine.swift
//  l5hw
//
//  Created by Sashko Shel on 6/6/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import Foundation

class CoffeMashine {
    private var waterTank : Int = 0
    private var coffeeTank : Int = 0
    private var milkTank : Int = 0
    private var trash : Int = 0
    
    func make(_ coffeType : Coffee) -> (Int, String) {
        let needWater = coffeType.requirWater()
        let needCoffee = coffeType.requirCoffee()
        let needMilk = coffeType.requirMilk()
        
        if trash >= 5 {
            return (1, "Trash is full. Сlean the trash container to continue")
        } else if waterTank < needWater {
            return (1, "Not enough water. Add water to continue")
        } else if coffeeTank < needCoffee {
            return (1, "Not enough coffee. Add coffee to continue")
        } else if milkTank < needMilk {
            return (1, "Not enough milk. Add milk to continue")
        }
        
        waterTank -= needWater
        coffeeTank -= needCoffee
        milkTank -= needMilk
        trash += 1
        return (0, "Here's your \(coffeType.self)!")
    }
    
    func status() -> [Int] {
        return [waterTank, coffeeTank, milkTank, trash]
    }
    
    func addWater() -> (Int, String) {
        waterTank += 20
        if waterTank >= 200 {
            waterTank = 200
            return (1, "Water tank is full.")
        } else {
            return (0, "Added 20 ml of water.")
        }
        
    }
    func addCoffee() -> (Int, String) {
        coffeeTank += 5
        if coffeeTank >= 50 {
            coffeeTank = 50
            return (1, "Coffee tank is full.")
        } else {
            return (0, "Added 5 grams of coffee.")
        }
    }
    func addMilk() -> (Int, String) {
        milkTank += 20
        if milkTank >= 200 {
            milkTank = 200
            return (1, "Milk tank tank is full.")
        } else {
            return (0, "Added 20 ml of milk.")
        }
    }
    func clearTrash() -> (Int, String) {
        trash = 0
        return (0, "Trash is empty.")
    }
}
