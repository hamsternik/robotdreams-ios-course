/// # Домашнее задания по лекциям #1 и #2

/// ## задание #1
/// объявите константу `country` присвойте ей значение `Ukraine`

/// TBD


/// ## задание #2
/// объявите константу `city` и присвойте ей значение `London`

/// TBD


/// ## задание #3
/// объявите переменную `zipCode` и присвойте ей значение 192168 в качестве строки, а не числа

/// TBD


/// ## задание #4
/// объявите константу `firstName и в качестве значения используйте свое имя


/// TBD


/// ## задание #5
/// объявите константу `lastName` и в качестве значения используйте свою фамилию


/// TBD


/// ## задание #6
/// объявите константу fullName, которая будет содержать полное имя на основе ранее созданных констант firstName и lastName


/// TBD


/// ## задание #7
/// объявите константу `temperature, содержащую числовое значение температуры воздуха


/// TBD


/// ## задание #8
/// используя строковый литерал, выведете в консоль сообщение о сегодняшней погоде
/// используйте объявленные ранее переменные `city` и `temperature`
/// пример "Температура в городе Berlin составит 10 градусов"


/// TBD


/// ## задание #9
/// создайте массив `citites` и наполните его 5 любыми городами


/// TBD


/// ## задание #10
/// измените значение последнего города в массиве выше (имя города любое)


/// TBD


/// ## задание #11
/// выведите названия всех городов в консоль


/// TBD


/// ## задание #12
/// создайте словарь `temperatures`, в котором ключом будет город, а значение -- температура


/// TBD


/// ## задание #13
/// выведете в консоль значение температуры в предпослденем заданом городе


/// TBD


/// ## задание #14
/// проитерируйте массив городов `cities` и выведите в консоль сообщение о погоде в каждом из городов


/// TBD


/// ## задание #15
/// сделайте то же самое, только не используя массив `cities`


/// TBD


/// ## задание #16
/// мы хотим хранить не только температуру, но и состояние погоды
/// создайте словарь `modernTemperatures`, чтобы он содержал не только погоду, но и состояние (`ясно`, `облачно`, `дождь`, `гроза`, `снег`) в качестве значения использовал кортеж (tuple)


/// TBD


/// ## задание #17
/// теперь отобразим более детальный прогноз погоды для каждого города
/// пример: "Температура в городе Берлин составит 10 градусов (ясно)"


/// TBD


/// ## задание #18
/// создайте функцию `greet`, которая приветствует вас, используя ваше полное ФИО


/// TBD


/// ## задание #19
/// вызовите вышесозданную функцию `greet`


/// TBD


/// ## задание #20
/// добавьте функцию `multiply`, которая принимает два аргумента Int и возращает результат их умножения


/// TBD


/// ## задание #21
/// с пом. функции `multiply` выведите в консоль результат умножения числел `256` и `4096`


/// TBD


/// ## задание #22
/// добавьте функцию `div`, которая принимает два аргумента типа Int и возвращает их частное
/// если делитель равен 0, функция возвращает 0


/// TBD


/// ## задание #23
/// c помощью функции `div` вычислите
/// 1) 10 div 5; 2) 5 div 9; 3) 123 div 0


/// TBD


/// ## задание #24
/// создайте структуру `SimpleWeather`, которая будет описывать погоду и содержать свойства `temperature` типа Int и `condition` типа String


/// TBD


/// ## задание #25
/// и создайте экземпляр структуры `SimpleWeather`


/// TBD


/// ## задание #26
/// теперь создайте класс `SimpleCity` для хранения информации о городе
/// пока что достаточно будет иметь название `name` и погоду `weather` (использовать тип выше)


/// TBD


/// ## задание #27
/// и создайте экземлпяр класса `SimpleCity`


/// TBD


/// ## задание #28
/// создайте перечисление (enum) `WeatherCondition`, используйте значения состояния погоды, которые определили выше: (`ясно`, `облачно`, `дождь`, `гроза`, `снег`)


/// TBD


/// ## задание #29
/// теперь, создайте новые типы данных `Weather` и `City` (оба типа -- стурктуры), с использованием типа `WeatherCondition` (см. по аналогии с `SimpleWeather` и `SimpleCity`)


/// TBD


/// ## задание #30
/// создайте массив городов `newCitites`, используя уже ранее созданную переменную `modernTemperatures`. Для значения по умолчанию при создании `WeatherCondition` можно использовать первый case "ясно" (clear).


/// TBD


/// ## задание #31
/// выведите прогноз погоды в уже знакомом нам формате, но с использованием `newCities`. Если отсутсвует `weather` (опциональное значение == nil), то используйте `0` или `WeatherCondition.clear` в зависимости от типа данных
/// пример: Температура в городе Санкт-Петербург составит 10° (дождь)


/// TBD


/// ## задание #32
/// перепишите код выше, используя оператор `guard` в случае отсутствия информации о погоде
/// выведите сообщение "Для города Сочи погода неизвестна"


/// TBD


/// ## задание #33
/// создайте расширение WeatherCondition для отображения состояния в виде emoji


/// TBD


/// ## задание #34
/// выведите в консоль информацию про погоду с использованием emoji для описания состояния погоды


/// TBD
