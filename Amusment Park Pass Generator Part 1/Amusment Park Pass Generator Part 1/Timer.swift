//
//  Timer.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/12/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

class TimerHandling {
    
    static var seconds = 0
    var isTimerOn = false
    
    static let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        print("Timer fired!")
        seconds += 1
        
        if seconds == 5 {
            timer.invalidate()
            seconds = 0
        }
    }

}
