# Домашнее задание #5

## Техническое Задание

Создать Xcode Playground и реализовать практических задач, используя синхронный либо асинхроный код.
Резульатат выложить на ваш GitHub аккаут используя для этого отдельный репозиторий наз. "robotdreams-homework05".

### Задача №1

Написать функцию `func sum(first: Int, second: Int, last: Int) -> Int`, где вычесление суммы трёх аргументов должно происходить внутри вызова метода `sync`, используя собственно созданную приватную очередь.

Написать 5 примеров использования этой функции.

### Задача №2

Написать функцию `func subtract(second: Int, from first: Int) -> Int` для вычесление разницы между first и second.

Логика вычисления разницы должна выполняться внутри вызова метода `async`, используя собственно созданную приватную очередь.

Написать 5 примеров использования этой функции.

### Задача №3

Написать функцию для нахождения значения по формуле `x*x*x + 2*x - x*x`.

Применить функцию для нахождения всех значений от 0 до 100, результат каждого полученного значения выводить в консоль.

Логика вычисления разницы должна выполняться внутри вызова метода `async`, используя собственно созданную приватную очередь.

### Задача №4

Вывести текст "Hello, World!" через 5 секунд в другой очереди.

### Задача №5

Создать таймер (см. `Timer`) и через 5 секунд после запуска посчитать результат суммы двух чисел: твоего дня и месяца рождения.

Для расчёта суммы нужно написать отдельную функцию, где вся логика будет выполняться на отедьной приватной очереди асинхроно.

Результат вывести в консоль на главной очереди.
