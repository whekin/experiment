{
  * 1. В массиве box, 0 - синий, 1 - красный
  * 2. eventNumber:
  *      0 - синий и синий
  *      1 - синий и красный
  *      2 - красный и красный
  * 3. Программа снабжена подробными комментариями,
  *    чтобы тем, у кого мало опыта было проще.
}

const
    pencilCount = 5;
    blueCount = 3;
    redCount = 2;
    eventCount = 3;
    n = 100;
var
    // Наша коробка с карандашами
    box: array [0..pencilCount - 1] of integer;
    // Номера случайно выбранныъ карандашей
    firstPencilIndex, secondPencilIndex,
    // Код события (1, 2, 3)
    eventNumber,
    i: integer;
    // Массив, содержащий количество повторений событий
    m: array [0..eventCount - 1] of integer;
    // Содержин относительную частоту повторений. Получается из предыдущего
    relativeFreq: array [0..eventCount - 1] of real;
    // Массив абсолютных погрешностей
    p: array [0..eventCount - 1] of real;
    // Массив наших аналитически найденных вероятностей
    mathProbability: array [0..eventCount - 1] of real = (0.3, 0.6, 0.1);
begin
    // Заполняем коробку синими карандашами
    for i := 0 to blueCount - 1 do
        box[i] := 0;
    // и красными 
    for i := 0 to redCount - 1 do
        box[i + blueCount] := 1;
    
    for i := 0 to n - 1 do
    begin
        // Определяем псевдо-случайно наши карандаши
        firstPencilIndex := Random(pencilCount); 
        secondPencilIndex := Random(pencilCount);
        // и если мы случайно вытащили один и тот же карандаш два раза,
        // то, чтобы вселенную не разовало на кусочки, повторим попытку еще раз
        while firstPencilIndex = secondPencilIndex do
            secondPencilIndex := Random(pencilCount);
        
        // Определем произошедшее событие
        if box[firstPencilIndex] = box[secondPencilIndex] then
            if box[firstPencilIndex] = 0 then
                eventNumber := 1
            else
                eventNumber := 3
        else
            eventNumber := 2;
        // Увеличиваем счетчик произошедшего события
        m[eventNumber - 1] += 1; 
    end;
    
    // И здесь определям относительную частоту и абсолютную погрешность.
    for i := 0 to eventCount - 1 do
    begin
        relativeFreq[i] := m[i] / n;
        p[i] := abs(mathProbability[i] - relativeFreq[i]);
    end;
    
    writeln('Частота');
    writeln(m);
    writeln;
    
    writeln('Относительная частота:');
    writeln(relativeFreq);
    writeln;
    
    writeln('Абсолютная поргешность:');
    writeln(p);
end.
