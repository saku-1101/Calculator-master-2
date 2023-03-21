//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
import Foundation

// Retrieve User Input
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
let operators: [String] = ["+", "-", "/", "%", "x"]
var number: Bool = true
var op: Bool = false

// Parser
func isStringToInt(string: String) -> Bool {
    return Int(string) != nil
}

//**************** ERROR CHECKER ****************//
// Test if the arguments can be parsed to Integer
if args.count == 1 && isStringToInt(string: String(args[0])) == true {
    let result = Int(args[0]);
    print(result!);
    exit(EXIT_FAILURE)
}

// Test if array has more than 3 elements and return error. Also if the array ends in number.
if args.count < 3 || args.count % 2 == 0 {
    print("Invalid input")
    exit(EXIT_FAILURE)
}

// Check arguments are in correct form
for element in args {
    if (operators.contains(String(element)) == false && isStringToInt(string: String(element)) == false) { // No operator and integers
        print("Invalid input format: Input has to contain int and operators only")
        exit(EXIT_FAILURE)
    } else {
        // Test if the format is [number operator number ... number]
        if (isStringToInt(string: String(element)) && op == false) {
            // Proof of the existence of the number
            // when number flag is on, operator flag is off
            number = false;
            op = true;
        } else if (operators.contains(String(element)) && number == false) {
            // Proof of the existence of the operator
            // when number flag is off, operator flag is on
            number = true;
            op = false;
        }
        else {
            print("Invalid input format: must be in form [number operator number ... number]")
            exit(EXIT_FAILURE)
            // Exit code
        }
    }
}


// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result
let result = calculator.calculate(args: args, number: 0);

print(result)
