# Домашнее задание #7

## Техническое Задание

Требуется создать одноэкранное приложение, отображающее все публичные (доступные в открытом доступе) репозитории вашего пользователя на GitHub.

## Детальное Описание

В ходе разработки требуется создать iOS приложение с таким функционалом:

- приложение состоит из одного экрана
- заголовок экрана должен называться "Repositories"
- на экране отображается список всех публичных репозиториев
- сам "список" будет динамичеким, поэтому использовать UITableViewController / UICollectionViewController (на выбор)
- список репозиториев нужно получать с пом. [GitHub API](https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api)
- использовать URL для запроса: https://api.github.com/users/%логин твоего пользователя%/repos
- если response получен и нет ошибки, весь массив данных нужно сохранить локально на диске (использовать `UserDefaults`)
- в случае первичного запуска приложения (т.к. нет сохраненные данных на диске) пока данные скачиваются из сети, нужно показывать [Activity Indicator](https://www.ioscreator.com/tutorials/activity-indicator-ios-tutorial-)
- когда response получен, нужно остановить и спрятать Activity Indicator и показать соответствующий UI
- если пришел success response -- показывать пользователю список его публичных репозиториев
- если пришел failer response (есть Error и нет данных) -- показывать пользователю текст с ошибкой и кнопку `Retry`
- при нажатии на кнопку `Retry` приложение должно повторно отправить запрос в сеть, скрыть сообщение об ошибке с кнопкой, вместо них показать Activity Indicator
- в случае вторичного запуска приложения, приложение должно брать данные из UserDefaults
- если данные есть из UserDefaults, мы не должны отправлять запрос в сеть