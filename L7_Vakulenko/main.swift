//
//  main.swift
//  L7_Vakulenko
//
//  Created by Roman Vakulenko on 20.05.2022.
//

import Foundation
////1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
class calculations {
    var varFirst: Double
    var varSecond: Double

    init (varFirst: Double, varSecond: Double) {
        self.varFirst = varFirst
        self.varSecond = varSecond
    }

    func dividing () -> Double? {
        let result = varFirst/varSecond
        guard varSecond != 0 else {return nil}
        return result
        }
}
extension calculations: CustomStringConvertible {
    var description: String {
        return "The result of calculations = \(String(describing: dividing()))"
    }
}
let calcOne = calculations.init(varFirst: 5.0, varSecond: 0.0)
print(calcOne)

//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
enum ErningTerms: Error {
case negativeValueOrZero
case lowerThanMinimunSalary
}

class salary {
    
    func writeSalary () throws -> Int {
        print("\nwrite salary")
        let salaryString = readLine()
        
        guard let salaryString = salaryString, let salary = Int(salaryString), salary > 0 else {
            throw ErningTerms.negativeValueOrZero
        }
        guard salary > 10000 else {
            throw ErningTerms.lowerThanMinimunSalary
        }
        return salary
        }
}
do {
    let earned = salary()
    try earned.writeSalary()
    print("get you salary!")
}
catch (let someError) {
    print("Smth wrong - salary can't be \(someError)")
}



