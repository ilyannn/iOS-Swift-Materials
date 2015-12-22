# Программа курса *Swift для Obj-C разработчиков*

Материалы: *[Advanced Swift](https://www.objc.io/books/advanced-swift/)*


## День 1

**Работа со Swift**
 
* Playgrounds как современный REPL-loop, материалы: [*Playground Secrets and Power Tips* (Erica Sadun)](https://leanpub.com/playgroundsecretsandpowertips)
* Основные типы и примеры
* Материалы: примеры из статей и других языков

**Value types**

* `struct` vs `class`
* Неизменяемость
* Использование `mutating`
* Многопоточность и copy-on-write
* Пример: WWDC Video [405](https://developer.apple.com/videos/play/wwdc2015-405/)

**Строки**

* Настоящий Unicode для строк
* Материал: [Tsai blog](https://www.mikeash.com/pyblog/friday-qa-2015-11-06-why-is-swifts-string-api-so-hard.html)


## День 2

**Подробнее о типах**

* Особенности системы типов в Swift
* Алгебраические типы
* Введение в generics 
* (Co/contra)variance, материал [Tsai](http://mjtsai.com/blog/2015/11/29/covariance-and-contravariance/)
* Обсуждение: коллекции в других языках

**`Optional<T>`**

* Типы `T?`, `T??`, `T!`
* Обсуждение: nullability в других языках
* Objective-C bridging и аудит SDK

**Пример с `Queue`**

* Итераторы и lazy computation
* Использование generic-протоколов
* `GeneratorType`, `SequenceType`, `CollectionType`
* `Custom(Debug)StringConvertible`, `ArrayLiteralConvertible`
* Custom operators 
* Ranges, slices & subscription

**Удобство языка Swift**

* Порядок вычисления, `@autoclosure`
* Область видимости и namespacing
* vtable vs message dispatch
* Automatic currying


## День 3

**Продвинутые классы**

* Static dispatch и чем private лучше inline
* Отступление об оптимизаторе, материал [Chris Lattner](http://blog.llvm.org/2011/05/what-every-c-programmer-should-know.html)
* Обсуждение: принципиальные отличия в возможностях компиляторов 
* Свойства vs методы
* Особенности `deinit`
* Инициализаторы, обсуждение: нужен ли `NS_DESIGNATED_INITIALIZER`

**Функциональный стиль разработки**

* First-class functions, `@noescape` etc
* Существительные и глаголы в S-V-O
* Closures: синтаксис, семантика, внутреннее устройство
* Пример: MapReduce
* Материал: *[Functional Programming in Swift](https://www.objc.io/books/fpinswift/)*


## День 4

**Погружение в generics**

* Имплементация протоколов, материал [408](https://developer.apple.com/videos/play/wwdc2015-408/), [414](https://developer.apple.com/videos/play/wwdc2015-414/)
* Generics в Objective-C
* Материал: [realm](https://realm.io/news/pragma-chris-eidhof-swift-c/)

**Операторы всякие важны**

* `guard` как решение проблемы pyramid of doom
* Новые возможности `switch`, `if`, `for`, `while`
* Обсуждение: создавать свой язык – хорошо или плохо
* Примеры: SQLModel, Cartography


## День 5

**Продвинутый flow control**

* Использование *монад*:[статья](http://blogs.msdn.com/b/wesdyer/archive/2008/01/11/the-marvels-of-monads.aspx), [sigfpe](http://blog.sigfpe.com/2006/08/you-could-have-invented-monads-and.html), [хабр](http://habrahabr.ru/post/272115/)
* Обработка ошибок: `NSError` vs `throws`
* *Реактивный* стиль разработки, пример: RxSwift

**Полезные вещи**

* Создание frameworks
* Designable views
* Материал: Core Data best practices by example

**Архитектура разработки**

* Hard Mode: On
* Локальные имена и encapsulation
* Dependency Injection и синглетоны
* Материалы: [VIPER](https://www.objc.io/issues/13-architecture/viper/), [Coordinators](http://khanlou.com/2015/10/coordinators-redux/) / [Activities](https://github.com/ilyannn/iOS-Swift-Materials/blob/master/Topics/Activities.md)
* Обсуждение: who controls View Controllers 
