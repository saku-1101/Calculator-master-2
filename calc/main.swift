//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Retrieve User Input

//let no1 = Int(args[0]); // Sample Code Only! Update Required!
//let opr = args[1]; // Sample Code Only! Update Required!
//let no2 = Int(args[2]); // Sample Code Only! Update Required!

// Parse Integer //
    // Default values //
//var no1: Int = 0
//var opr: String = ""
//var no2: Int = 0
// Checking if the command line arguments are valid. If not your program must generate an appropriate error message and then terminate with nonzero exit status.
//if let val = Int(args[0]){
//    no1 = val
//    print(no1)
//}else{
//    print("exit with nonzero status on invalid input: \(args)")
//}
//if operators.contains(args[1]){
//    opr = args[1]
//    print(opr)
//}else{
//    print("exit with nonzero status on invalid input: \(args)")
//}
//if let val = Int(args[2]){
//    no2 = val
//    print(no2)
//}else{
//    print("exit with nonzero status on invalid input: \(args)")
//}
//print(no1, opr, no2)




// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result
let result = calculator.calculate(args: args);

print(result)
