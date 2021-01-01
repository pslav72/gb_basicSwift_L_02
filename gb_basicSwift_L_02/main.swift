//
//  main.swift
//  gb_basicSwift_L_02
//
//  Created by Вячеслав Поляков on 29.12.2020.
//

import Foundation

let delimiter: String = "===================="

/*
 1. Написать функцию, которая определяет, четное число или нет.
 */

print("1. Написать функцию, которая определяет, четное число или нет.")
func checkEvenNum(number: Int) -> String {
    if (number % 2) == 0 {
            return "Число \(number) четное."
        }
    else {
        return "Число \(number) нечетное."
    }

}

let numbersTask1: [Int] = [4,5,6,8,10,11]

for number in numbersTask1 {
    print(checkEvenNum(number: number))
}

print(delimiter)

/*
 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
 */
print("2. Написать функцию, которая определяет, делится ли число без остатка на 3.")

func checkDivisionWithoutRemainder(number: Int, divisionNumber: Int) -> String {
    if (number % divisionNumber) == 0 {
            return "Число \(number) делится без остатка."
        }
    else {
        return "Число \(number) делится с остатком."
    }

}

let numbersTask2: [Int] = [4,6,8,10,11,12,17,24]
let divisionNumber: Int = 3

for number in numbersTask2 {
    print(checkDivisionWithoutRemainder(number: number, divisionNumber: divisionNumber))
}

print(delimiter)

/*
 3. Создать возрастающий массив из 100 чисел.
 */

print("3. Создать возрастающий массив из 100 чисел.")

var ascendingArray: [Int] = Array(1...100)

print("Получен возрастающий массив \(ascendingArray)")

print(delimiter)

/*
 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
 */

print("4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")

func checkDivisionWithoutRemainderTask4(number: Int, divisionNumber: Int) -> Bool {
    if (number % divisionNumber) != 0 || (number % 2) == 0 {
            return true
        }
    else {
        return false
    }

}

let divisionNumberTask4: Int = 3
var statusCheck: Bool

var clearedArray: [Int] = []

for number in ascendingArray {
    statusCheck = checkDivisionWithoutRemainderTask4(number: number, divisionNumber: divisionNumberTask4)
    statusCheck ? clearedArray.append(number): nil
}

print("Массива с четными числами и все числа, которые не делятся на 3 = \(clearedArray).")

print(delimiter)

/*
 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

 Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
 */

print("5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.")

let arraySize: Int = 100
//Словарь для подсчитанных значений
var dictNumFibonachy: [Double:Double] = [:]
//Вычиляемое значение Фибоначи
var numFibonachy: Double = 0
//Массив чисел Фибоначи
var arrayNumFibonachy: [Double] = []

func fib(number: Double) -> Double {
    if number == 0 {return 0}
    if number == 1 {return 1}
    //Если есть просчитанное значение, возвращаем его
    if dictNumFibonachy[number] != nil {
        return dictNumFibonachy[number]!
    }
    numFibonachy = fib(number: number - 1) + fib(number: number - 2)
    dictNumFibonachy[number] = numFibonachy
    return numFibonachy
}

for number in 0...arraySize - 1 {
    arrayNumFibonachy.append(fib(number: Double(number)))
}
print("Массив из 100 элементов чисел Фибоначчи:")
print(arrayNumFibonachy)

print(delimiter)

/*
 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
 */

print("Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена.")
//Указываем длину массива, для генерации
var lenArray: Int = 100
//Создаем массив из 100 элементов
var numArray: [Int] = Array(1...lenArray)
//Так как простые числа > 1, то убираем первый элемент
numArray[0] = 0
//Новый массив, для заполнения простыми числами
var simpleNumArray: [Int] = []
//Отображаем сгенерированный массив чисел
print("Массив чисел, для поиска простых чисел: \(numArray)")

var p: Int = numArray[1]

//Зачеркнуть в списке числа от 2p до lenArray считая шагами по p
for idx in p...lenArray {
    if numArray[idx - 1] != 0 {
        for step in stride(from: idx, through: lenArray, by: idx) {
            step != idx ? numArray[step - 1] = 0 : nil
        }
    }
}

//Выбираем простые числа, все остальные = 0
for number in numArray {
    if number != 0 {
        simpleNumArray.append(number)
    }
}
print("Массив простых чисел: \(simpleNumArray)")
print(delimiter)
