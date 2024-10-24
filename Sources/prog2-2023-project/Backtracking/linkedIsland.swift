//
//  File.swift
//  
//
//  Created by Francesco Breglia on 10/05/2023.
//

import Foundation


public class Node{
    
    var island: Island?
    var next: [Node]? = nil
    var prev: Node? = nil
    
    init(island: Island){
        self.island = island
    }
    
    func setNext(next: [Node]){
        self.next = next
    }
    
    func setPrevious(prev: Node){
        self.prev = prev
    }
    
    func getNext() -> [Node]?{
        return self.next
    }
    
    func getPrevious() -> Node?{
        return self.prev
    }
    
    func getIsland() -> Island?{
        return self.island
    }
}

class linkedIsland{
        
    //var head: Node? = nil
    //var tail: Node? = nil
    var current: Node? = nil
    var size: Int = 0
    
    
    func getCurrent() -> Node?{
        return self.current
    }
    
    func setCurrent(current: Node){
        self.current = current
    }
    
}
