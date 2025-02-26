@startuml
entity "Racks" as R {
    +Rack_ID : INT <<PK>>
    --
    Name : STRING
}

entity "Stations" as S {
    +Station_ID : INT <<PK>>
    --
    Rack_ID : INT <<FK>>
    Name : STRING
}

entity "Aktuelle_Daten" as AD {
    +Run_ID : INT <<PK>>
    --
    Station_ID : INT <<FK>>
    Timestamp : TIMESTAMP
}

entity "Messwerte" as MW {
    +Wert_ID : INT <<PK>>
    --
    Run_ID : INT <<FK>>
    Zeit_Sekunden : INT
    Temperatur_Intern : FLOAT
    Temperatur_Extern : FLOAT
}

entity "Historische_Daten" as HD {
    +Historical_ID : INT <<PK>>
    --
    Station_ID : INT <<FK>>
    Timestamp : TIMESTAMP
    Temperatur_Min : FLOAT
    Temperatur_Max : FLOAT
    DeltaT_Min : FLOAT
    DeltaT_Max : FLOAT
}

' Beziehungen zwischen den Tabellen
R --|> S : "1 enthält N"
S --|> AD : "1 hat N"
AD --|> MW : "1 enthält N"
S --|> HD : "1 besitzt N"

@enduml
