# Программа курса *Swift для Obj-C разработчиков*

Материалы: *[Advanced Swift](https://www.objc.io/books/advanced-swift/)*

## День 1

**Работа со Swift**
 
* Playgrounds как современный REPL-loop, материалы: [*Playground Secrets and Power Tips* (Erica Sadun)](https://leanpub.com/playgroundsecretsandpowertips)
* Основные типы и примеры
* Материалы: примеры из статей и других языков

**Value types**

* `struct` vs `class`
* Многопоточность и copy-on-write
* Пример: WWDC Video [405](https://developer.apple.com/videos/play/wwdc2015-405/)

**Строки**

* Настоящий Unicode для строк
* Материал: [Tsai blog](https://www.mikeash.com/pyblog/friday-qa-2015-11-06-why-is-swifts-string-api-so-hard.html)

## День 2

**Подробнее о типах**

* Особенности системы типов в Swift
* Алгебраические типы
* (Co/contra)variance, материал [Tsai](http://mjtsai.com/blog/2015/11/29/covariance-and-contravariance/)
* Обсуждение: коллекции в других языках

**`Optional<T>`**

* Типы `T?`, `T??`, `T!`
* Обсуждение: nullability в других языках
* Objective-C bridging и аудит SDK

**Удобство языка Swift**

* Итераторы и lazy computation
* Область видимости и namespacing
* Static dispatch и чем private лучше inline
* Отступление об оптимизаторе, материал [Chris Lattner](http://blog.llvm.org/2011/05/what-every-c-programmer-should-know.html)
* Обсуждение: принципиальные отличия в возможностях компиляторов 

**Продвинутые классы**

* Правила virtual vs dynamic dispatch
* Свойства vs методы
* Инициализаторы, обсуждение: нужен ли `NS_DESIGNATED_INITIALIZER`
 

## День 3

**Функциональный стиль разработки**

* First-class functions, `@noescape` etc
* Существительные и глаголы в S-V-O
* Closures: синтаксис, семантика, внутреннее устройство
* Использование монад, [по-русски](http://habrahabr.ru/post/272115/)
* Пример: MapReduce
* Материал: *[Functional Programming in Swift](https://www.objc.io/books/fpinswift/)*

**Реактивный стиль разработки**

* Пример: RxSwift


## День 4

**Погружение в generics**

* Протоколы и их имплементация, материал [408](https://developer.apple.com/videos/play/wwdc2015-408/), [414](https://developer.apple.com/videos/play/wwdc2015-414/)
* Generics в Objective-C
* Материал: [realm](https://realm.io/news/pragma-chris-eidhof-swift-c/)

**Операторы всякие важны**

* `guard` как решение проблемы pyramid of doom
* Новые возможности `switch`
* Обработка ошибок: `guard` vs `throws`
* Обсуждение: создавать свой язык – хорошо или плохо
* Примеры: SQLModel, Cartography


## День 5

**Новые средства разработки**

* Создание frameworks
* Designable views
* Материал: Core Data best practices by example

**Архитектура разработки**

* Hard Mode: On
* Локальные имена и encapsulation
* Dependency Injection и синглетоны
* Материалы: [VIPER](https://www.objc.io/issues/13-architecture/viper/)
* Обсуждение: who controls View Controllers

