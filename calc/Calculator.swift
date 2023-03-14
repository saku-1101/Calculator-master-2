//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
    let operators = ["+", "-", "x", "/", "%"]
    var no1: Int = 0
    var opr: String = ""
    var no2: Int = 0
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    func divide(no1: Int, no2: Int) -> Int {
        // Division by zero errors and numeric out-of-bounds errors.
        return no1 / no2;
    }
    func remaind(no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }
    
    func calculate(args: [String]) -> String {
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
        if let val = Int(args[0]){
            self.no1 = val
            print(self.no1)
        }else{
            print("exit with nonzero status on invalid input: \(args)")
        }
//        if operators.contains(args[1]){
//            opr = args[1]
//            print(opr)
//        }else{
//            print("exit with nonzero status on invalid input: \(args)")
//        }
        if let val = Int(args[2]){
            self.no2 = val
            print(self.no2)
        }else{
            print("exit with nonzero status on invalid input: \(args)")
        }
        self.opr = args[1]
        print(no1, opr, no2)
        
        switch opr {
        case operators[0]:
            self.currentResult = add(no1: no1, no2: no2);
        case operators[1]:
            self.currentResult = subtract(no1: no1, no2: no2);
        case operators[2]:
            self.currentResult = multiply(no1: no1, no2: no2);
        case operators[3]:
            self.currentResult = divide(no1: no1, no2: no2);
        case operators[4]:
            self.currentResult = remaind(no1: no1, no2: no2);
        default:
            print("exit with nonzero status on invalid input: \(args)")
        }
        
        
        let result = String(self.currentResult);
        return(result)
    }
}
