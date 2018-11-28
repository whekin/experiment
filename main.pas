const
    pencilCount = 5;
    blueCount = 3;
    redCount = 2;
    eventCount = 3;
    n = 100;
var
    box: array [0..pencilCount - 1] of integer;
    firstPencilIndex, secondPencilIndex,
    eventNumber,
    i: integer;
    m: array [0..eventCount - 1] of integer;
    relativeFreq: array [0..eventCount - 1] of real;
    p: array [0..eventCount - 1] of real;
    mathProbability: array [0..eventCount - 1] of real;
begin
    mathProbability[0] := 0.3;
    mathProbability[0] := 0.6;
    mathProbability[0] := 0.1;
    
    for i := 0 to blueCount - 1 do
        box[i] := 0;

    for i := 0 to redCount - 1 do
        box[i + blueCount] := 1;
    
    for i := 0 to n - 1 do
    begin
        firstPencilIndex := Random(pencilCount); 
        secondPencilIndex := Random(pencilCount);

        while firstPencilIndex = secondPencilIndex do
            secondPencilIndex := Random(pencilCount);
        
        if box[firstPencilIndex] = box[secondPencilIndex] then
            if box[firstPencilIndex] = 0 then
                eventNumber := 1
            else
                eventNumber := 3
        else
            eventNumber := 2;

        m[eventNumber - 1] += 1; 
    end;
    
    for i := 0 to eventCount - 1 do
    begin
        relativeFreq[i] := m[i] / n;
        p[i] := abs(mathProbability[i] - relativeFreq[i]);
    end;
    
    writeln('Частота');
    for i := 0 to eventCount - 1 do
        write(m[i] + ', ');
    writeln;
    
    writeln('Относительная частота:');
    for i := 0 to eventCount - 1 do
        write(relativeFreq[i], ', ');
    writeln;
    
    writeln('Абсолютная поргешность:');
    for i := 0 to eventCount - 1 do
        write(p[i], ', ');
end.
