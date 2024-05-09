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
        visit(self)
        children.forEach {
            ($0.forEachDepthFirst(visit: visit))
        }
    }
}

extension TreeNode {
    // Visits each of the nodes in level-order.
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = QueueTwo<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}
