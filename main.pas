program color; 
const
    pencilCount = 5;
    n = 100;
var
    box: array [0..pencilCount - 1] of integer;
    firstPencilIndex, secondPencilIndex, i: integer;
    eventNumber: integer;

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
        writeln(eventNumber);
            
    end;
end.