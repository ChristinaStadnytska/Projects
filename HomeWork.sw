class Point {
    var x: Int {
        didSet {
            if x > Room.width || x <= 1 {
                x = oldValue
            }
        }
    }
    
    var y: Int {
        didSet {
            if y > Room.height || y <= 1 {
                y = oldValue
            }
        }
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    enum Side {
        case Top
        case Down
        case Left
        case Right
    }
    
    func moveTo(side: Side, object: Point) {
        print()
        switch side {
        case .Top: object.y -= 1
        case .Down: object.y += 1
        case .Left: object.x -= 1
        case .Right: object.x += 1
        }
    }
}

struct Room {
    static let width = 8
    static let height = 4
    
    class Person: Point {}
    var person: Person
    
    class Box: Point {}
    var box: Box
    
    class End: Point {
        static let x = 7
        static let y = 4
    }
    
    mutating func move(direction: Point.Side) {
        person.moveTo(side: direction, object: person)
        
        if box.x == person.x && box.y == person.y {
            box.moveTo(side: direction, object: box)
        }
        if box.x == End.x && box.y == End.y {
            print("You're winner!🏆")
        }
    }

    func showRoom() {
        for i in 0..<Room.height {
            print()
            for j in 0..<Room.width {
                if i == person.y - 1 && j == person.x - 1 {
                    print("👧🏽", terminator: " ")
                } else if i == box.y - 1 && j == box.x - 1 {
                    print("📦", terminator: " ")
                } else if i == End.y - 1 && j == End.x - 1 {
                    print("⭕️", terminator: " ")
                } else {
                    print("◽️", terminator: " ")
                }
            }
        }
    }
}

var person = Room.Person(x: 2, y: 3)
var box = Room.Box(x: 3, y: 3)
var room = Room(person: person, box: box)

room.showRoom()
room.move(direction: .Top)
room.move(direction: .Right)
room.move(direction: .Down)
room.move(direction: .Left)
room.move(direction: .Down)
room.move(direction: .Right)
room.move(direction: .Right)
room.move(direction: .Right)
room.move(direction: .Right)
room.showRoom()

