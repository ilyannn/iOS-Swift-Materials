Архитектура 
-----

git:

1. Ветки `master`, `dev`. Для каждой задачи создаем ветку `feature-...` и сливаем потом с `dev`. После тестирования ветка `dev` сливается с `master`.
1. [Именование коммитов](http://chris.beams.io/posts/git-commit/#seven-rules): in English, imperative mood, short. [И еще тут](http://faq.sealedabstract.com/commit%20messages/)
2. Лучше много маленьких коммитов чем один большой
2. Build number приложения = количество коммитов в dev (обновляется перед релизом автоматически или запуском скрипта). Достоинство этого подходв: гарантированно монотонно возрастает.
1. [`.gitignore`](https://www.gitignore.io)

Код:

1. [Мы не используем style guides](http://faq.sealedabstract.com/styleguides/). Но надо настроить форматирование кода с помощью [BBUncrustify](https://github.com/benoitsan/BBUncrustifyPlugin-Xcode).
1. **Hard Mode:** Использование [большого файла с warnings](Warnings.xcconfig), включая  `GCC_TREAT_WARNINGS_AS_ERRORS`.
Мотивация: в начале работы над задачей не должно быть предупреждений от прошлых задач.
1. Используем сортировку `#import`([автоматизация](http://stackoverflow.com/a/8104750)). Предпочитаем `@import`для системных библиотек.

Архитектура:

1. Подключать библиотеки с CocoaPods.

Общие концепции 

1. Синглетоны это плохо (но можно `static` переменные если они неизменяемые и в `@implementation`)
2. Изменяемое состояние это плохо
