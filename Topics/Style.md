Guide
-----

[About style guides](http://faq.sealedabstract.com/styleguides/)

1. [Именование коммитов](http://chris.beams.io/posts/git-commit/#seven-rules): in English, imperative mood, short. [И еще тут](http://faq.sealedabstract.com/commit%20messages/)
1. Форматирование кода, желательно с помощью [BBUncrustify](http://chris.beams.io/posts/git-commit/#seven-rules)
2. Использование `GCC_TREAT_WARNINGS_AS_ERRORS`и [большого файла с warnings](https://github.com/boredzo/Warnings-xcconfig).
Мотивация: в начале работы над задачей не должно быть предупреждений от прошлых задач.


Архитектура:

1. Подключать библиотеки с CocoaPods
2. В Objective-C нужен префикс проекта
3. [git submodules](http://faq.sealedabstract.com/git_submodules/)

Общие концепции 

1. Синглетоны это плохо (но можно `static` переменные если они неизменяемые и в `@implementation`)
2. Изменяемое состояние это плохо
