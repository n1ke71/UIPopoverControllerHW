# UIPopoverControllerHW

Ученик

1. Создайте универсальное приложение (айпад / айфон)
2. Первый контроллер должен быть статической таблицей с навигейшн баром
3. В правом углу на навигейшине должна быть кнопка инфо, если на нее нажать, то вылазит поповер с объяснением, что это такое за приложение :)

Студент

4. В таблице создайте классические ячейки:
имя + текстфилд
фамилия + текстфилд
пол + сегментед контрол (мужской/женский)
Дата рождения + текстфилд
Образование + текстфилд

5. с первыми тремя ячейками все понятно, а вот дальше самое интересное

Мастер

6. При нажатии на текст филд с датой рождения текст филду должно быть запрещено входить в режим редактирования, а вместо этого из него должен появиться поповер с UIDatePicker. При изменении даты, содержимое текст филда должно меняться (то есть мы не мучаем юзера форматами ввода, мы просто даем ему барабан с датами и предлагаем выбрать самому)

7. Подсказка. Вам надо сделать контроллер с дейт пикером, а дейт пикер это наследник от UIControl, то есть у него есть акшин valueChanged или типо того. У контроллера нужно создать проперти делегат, по которому мы будем отправлять данные, полученные с барабана. То есть по простому: контроллер следит за барабаном и отправляет изменения своему делегату. Не забудьте установить делегат перед создания поповера.

Супермен

8. Тоже самое сделать с образованием. Образование это список типа, неполное среднее, среднее, неполное высшее, высшее и тд, то есть если делать в сегментед контролах, то не поместится.

9. Когда нажимаем на образование, появляется поповер с контроллером и таблицей. Причем, выбранное образование должно быть отмечено чекбоксом. (кстати выбранная дата рождения в мастере тоже должна стоять по умолчанию в новом поповере)

10. У этого контроллера тоже должен быть делегат. По нажатию на ячейку вы должны изменить текущий выбор на новый (поменять чекбокс) и передать сообщение делегату, после чего тот должен изменить содержимое текст филда 