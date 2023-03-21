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
    let precedence: [String] = ["x", "/", "%"]

    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }

    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }

    func divide(no1: Int, no2: Int) -> Int {
        return no1 / no2;
    }

    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }

    func modulo(no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }

    func precedentCalc(args: [String], number: Int) -> [String] {
        var dummyResult = 0;
        var substitutedArgs = args // Copy of args to enable mutation

        // If there's nothing to help with substitudedArgs by percedentCalc function
        if (!(substitutedArgs.contains("x") || substitutedArgs.contains("%") || substitutedArgs.contains("/")) || number >= substitutedArgs.count) {
            return args
        }
        let no1 = substitutedArgs[number]
        let op = substitutedArgs[number + 1]
        let no2 = substitutedArgs[number + 2]
        // If there's no multiplication operator, in [number] ~ [number + 2], proceed to the next number scope.
        if !(precedence.contains(op)) {
            return precedentCalc(args: substitutedArgs, number: number + 2)
        } else {
            // IF there's multiplication operator, calculate, insert, remove not-needed arguments(number + 1 ~ 3)
            switch op {
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
            substitutedArgs.remove(at: number + 1)
            substitutedArgs.remove(at: number + 1)
            substitutedArgs.remove(at: number + 1)
            return precedentCalc(args: substitutedArgs, number: number)
        }
    }

    func calculate(args: [String], number: Int) -> String {

        var dummyResult = 0
        let substitutedArgs = precedentCalc(args: args, number: 0)

        // The collection of calculated-by-mltiplication values or the first args's value
        var no1 = Int(substitutedArgs[0])

        // Addition and Subtraction
        for number in stride(from: 0, to: substitutedArgs.count, by: 2) {
            if (number + 2 < substitutedArgs.count) {
                if (substitutedArgs.contains(substitutedArgs[number + 1]) && substitutedArgs.contains(substitutedArgs[number + 2])) {

                    let no2 = substitutedArgs[number + 2]
                    let operations = substitutedArgs[number + 1]

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
            } else {
                dummyResult = no1!
            }
        }

        let result = String(dummyResult);
        return(result)
    }
}
