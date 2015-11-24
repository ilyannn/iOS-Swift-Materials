## День 1

**Работа со Swift**
 
* Playgrounds как современный REPL-loop, материал: книга Erica Sadun
* Материалы: примеры из статей и других языков
* Обсуждение: принципиальные отличия в возможностях компиляторов 

**value types**

* `struct` vs `class`
* Многопоточность и copy-on-write
* Пример: WWDC Video
* Обсуждение: коллекции в других языках


## День 2

**Подробнее о типах**
* Особенности системы типов в Swift
* Итераторы и lazy computation
* Алгебраические типы

**Важные типы**
* `Optional<T>`
* Обсуждение: nullability в других языках
* Objective-C bridging и аудит SDK
* Настоящий Unicode для строк
* Материал: https://www.mikeash.com/pyblog/friday-qa-2015-11-06-why-is-swifts-string-api-so-hard.html


## День 3

**Функциональный стиль разработки**
* First-class functions, `@noescape` etc
* Существительные и глаголы в S-V-O
* Closures: синтаксис, семантика, внутреннее устройство
* Использование монад
* Пример: MapReduce
* Материал: Functional Programming in Swift

**Новые возможности классов**

* Область видимости и отступление об оптимизаторе
* Static dispatch и чем private лучше inline
* (Co/contra)variance 
* Свойства vs методы
* Обсуждение: нужен ли `NS_DESIGNATED_INITIALIZER`
 

## День 4

**Погружение в generics**
* Протоколы и их имплементация
* Generics в Objective-C

**Операторы всякие важны**
* `guard` как решение проблемы pyramid of doom
* Новые возможности `switch`
* Обработка ошибок: `guard` vs `throws`
* Обсуждение: создавать свой язык – хорошо или плохо
* Примеры: SQLModel, Cartography
* Материал: Core Data best practices by example



## День 5

**Новые средства разработки**

* Наконец-то namespacing!
* Designable views

**Архитектура разработки**

* Hard Mode: On
* Локальные имена и encapsulation
* Dependency Injection и синглетоны
* Реактивный стиль, пример: RxSwift
* Обсуждение: who controls View Controllers
* Материалы: https://www.objc.io/issues/13-architecture/viper/

