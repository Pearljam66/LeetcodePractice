//
//  TreeNode.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/8/24.
//

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []

    public init(value: T) {
        self.value = value
    }

    // Adds a child node to a node.
    public func add(_ child: TreeNode) {
        children.append(child)
    }

}

extension TreeNode {
    // Uses recursion to process the next node.
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {

        // Visit the current node by invoking the closure 'visit' on it
        visit(self)

        // Recursively visit each child node of the current node.
        children.forEach {

            // For each child node, call the 'forEachDepthFirst' method again, passing along the same closure 'visit'.
            // Continue the process recursively until all nodes in the tree have been visited.
            ($0.forEachDepthFirst(visit: visit))
        }
    }
}

extension TreeNode {
    // Visits each of the nodes in level-order.
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        // Visits the root node and invokes the closure 'visit' on it.
        visit(self)

        // Initialize a queue to store the nodes that need to be visited in the next level.
        var queue = QueueTwo<TreeNode>()

        // Iterate over the children of the current node and enqueue them into a queue.
        children.forEach { queue.enqueue($0) }

        // Enter a loop then dequeues a node from the queue
        while let node = queue.dequeue() {
            // For each dequeued node, visit the node by invoking the closure 'visit' on it.
            visit(node)

            // Iterate over the children of the dequeued node and then enqueue them into the queue.
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

// Searches for a node with a specific value within the tree.
extension TreeNode where T: Equatable {

    // Takes a value of type T as input, representing the value to search for in a tree.
    public func search(_ value: T) -> TreeNode? {

        var result: TreeNode?

        // Invoke the 'forEachLevelOrder' method on the current node, which traverses the tree in level order (breath-first).
        forEachLevelOrder { node in
            // Within the closure passed to 'forEachLevelOrder', it checks if the value of the current node (node.value)
            // if equal to the value being searched for ('value').
            if node.value == value {

                // If a node with the desired value is found, it assigns the current node('node') to the 'result' variable.
                result = node
            }
        }

        // After traversing the entire tree, it returns the 'result', which will be nil if no node with specified value was
        // found, or the node itself if it was found.
        return result
    }
}
