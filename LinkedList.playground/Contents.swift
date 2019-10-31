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
    var last: Node<T>? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }
    
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
    
    public var reversedPrint: String {
        var string = ""
        guard var node = last else { return "" }
        while let previous = node.previous {
            string += "\(node.value), "
            node = previous
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
    }
    
    private func node(atIndex index: Int) -> Node<T> {
        if index == 0 {
            return head!
        } else {
            var node = head?.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {break}
            }
            return node!
        }
    }
    
    public func insert(atIndex index: Int, value: T) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let previous = self.node(atIndex: index - 1)
            let next = previous.next
            
            newNode.previous = previous
            newNode.next = next
            
            previous.next = newNode
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
        return remove(node: nodeToRemove)
    }
}

var list = LinkedList<String>()
list.append(value: "a")
list.append(value: "b")
list.append(value: "c")
list.append(value: "d")

list.print
list.insert(atIndex: 2, value: "v")
list.removeAt(1)
list.print
list.reversedPrint


