Guide
-----

[About style guides](http://faq.sealedabstract.com/styleguides/)

1. [Именование коммитов](http://chris.beams.io/posts/git-commit/#seven-rules): in English, imperative mood, short.
1. Форматирование кода, желательно с помощью [BBUncrustify](http://chris.beams.io/posts/git-commit/#seven-rules)
2. Использование `GCC_TREAT_WARNINGS_AS_ERRORS`и [большого файла с warnings](https://github.com/boredzo/Warnings-xcconfig).
Мотивация: в начале работы над задачей не должно быть предупреждений от прошлых задач.


Архитектура:

1. Не использовать синглетоны (но можно `static` переменные если они неизменяемые и в `@implementation`)
1. Подключать библиотеки с CocoaPods
2. В Objective-C нужен префикс проекта
3. [git submodules](http://faq.sealedabstract.com/git_submodules/)

