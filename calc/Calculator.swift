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
    let precedence : [String] = ["x", "/", "%"]
    
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
    
    func divide(no1: Int, no2: Int) -> Int {
        return no1/no2;
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func modulo(no1: Int, no2: Int) -> Int {
        return no1%no2;
    }
    
    func calculate(args: [String]) -> String {
        
        var dummyResult = 0;
        var substitutedArgs = args // Copy of args
        // Look for *, /, % and calculate first
        while (substitutedArgs.contains("x") || substitutedArgs.contains("%") || substitutedArgs.contains("/")){
            for number in stride(from: 0, to: substitutedArgs.count, by: 2) {
                // Avoiding Index out of range
                if (number+2 <= substitutedArgs.count - 1){
                    if (substitutedArgs.contains(substitutedArgs[number+1]) && substitutedArgs.contains(substitutedArgs[number+2])){
                        
                        let no1 = substitutedArgs[number]
                        let operatorPrecedence = substitutedArgs[number+1]
                        let no2 = substitutedArgs[number+2]
                         
                        // IF there's multiplication operator, calculate, insert, remove not-needed arguments(number + 1 ~ 3)
                        if (precedence.contains(operatorPrecedence)){
                            switch operatorPrecedence {
                            case "/":
                                dummyResult = divide(no1: Int(no1)!, no2: Int(no2)!);
                                substitutedArgs.insert(String(dummyResult), at: number)
                            case "%":
                                dummyResult = modulo(no1: Int(no1)!, no2: Int(no2)!);
                                substitutedArgs.insert(String(dummyResult), at: number)
                            case "x":
                                dummyResult = multiply(no1: Int(no1)!, no2: Int(no2)!);
                                substitutedArgs.insert(String(dummyResult), at: number)
                            default:
                                break
                            }
                            // [now] dummyResult <- substitutedArgs[number]
                            // Remove numbers three times from [number + 1]
                            substitutedArgs.remove(at: number+1)
                            substitutedArgs.remove(at: number+1)
                            substitutedArgs.remove(at: number+1)
                            
                            // Check if x / % operators comes to the next
                            // If so,　break and start from the biginninng.
                            // If the designated operators don't come, return on the way of loop.
                            // Avoiding Index out of range
                            if(number+1 <= substitutedArgs.count - 1){
                                if(substitutedArgs.contains(substitutedArgs[number+1]) && precedence.contains(substitutedArgs[number+1])){
                                    break;
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    
        // The collection of calculated-by-mltiplication values or the first args's value
        var no1 = Int(substitutedArgs[0])

        // Addition and Subtraction
        for number in stride(from: 0, to: substitutedArgs.count, by: 2) {
            if (number+2 < substitutedArgs.count){
                if (substitutedArgs.contains(substitutedArgs[number+1]) && substitutedArgs.contains(substitutedArgs[number+2])){
                    
                    let no2 = substitutedArgs[number+2]
                    let operations = substitutedArgs[number+1]

                    switch operations {
                    case "+":
                        // to make sure no1 is not a nil
                        dummyResult = add(no1: no1!, no2: Int(no2)!);
                        no1 = dummyResult;
                    case "-":
                        // to make sure no1 is not a nil
                        dummyResult = subtract(no1: no1!, no2: Int(no2)!);
                        no1 = dummyResult;
                    default:
                        break
                    }
                }
            }
        }
        
        let result = String(dummyResult);
        return(result)
    }
}
