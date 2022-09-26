import UIKit

// Функция, принимающая функцию как параметр.
func addition(a: Int, b: Int) -> Int {
    return a + b
}
 
func subtraction(a: Int, b: Int) -> Int {
    return a - b
}
 
func multiply(a: Int, b: Int) -> Int {
    return a * b
}
 
func division(a: Int, b: Int) -> Int {
    return a / b
}
 
func calculate(a: Int, b: Int, operation: (Int, Int) -> Int) {
    let result = operation(a, b)
    print(result)
}
 
calculate(a: 7, b: 2, operation: addition)
calculate(a: 7, b: 2, operation: subtraction)
calculate(a: 7, b: 2, operation: multiply)
calculate(a: 7, b: 2, operation: division)


// Функция с несколькими замыканиями.
func compareTwoOperands(a: Int, b: Int, more: (String) -> Void, less: (String) -> Void) {
    if a > b {
        more("a > b")
    }
    if a < b {
        less("a < b")
    }
}

compareTwoOperands(a: 3, b: 2) { strMore in
    print(strMore)
} less: { strLess in
    print(strLess)
}


// Функция с autoclosure.
var customersInLine = ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))


// Использование внутренних функций.
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = 5
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
print("0!")


// Дженерик-функция с условием.
func simpleMax<T: Comparable>(_ x: T, _ y: T) -> T {
    if x < y {
        return y
    }
    return x
}

print(simpleMax(13, 37))
print(simpleMax(2.28, 8.800553535))
