# День 1
1. Современные языки программирования*
 Swift –много парадигм  
 Неизменяемость & _nullability_
 _Generics_ & _protocols_
 Материалы: примеры из статей и других языков
 Обсуждение: принципиальные отличия в возможностях  компиляторов 

*2. Средства разработки*
 Playgrounds как современный REPL-loop, материал: книга Erica Sadun
 Интеграция Obj-C + Swift
 Наконец-то namespacing!
 Designable views

# День 2

*3. Функциональный стиль разработки*
 First-class functions, `@noescape` etc
 Существительные и глаголы в S-V-O
 Closures: синтаксис, семантика, внутреннее устройство
 Использование монад
 Пример: MapReduce
 Материал: Functional Programming in Swift

*4. Работа с value types*
 `struct` vs `class`
 Протоколы и их имплементация
 Многопоточность и copy-on-write
 Пример: WWDC Video
 Обсуждение: коллекции в других языках

# День 3

*5. Подробнее о типах*
 Особенности системы типов в Swift
 Итераторы и lazy computation
  `nil` и алгебраические типы
 Настоящий Unicode для строк, материал: https://www.mikeash.com/pyblog/friday-qa-2015-11-06-why-is-swifts-string-api-so-hard.html
 (Co/contra)variance 

# День 4

*6. Новые возможности классов*
Область видимости и лирическое отступление об оптимизаторе
Static dispatch и чем private лучше inline
Objective-C bridging и аудит SDK
Свойства vs методы
Погружение в generics
Обсуждение: нужен ли `NS_DESIGNATED_INITIALIZER`

*7. Операторы всякие важны*
 `guard` как решение проблемы pyramid of doom
 Новые возможности `switch`
 Обработка ошибок: `guard` vs `throws`
 Обсуждение: создавать свой язык – хорошо или плохо
 Примеры: SQLModel, Cartography
 Материал: Core Data best practices by example

# День 5

*8. Архитектура разработки*
 Hard Mode: On
 Локальные имена и encapsulation
 Dependency Injection и синглетоны
 Реактивный стиль, пример: RxSwift
 Обсуждение: who controls View Controllers
 Материалы: https://www.objc.io/issues/13-architecture/viper/

