# FH-Survival

## Datenmodell

Die Daten des FH-Flyers sind in einer JSON-Datei hinterlegt, welche beim Start der App geladen und in die entsprechenden Datenstrukturen umgewandelt wird.

### Datenklassen / -strukturen

Die Daten des FH-Flyers werden durch zwei Strukturen, eine Enumeration und eine Klasse repräsentiert.

**`Information`** stellt eine Information aus dem Flyer dar, bestehend aus Titel, Text, Datum, Location und eventuellen Tags und URLs.

**`URL`** ist simpler Wrapper um `NSURL`, welche allerdings auch den Typ der URL vorhält. Dieser ist entweder `.Web`, `.Mail` oder `.Phone` und wird beim Initialisieren festgestellt.

**`Tag`** ist eine Enumeration zur Kategorisierung der Informationen gedacht, einer `Information` können mehrere Tags zugewiesen werden.

### Netzwerkcode

### Helfer-Code

## ViewController


## Views

### Anpassen des Erscheinungsbildes

#### Farbschemata

- Hauptfarbe
- Sekundärfarbe
- Akzentfarbe
- Text Hell
- Text Mittel
- Text Dunkel
- HintergrundUIColor.blackColor()

### TableViewCells

Für die App gibt es drei verschiedene Typen von UITableView Subklassen: `HeadlineTableViewCell`, `ImageTableViewCell` und `ContentTableViewCell`. Die einzelnen *TableViewCells* sind zusätzlich über Interface-Builder-Dateien definiert, in welchen das Layout der beinhalteten GUI-Elemente festgelegt ist. Das Aussehen der einzelnen Cells wird allerdings in den Klassen definiert, durch Überschreiben der Protokollmethode `updateStyles()`. Da jede *TableViewCell* ein *UIView* ist, implementiert auch jede der Unterklassen das Protokoll `Styled`.

#### `HeadlineTableViewCell`

Wird in den Listenansichten verwendet um Einträge mit oder ohne Überschrift darzustellen.


## Extensions

In der App werden eine Reihe von Extensions auf diverse Klassen und Strukturen verwendet, um Funktionaltät vereinfacht bereitzustellen.

### `Int`

In der `Int`-Extension sind simple Klassenmethoden definiert um Zufallszahlen zu generieren. Zum einen die Methode `Int.random()`, welche eine zufällige Zahl im Integer-Definitionsbereich zurück gibt. Zum anderen die Methode `Int.random(range: Range<Int>)`, welche eine zufällige Zahl aus einem gegebenen Intervall mit *Int* als Grenzen zurück gibt. Die Auswahl der Zufallszahl basiert auf der `arc4random`- bzw. `arc4random_uniform`-Funktion.

### `NSDate`

In der `NSDate`-Extension wird ein zusätzlicher Initializer bereit gestellt, welcher versucht ein NSDate-Objekt aus einem gegebenen String und Format zu erstellen. Wenn das Datum nicht erstellt werden kann, schlägt die `init`-Methode fehl und gibt `nil` zurück.

### `String`

In der `String`-Extension gibt es eine berechnete Variable, welche angibt ob es sich bei dem String um eine Mail-Adresse handelt. Außerdem gibt es eine Methode `containsString`, welche unabhängig von Groß- / Kleinschreibung und diakritischen Zeichen nach einer Übereinstimmung sucht.

### `UIColor`

In der `UIColor`-Extension gibt es einen zusätzlichen Initializer, welcher die Farbe aus einem übergebenen `Int` in Hexadezimalnotation erstellt.

### `UIFont`

In der `UIFont`-Extension gibt es zunächst eine Enumeration, welche die verschiedenen Strings der *text styles* (`UIFontTextStyleTitle1`, `UIFontTextStyleBody`, etc) darstellt. Diese werden für einen weiteren Initializer verwendet, welche mit Hilfe eines `UIFontDescriptor` die Schriftart in dem entsprechendne Style erstellt.

