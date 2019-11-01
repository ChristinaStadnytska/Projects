class Node<T> {
    var value: T
    
    init(value: T) {
        self.value = value
    }
    
    var next: Node?
    weak var previous: Node?
}

public class LinkedList<T> {
    var head: Node<T>?
    var last: Node<T>?
    
    public var print: String {
        var string = ""
        guard var node = head else { return "" }
        while let next = node.next {
            string += "\(node.value), "
            node = next
        }
        string += "\(node.value)"
        return string
    }

    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
        last = newNode
    }
    
    private func node(atIndex index: Int) -> Node<T>? {
        var node = head
        var i = index
        while node != nil {
            if i == 0 {
                return node
            } else if index > 0 {
                i -= 1
            } else if index < 0 {
                i += 1
            }
            node = node?.next
        }
        return node
    }

    public func insert(atIndex index: Int, value: T) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let previous = self.node(atIndex: index - 1)
            let next = previous?.next

            newNode.previous = previous
            newNode.next = next

            previous?.next = newNode
            next?.previous = newNode
        }
    }

    private func remove(node: Node<T>) -> T {
        let previous = node.previous
        let next = node.next
        if let previuos = previous {
            previuos.next = next
        } else {
            head = next
        }
        next?.previous = previous

        node.previous = nil
        node.next = nil

        return node.value
    }

     public func removeAt(_ index: Int) -> T {
        let nodeToRemove = node(atIndex: index)
        return remove(node: nodeToRemove!)
    }
    
     func reverse() -> Node<T>? {
        var node = head
        var prev: Node<T>?
        var next: Node<T>?

        while node != nil {
            next = node?.next
            node?.next = prev
            prev = node
            node = next
        }
        return prev
    }
}

var list = LinkedList<String>()
list.append(value: "a")
list.append(value: "b")
list.append(value: "c")
list.append(value: "d")
list.print

list.insert(atIndex: -1, value: "y")
list.print
list.insert(atIndex: -2, value: "p")
list.print
list.insert(atIndex: -1, value: "o")
list.print

list.removeAt(1)
list.print
list.reverse()
list.print

