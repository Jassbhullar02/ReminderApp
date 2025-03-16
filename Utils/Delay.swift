//
//  Delay.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 09/03/25.
//

import Foundation

class Delay {
    
    // MARK: - Variables
    private var seconds: Double
    var workItem: DispatchWorkItem?
    
    init(seconds: Double = 2.0) {
        self.seconds = seconds
    }
    
    // MARK: - Functions
    func performWork(_ work: @escaping () -> Void) {
        
        workItem = DispatchWorkItem(block: {
            work()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: workItem!)
    }
    
    func cancel() {
        workItem?.cancel()
    }
}
