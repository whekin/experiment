program color; 
const
    pencilCount = 5;
    eventCount = 3;
    n = 100;
var
    box: array [0..pencilCount - 1] of integer;
    firstPencilIndex, secondPencilIndex, i: integer;
    eventNumber: integer;
    m: array [0..eventCount - 1] of integer;
    relativeFreq: array [0..eventCount - 1] of real;
begin 
    box[0] := 0; 
    box[1] := 0; 
    box[2] := 0; 
    box[3] := 1; 
    box[4] := 1;
    
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
        relativeFreq[i] := m[i] / n;
    
    writeln(relativeFreq);
end.