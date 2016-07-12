# FH-Survival

## Datenmodell

### Netzwerkcode


### Helfer-Code

## ViewController


## Views

### Anpassen des Erscheinungsbildes

### TableViewCells

Für die App gibt es drei verschiedene Typen von UITableView Subklassen: `HeadlineTableViewCell`, `ImageTableViewCell` und `ContentTableViewCell`. Die einzelnen *TableViewCells* sind zusätzlich über Interface-Builder-Dateien definiert, in welchen das Layout der beinhalteten GUI-Elemente festgelegt ist. Das Aussehen der einzelnen Cells wird allerdings in den Klassen definiert, durch Überschreiben der Protokollmethode `updateStyles()`. Da jede *TableViewCell* ein *UIView* ist, implementiert auch jede der Unterklassen das Protokoll `Styled`.

#### `HeadlineTableViewCell`

Wird in den Listenansichten verwendet um Einträge mit oder ohne Überschrift darzustellen.


## Extensions

In der App werden eine Reihe von Extensions auf diverse Klassen und Strukturen verwendet, um Funktionaltät vereinfacht bereitzustellen.

### `Int`

In der Int-Extension sind simple Klassenmethoden definiert um Zufallszahlen zu generieren. Zum einen die Methode `Int.random()`, welche eine zufällige Zahl im Integer-Definitionsbereich zurück gibt. Zum anderen die Methode `Int.random(range: Range<Int>)`, welche eine zufällige Zahl aus einem gegebenen Intervall mit *Int* als Grenzen zurück gibt. Die Auswahl der Zufallszahl basiert auf der `arc4random`- bzw. `arc4random_uniform`-Funktion.

