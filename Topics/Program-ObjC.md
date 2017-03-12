# Программа курса *Разработка под iOS на Obj-C*

Целевая аудитория: разработчики, которые хотят получить фундаментальные знания в разработке приложений на платформе iOS, не изучая Swift. 


## День 1 

#### История Objective-C

* C with objects
* Сообщения Smalltalk
* Префиксы `NS` и `UI` 
* Место Obj-C среди других языков ([Eulogy][1])


#### Создание приложений

* Работа в Xcode
* Шаблон проекта-таблицы
* Использование Storyboards 


#### Views & View Controllers

* Два способа создания Views 
* Свойства объектов
* Auto Layout
* Паттерн delegate
* Приложение с фото


#### Value types

* `struct` vs `class`
* Тонкости `NSMutableArray`
* Пометки `weak` и `assign`
* copy-on-write


#### Nullability

* Billion dollar mistake
* Пометки `nonnull` и `NS_ASSUME_NONNULL_BEGIN`
* Objective-C bridging и аудит SDK
* Обсуждение: nullability в других языках



## День 2


#### Графический стэк яблока

* Работа с GPU на OpenGL, Metal
* Абстракция `CoreImage`
* Реализация фильтра 
* Что такое `CALayer`


#### Dynamic runtime

* vtable vs message dispatch ([It's a Coup][3])
* `objc_msgSend` ( [Let's Build][4] )
* Что такое `id`?
* method swizzling
* Работа с KVO и реактивный стиль


#### Еще о коллекциях

* Generics в Objective-C
* (Co/contra)variance, ( [Tsai][2] )
* Обсуждение: коллекции в других языках
* Материал: [realm](https://realm.io/news/pragma-chris-eidhof-swift-c/)


#### Многопоточность

* Архитектура CPU
* Grand Central Dispatch
* `NSOperationQueue`
* Обсуждение: пометка `atomic`


#### Структура проекта

* Designable views
* Создание frameworks
* Использование CocoaPods
* Hard Mode: On
* Распространение приложений 


## День 3

#### Продвинутые классы

* Отступление об оптимизаторе, материал [Chris Lattner](http://blog.llvm.org/2011/05/what-every-c-programmer-should-know.html)
* Свойства vs методы
* Использование `dealloc`
* Инициализаторы, обсуждение: нужен ли `NS_DESIGNATED_INITIALIZER`


#### Функциональный стиль разработки

* Closures: синтаксис, семантика, внутреннее устройство
* Существительные и глаголы в S-V-O
* `map`, `filter`, `reduce`, `NSPredicate`


#### Core Data

* `NSManagedObject`
* Многопоточность и дерево конктекстов
* mogenerator
* Материал: [Core Data best practices](5)


#### Архитектура разработки

* Dependency Injection и синглетоны
* Обсуждение: who controls View Controllers 
* Дальнейшие источники информации



	[1]: https://realm.io/news/altconf-aaron-hillegass-eulogy-for-objective-c/
	[2]: http://mjtsai.com/blog/2015/11/29/covariance-and-contravariance/
	[3]: http://inessential.com/2014/08/18/michael_on_swift_and_dynamic_dispatch
	[4]: https://www.mikeash.com/pyblog/friday-qa-2012-11-16-lets-build-objc_msgsend.html
	[5]: https://developer.apple.com/videos/play/wwdc2012/214/
