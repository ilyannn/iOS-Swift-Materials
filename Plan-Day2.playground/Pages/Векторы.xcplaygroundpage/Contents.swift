//: [Предыдущая страница: Поисковик](@previous)

//: # Векторы

//: *В папочке `Sources` к этой странице лежит файл с логикой создания двуменых картинок. Чтобы увидеть картинку, надо нажать справа, там где подсчитано значение выражения, символ просмотра (глаз) или плюсик.*


import Foundation

//: Вот так выглядит пустая картинка

Canvas()

//: ## Структуры 

//: Несколько типов можно сгруппировать в один тип. Например, опрелелим вектор как набор из двух дробных чисел. 

//: Написав `CustomPlaygroundQuickLookable` мы сообщили Xcode что мы хотели бы реализовать специальный метод, который возвращает объект для *Quick Look*.

struct Vector: CustomPlaygroundQuickLookable {
    let dx: Double
    let dy: Double

//: Пример создания функции без аргументов:
    
    func length() -> Double {
        return sqrt(dx * dx + dy * dy)
    }

//: Мы реализуем метод для Quick Look с помощью подготовленной мной функции.
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return CanvasQuickLook {canvas in

//: И нарисуем на подготовленном холсте:
        	canvas.drawVector(dx: dx, dy: dy)
        }
    }

}

//: Правильно ли мы определили длину вектора? И если да, то почему это выражение не равно в точности 0?
Vector(dx: 1, dy: 1).length() * 3 - Vector(dx: 3, dy: 3).length()

//: ## Операции

//: Создание вектора – вызов конструктора, синтаксис как в Java и других языках.
let A =  Vector(dx: 4, dy: 0)

//: Мы можем определить арифметические операции с векторами.

func +(a: Vector, b: Vector) -> Vector {
    return Vector(dx: a.dx + b.dx, dy: a.dy + b.dy)
}

func -(a: Vector, b: Vector) -> Vector {
    return Vector(dx: a.dx - b.dx, dy: a.dy - b.dy)
}

func *(a: Double, b: Vector) -> Vector {
    return Vector(dx: a * b.dx, dy: a * b.dy)
}

//: Унарные операции бывают `prefix` и `postfix`
prefix func -(a: Vector) -> Vector {
    return (-1) * a
}

//: Сравнение – тоже операция
func ==(a:Vector, b:Vector) -> Bool {
    return a.dx == b.dx && a.dy == b.dy
}

//: Давайте проверим математические выражения
let B = Vector(dx: 0, dy: 1)

A + B + B + (-A) == 2 * B

2 * B + A

// ## Повороты

let π = M_PI

A

//: Допустим, у нас есть вектор с заданной длиной и мы хотим его повернуть.
let angle = π / 10
let length = 4.0

//: Поворот вектора, который смотрит направо
Vector(dx: length * cos(angle), dy: length * sin(angle))

//: Поворот вектора, который смотрит наверх
Vector(dx: length * cos(angle + π/2), dy: length * sin(angle + π/2))

//: Для определения объектной функции повотора не обязательно возвращаться в место первоначального определения структуры. Можно сделать `extension` существующего типа.

extension Vector {
    func rotate(angle: Double) -> Vector {

//: Чтобы определить как делается поворот, достаточно представить вектор как сумму двух векторов, по оси X и по оси Y. Для каждого из этих случаев мы уже разобрали как делается поворот.
        
//        let направо = Vector(dx: dx * cos(angle), dy: dx * sin(angle)) 
//        let наверх = Vector(dx: dy * cos(angle + π/2), dy: dy * sin(angle + π/2)) 
//        return направо + наверх
        
//: Или, если написать более компактно:
        
        return Vector(
            dx: dx * cos(angle) - dy * sin(angle) , 
            dy: dx * sin(angle) + dy * cos(angle)
        )
    }
}

//: ## Оператор `for`

let original = Vector(dx: 3, dy: 3)
let rotated = Vector(dx: 3, dy: 3).rotate(π/4)

//: Еще одна структура: диаграмма, на которой может быть несколько векторов.

struct Diagram: CustomPlaygroundQuickLookable {
    let vectors: [Vector]
    
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return CanvasQuickLook {canvas in

//: Чтобы применить операцию к нескольким элементам массива, мы можем воспользоваться оператором `for ... in `. Он автоматически определяет имя `vector` (как будто мы написали `let vector = ...`).

            for vector in vectors {
                canvas.drawVector(dx: vector.dx, dy: vector.dy)
            }
        }
    }
}

//: Посмотрим на результат:
Diagram(vectors: [original, original.rotate(π/5), original.rotate(20 / 180.0 * π)])

