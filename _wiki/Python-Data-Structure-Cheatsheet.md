---
layout: wiki 
title: Python Data Structure Cheatsheet
last-modified: 2019/11/24
---

<!-- TOC -->

- [자료 구조](#자료-구조)
    - [Hot Potato](#hot-potato)
    - [Queue with Min Support](#queue-with-min-support)
    - [LRU Cache](#lru-cache)
- [Recursion](#recursion)
    - [Integer to Any Base](#integer-to-any-base)
    - [Tower of Hanoi](#tower-of-hanoi)
    - [Fibonacci](#fibonacci)
- [Search](#search)
    - [Binary Search](#binary-search)
    - [Hashing](#hashing)
- [Sort](#sort)
    - [Merge Sort](#merge-sort)
    - [Quick Sort](#quick-sort)
- [Tree](#tree)
    - [Binary Tree Traversals](#binary-tree-traversals)
    - [Priority Queue with Binary Heap](#priority-queue-with-binary-heap)
    - [Heap Sort](#heap-sort)
- [Graph](#graph)
    - [Depth First Search](#depth-first-search)
    - [Dijkstra’s Algorithm](#dijkstras-algorithm)

<!-- /TOC -->
---
[Practical Algorithms and Data Structures](https://bradfieldcs.com/algos/)

# 자료 구조
## Hot Potato
```python
def hot_potato(names, num):
    queue = []
    # reverse
    for name in names:
        queue.insert(0, name)

    while len(queue) > 1:
        for _ in range(num):
            queue.insert(0, queue.pop())

        queue.pop()

    return queue.pop()

hot_potato(('Bill', 'David', 'Susan', 'Jane', 'Kent', 'Brad'), 9)
# => 'David'
```

## Queue with Min Support
```python
class Node(object):
    def __init__(self, item=None):
        self.item = item
        self.next = None
        self.previous = None


class Queue(object):
    def __init__(self):
        self.length = 0
        self.head = None
        self.tail = None

    def enqueue(self, x):
        newNode = Node(x)
        newNode.next = None
        if not self.head:
            self.head = newNode
            self.tail = newNode
        else:
            self.tail.next = newNode
            newNode.previous = self.tail
            self.tail = newNode
        self.length += 1

    def dequeue(self):
        if self.length == 0:
            return -1

        item = self.head.item
        self.head = self.head.next
        self.length = self.length - 1
        if self.length == 0:
            self.tail = None
        return item

    def min(self):
        node = self.head
        min = node.item

        while 1:
            if node.item < min:
                min = node.item

            if not node.next:
                break
            else:
                node = node.next

        return min


# Time complexity of `enqueue()` and `dequeue()` is O(1)
# Time complexity of `min()` is O(n)
q = Queue()
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
q.enqueue(5)
print(q.min())
print(q.dequeue())
print(q.min())
```

## LRU Cache
```python
# Doubly Linked Lists
class Node(object):
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.next = None
        self.prev = None


class LRUCache(object):
    def __init__(self, capacity):
        self.capacity = capacity
        self.cache = {}
        self.head = None
        self.tail = None

    # Adds a node to the front of the DLL
    def addNode(self, node):
        if self.head is None:
            self.head = node
        else:
            node.next = self.head
            self.head.prev = node
            self.head = node
        if self.tail is None:
            self.tail = node

    # Removes a node from the DLL
    def removeNode(self, node):
        if node.next is not None:
            node.next.prev = node.prev
        if node.prev is not None:
            node.prev.next = node.next
        if self.head == node:
            self.head = node.next
        if self.tail == node:
            self.tail = node.prev
        # Gotcha: Need to remove the pointers on the node itself in case you add it back in
        node.next = None
        node.prev = None

    def evict(self):
        """
        Remove the oldest element.
        """
        del self.cache[self.tail.key]
        self.removeNode(self.tail)

    def remove(self, key):
        if key in self.cache:
            node = self.cache[key]

            del self.cache[node.key]
            self.removeNode(node)
            return node.value
        else:
            return -1

    def get(self, key):
        if key in self.cache:
            node = self.cache[key]
            # Move node to front of DLL
            self.removeNode(node)
            self.addNode(node)
            return node.value
        else:
            return -1

    def add(self, key, value):
        if key in self.cache:
            # Key is already in cache, just need to update it's value and move the node to the front of the DLL
            node = self.cache[key]
            node.value = value
            self.removeNode(node)
            self.addNode(node)

        else:
            # We're adding a new key to the cache
            if self.capacity > 0:
                self.capacity -= 1
            else:
                # Delete tail of DLL
                del self.cache[self.tail.key]
                self.removeNode(self.tail)

            node = Node(key, value)
            self.cache[key] = node
            self.addNode(node)

l = LRUCache(10)
l.add(0, 'A')
l.add(1, 'B')
l.add(2, 'C')
l.get(1)
l.evict()
l.get(1)
l.remove(1)
```

# Recursion
## Integer to Any Base
```python
CHAR_FOR_INT = '0123456789abcdef'

def to_string(n, base):
    if n < base:
        return CHAR_FOR_INT[n]

    return to_string(n // base, base) + CHAR_FOR_INT[n % base]

to_string(1453, 16)  # => 5Ad
```

## Tower of Hanoi
```python
def move_tower(height, from_pole, to_pole, with_pole):
    if height >= 1:
        move_tower(height - 1, from_pole, with_pole, to_pole)
        move_disk(from_pole, to_pole)
        move_tower(height - 1, with_pole, to_pole, from_pole)


def move_disk(from_pole, to_pole):
    print('moving disk from {} to {}'.format(from_pole, to_pole))

move_tower(3, 'A', 'B', 'C')
```

## Fibonacci
w/ Dynamic Programming
```python
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946...
fibomemo = {0: 0, 1: 1}
def fibonacci(n):
    if not n in fibomemo:
        fibomemo[n] = fibonacci(n - 1) + fibonacci(n - 2)
    return fibomemo[n]

def fibolist(n):
    fibonacci(n - 1)
    return list(fibomemo.values())
```

# Search
## Binary Search
```python
def binary_search(alist, item):
    if not alist:
        return False

    midpoint = len(alist) // 2
    if alist[midpoint] == item:
        return True

    if item < alist[midpoint]:
        return binary_search(alist[:midpoint], item)

    return binary_search(alist[midpoint + 1:], item)

testlist = [0, 1, 2, 8, 13, 17, 19, 32, 42]
binary_search(testlist, 3)  # => False
binary_search(testlist, 13)  # => True
```

## Hashing
```python
def hash(astring, tablesize):
    the_sum = sum(ord(char) for char in astring)
    return the_sum % tablesize

hash('cat', 11)
```

Variants:
![](https://bradfieldcs.com/algos/searching/hashing/figures/string-hash-2.png)
Hashing a String Using Ordinal Values with Weighting

# Sort
## Merge Sort
```python
def mergesort(alist):
    print("Splitting ", alist)
    if len(alist) > 1:
        mid = len(alist) // 2
        lefthalf = alist[:mid]
        righthalf = alist[mid:]

        mergesort(lefthalf)
        mergesort(righthalf)

        i = 0
        j = 0
        k = 0
        while i < len(lefthalf) and j < len(righthalf):
            if lefthalf[i] < righthalf[j]:
                alist[k] = lefthalf[i]
                i = i + 1
            else:
                alist[k] = righthalf[j]
                j = j + 1
            k = k + 1

        while i < len(lefthalf):
            alist[k] = lefthalf[i]
            i = i + 1
            k = k + 1

        while j < len(righthalf):
            alist[k] = righthalf[j]
            j = j + 1
            k = k + 1
    print("Merging ", alist)

alist = [54, 26, 93, 17, 77, 31, 44, 55, 20]
mergesort(alist)
```

## Quick Sort
```python
def quicksort(alist):
    quicksort_helper(alist, 0, len(alist) - 1)

def quicksort_helper(alist, first, last):
    if first < last:
        splitpoint = partition(alist, first, last)

        quicksort_helper(alist, first, splitpoint - 1)
        quicksort_helper(alist, splitpoint + 1, last)

def partition(alist, first, last):
    pivotvalue = alist[first]

    leftmark = first + 1
    rightmark = last

    done = False
    while not done:

        while leftmark <= rightmark and alist[leftmark] <= pivotvalue:
            leftmark = leftmark + 1

        while alist[rightmark] >= pivotvalue and rightmark >= leftmark:
            rightmark = rightmark - 1

        if rightmark < leftmark:
            done = True
        else:
            temp = alist[leftmark]
            alist[leftmark] = alist[rightmark]
            alist[rightmark] = temp

    temp = alist[first]
    alist[first] = alist[rightmark]
    alist[rightmark] = temp

    return rightmark

alist = [54, 26, 93, 17, 77, 31, 44, 55, 20]
quicksort(alist)
```

# Tree
## Binary Tree Traversals
```python
class BinaryTree(object):
    def __init__(self, val):
        self.key = val
        self.left = None
        self.right = None

    def preorder(self): # 전위 순회
        print(self.key)
        if self.left:
            self.left.preorder()
        if self.right:
            self.right.preorder()

    def postorder(self): # 후위 순회
        if self.key:
            if self.left:
                self.left.postorder()
            if self.right:
                self.right.postorder()
            print(self.key)

    def inorder(self): # 중위 순회
        if self.key:
            if self.left:
                self.left.inorder()
            print(self.key)
            if self.right:
                self.right.inorder()

r = BinaryTree(1)
r.left = BinaryTree(2)
r.right = BinaryTree(3)
r.left.left = BinaryTree(4)
r.left.right = BinaryTree(5)
```

## Priority Queue with Binary Heap
![](https://bradfieldcs.com/algos/trees/priority-queues-with-binary-heaps/figures/heap-order.png)
```python
# %%
class BinaryHeap(object):
    def __init__(self):
        self.items = [0]

    def __len__(self):
        return len(self.items) - 1

    def percolate_up(self):
        i = len(self)
        while i // 2 > 0:
            if self.items[i] < self.items[i // 2]:
                self.items[i // 2], self.items[i] = self.items[i], self.items[i // 2]
            i = i // 2

    def insert(self, k):
        self.items.append(k)
        self.percolate_up()

    def percolate_down(self, i):
        while i * 2 <= len(self):
            mc = self.min_child(i)
            if self.items[i] > self.items[mc]:
                self.items[i], self.items[mc] = self.items[mc], self.items[i]
            i = mc

    def min_child(self, i):
        if i * 2 + 1 > len(self):
            return i * 2

        if self.items[i * 2] < self.items[i * 2 + 1]:
            return i * 2

        return i * 2 + 1

    def delete_min(self):
        return_value = self.items[1]
        self.items[1] = self.items[len(self)]
        self.items.pop()
        self.percolate_down(1)
        return return_value

    def find_min(self):
        return self.items[1]

    def build_heap(self, alist):
        i = len(alist) // 2
        self.items = [0] + alist
        while i > 0:
            self.percolate_down(i)
            i = i - 1


# %%
b = BinaryHeap()
b.insert(9)
b.insert(6)
b.insert(5)
b.insert(2)
b.insert(3)
b.find_min()
b.delete_min()
b.find_min()
```

## Heap Sort
Heap queue algorithm
```python
import heapq

def heapsort(iterable):
    h = []
    for value in iterable:
        heapq.heappush(h, value)
    return [heapq.heappop(h) for i in range(len(h))]

heapsort([1, 3, 5, 7, 9, 2, 4, 6, 8, 0])

h = []
heapq.heappush(h, (5, 'write code'))
heapq.heappush(h, (7, 'release product'))
heapq.heappush(h, (1, 'write spec'))
heapq.heappush(h, (3, 'create tests'))
print(heapq.heappop(h))
```

# Graph
## Depth First Search
![](https://bradfieldcs.com/algos/graphs/depth-first-search/figures/depth-first-search-l.png)
```python
from collections import defaultdict

simple_graph = {
    'A': ['B', 'D'],
    'B': ['C', 'D'],
    'C': [],
    'D': ['E'],
    'E': ['B', 'F'],
    'F': ['C']
}

counter = 0
def depth_first_search(graph, starting_vertex):
    visited = set()
    traversal_times = defaultdict(dict)

    def traverse(vertex):
        global counter
        counter += 1
        visited.add(vertex)
        traversal_times[vertex]['discovery'] = counter

        for next_vertex in graph[vertex]:
            if next_vertex not in visited:
                traverse(next_vertex)

        counter += 1
        traversal_times[vertex]['finish'] = counter

    traverse(starting_vertex)
    return traversal_times


traversal_times = depth_first_search(simple_graph, 'A')
# =>
# pprint.pprint(traversal_times)
# defaultdict(<class 'dict'>,
#             {'A': {'discovery': 1, 'finish': 12},
#              'B': {'discovery': 2, 'finish': 11},
#              'C': {'discovery': 3, 'finish': 4},
#              'D': {'discovery': 5, 'finish': 10},
#              'E': {'discovery': 6, 'finish': 9},
#              'F': {'discovery': 7, 'finish': 8}})
```

![](https://bradfieldcs.com/algos/graphs/topological-sorting/figures/pancakes-depth-first-search.png)
Result of Depth First Search on the Pancake Graph

![](https://bradfieldcs.com/algos/graphs/topological-sorting/figures/pancakes-topological-sort.png)
Result of Topological Sort on Directed Acyclic Graph

## Dijkstra’s Algorithm
```python
import heapq


def calculate_distances(graph, starting_vertex):
    distances = {vertex: float('infinity') for vertex in graph}
    distances[starting_vertex] = 0

    entry_lookup = {}
    pq = []

    for vertex, distance in distances.items():
        entry = [distance, vertex]
        entry_lookup[vertex] = entry
        heapq.heappush(pq, entry)

    while len(pq) > 0:
        current_distance, current_vertex = heapq.heappop(pq)

        for neighbor, neighbor_distance in graph[current_vertex].items():
            distance = distances[current_vertex] + neighbor_distance
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                entry_lookup[neighbor][0] = distance

    return distances


example_graph = {
    'U': {'V': 2, 'W': 5, 'X': 1},
    'V': {'U': 2, 'X': 2, 'W': 3},
    'W': {'V': 3, 'U': 5, 'X': 3, 'Y': 1, 'Z': 5},
    'X': {'U': 1, 'V': 2, 'W': 3, 'Y': 1},
    'Y': {'X': 1, 'W': 1, 'Z': 1},
    'Z': {'W': 5, 'Y': 1},
}
import pprint
pprint.pprint(calculate_distances(example_graph, 'X'))
# => {'U': 1, 'W': 2, 'V': 2, 'Y': 1, 'X': 0, 'Z': 2}
```
