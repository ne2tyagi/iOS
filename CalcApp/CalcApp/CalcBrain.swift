//
//  File.swift
//  CalcApp
//
//  Created by Neetu Tyagi on 22/01/17.
//  Copyright © 2017 MyPractice. All rights reserved.
//

import Foundation
func multiply(op1: Double, op2: Double)-> Double{
    return op1 * op2
}
func sum(op1: Double, op2: Double)-> Double{
    return op1 + op2
}
func subtract(op1: Double, op2: Double)-> Double{
    return op1 - op2
}
func division(op1: Double, op2: Double)-> Double{
    return op1 / op2
}
class CalcBrain{

    private var accumulator = 0.0
    
    var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "sqrt": Operation.UnaryOperation(sqrt),
        "x": Operation.BinaryOperation(multiply),
        "/": Operation.BinaryOperation({$0 / $1}),
        "+": Operation.BinaryOperation({(op1:Double, op2:Double)->Double in return op1 + op2}),
        "-": Operation.BinaryOperation({(op1, op2)->Double in return op1 - op2}),
        "=": Operation.Equals
    ]
    enum Operation{
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double, Double)->Double)
        case Equals
    }
    
    func setOperand(operand: Double){
        accumulator = operand;
    }
    func performOperation(symbol: String){
        if let constant = operations[symbol]{
            switch constant{
            case .Constant(let res): accumulator = res
            case .UnaryOperation(let foo): accumulator = foo(accumulator)
            case .BinaryOperation(let foo):
                executePendingOpn()
                pending = PendingOperationInfo(binaryFunc: foo, firstOperand: accumulator)
            case .Equals:
                executePendingOpn()
            }
        }
    }
    private func executePendingOpn(){
        if(pending != nil){
            print("op1 \(pending!.firstOperand) op2 \(accumulator)")
            accumulator = pending!.binaryFunc(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingOperationInfo?
    
    struct PendingOperationInfo{
        var binaryFunc: (Double, Double) -> Double
        var firstOperand: Double
    }
    var result: Double{
        get{
            return accumulator
        }
    }
}
