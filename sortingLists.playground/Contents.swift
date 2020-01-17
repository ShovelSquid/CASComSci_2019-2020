import UIKit


struct Character {
    let name: String
    let klass: String
    let HP: Int
}

var myList: [Character] = [
    Character(name: "Gronathan", klass: "Barbarian", HP: 214),
    Character(name: "Thartarious", klass: "Wizard", HP: 56),
    Character(name: "BananaMan", klass: "Bard", HP: 43),
    Character(name: "Jon", klass: "Fighter", HP: 182),
    Character(name: "Margarnanar", klass: "Cleric", HP: 115)
]

func sortByKlass(a: Character, b: Character) -> Bool {
    if a.klass == b.klass {
        return a.name < b.name
    }
    else {
        return a.klass < b.klass
    }
}

// creates a new list that is sorted
let sortedList = myList.sorted(by: sortByKlass)

// edits the original to make it sorted
myList.sort(by: sortByKlass)

for item in myList {
    print("\(item.name): \(item.klass) with \(item.HP) Health")
}

let anotherSortedList = myList.sorted(by: {
    (a, b) in
    return a.name < b.name
})

for anotherItem in anotherSortedList {
    print("\(anotherItem.name): \(anotherItem.klass) with \(anotherItem.HP) Health")
}

myList.sort(by: {
    (a:Character, b:Character) in
    return a.klass < b.klass
})

for thingy in myList {
    print("\(thingy.name): \(thingy.klass) with \(thingy.HP) Health")
}
