//
//  File.swift
//  l5hw
//
//  Created by Sashko Shel on 6/6/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import Foundation

class Coffee : NSObject {
    private var water : Int
    private var coffee : Int
    private var milk : Int
    
    init(water : Int, coffee : Int, milk : Int) {
        self.water = water
        self.coffee = coffee
        self.milk = milk
    }
    
    func requirWater() -> Int {
        return water
    }
    func requirCoffee() -> Int {
        return coffee
    }
    func requirMilk() -> Int {
        return milk
    }
}


class Espresso : Coffee {
    override var description: String {
        return "Espresso"
    }
    init() {
        super.init(water: 50, coffee: 7, milk: 0)
    }
}


class Americano : Coffee {
    override var description: String {
        return "Americano"
    }
    init() {
        super.init(water: 150, coffee: 7, milk: 0)
    }
}


class Cappuccino : Coffee {
    override var description: String {
        return "Cappuccino"
    }
    init() {
        super.init(water: 50, coffee: 7, milk: 100)
    }
}


class Latte : Coffee {
    override var description: String {
        return "Latte"
    }
    init() {
        super.init(water: 50, coffee: 7, milk: 100)
    }
}
