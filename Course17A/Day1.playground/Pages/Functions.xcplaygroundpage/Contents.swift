//: [Previous](@previous)

//: *Если вы видите слева от этой надписи символы слэша и двоеточия, то можно выбрать в меню Editor -> Show Rendered Markup и увидеть красивый текст.*

//: ### Данные

//: Создадим наши массивы данных. Пока что мы это умеем делать только через наборы (...)

let data1 = [
    (1200, 1, "Поездка", "Uber"),
    (380,  1, "Поездка", "Uber"),
    (220,  1, "Поездка", "Yandex.Taxi"),
    (500,  1, "Штраф",   "превышение скорости"),
    (80,  20, "Парковка","парковка"),
    (399,  1, "Еда",     "бизнес-ланч")
]

let data2 = [
    (420,  2, "Поездка", "Аэроэкспресс"),
    (50,  10, "Поездка", "метро"),
    (299,  1, "Еда",     "бизнес-ланч"),
    (159,  1, "Еда",     "печенье"),
]

//: Этот массив содержит данные в евро

let christmas_presents_€ = [
    (19,  1, "Подарки", "книга"),
    (9,   1, "Подарки", "журнал"),
    (39,  3, "Подарки", "гном"),
]

//: Мы можем с помощью map сделать из него данные в рублях

let christmas_presents_RUB = christmas_presents_€.map { (price: Int, quantity: Int, category: String, text: String) in
    return (price * 63, quantity, category, text)
}

//: ### Функции

//: Для определения функций используются слова func, return.
//: Также обязательно указать входящие типы и тип результата:

func describe(price: Int, quantity: Int, category: String, text: String) -> String {
    return "\(category): \(text) – \(quantity) по \(price) рублей"
}

func calculateAmount(price: Int, quantity: Int, category: String, text: String) -> Int {
    return price * quantity
}

//: Мы можем теперь применить функции:

data1.map(describe)
christmas_presents_RUB.map(describe)

(data1 + data2 + christmas_presents_RUB).map(calculateAmount)



//: ### Структуры

//: Для определения структур используется слово struct

struct Purchase {
    
    let price: Int
    let quantity: Int
    let category: String
    let text: String

    func describe() -> String {
        return "\(category): \(text) – \(quantity) по \(price) рублей"
    }
    
    func calculateAmount() -> Int {
        return price * quantity
    }

    func convertedAmount(rate: Double) -> Double {
        return Double(calculateAmount()) / rate
    }

}

//: Теперь можно создавать вещи с этой структурой и вызывать на них функции

let билет = Purchase(price: 50, quantity: 2, category: "Билет", text: "на метро")
билет.calculateAmount()
билет.describe()

//: Конвертируем все данные, которые были наверху, в [Purchase]

let purchases = (data1 + data2 + christmas_presents_RUB) .map { price, quantity, category, text in
    Purchase(price: price, quantity: quantity, category: category, text: text)
}

//: Пример подсчета общей суммы

let GBP = 74.60

let сумма_в_GBP = purchases.map { purchase in
    purchase.convertedAmount(rate: GBP)
}.reduce(0, +)

билет.convertedAmount(rate: GBP)

//: [Next](@next)
