//
//  File.swift
//  Chordz
//
//  Created by Maxim Perehod on 19.10.2021.
//

import Foundation


class Semaphore {
    private var value: Int
    init() {
        value = 1
    }
    func wait() {
        value -= 1
        while value < 0  {}
    }
    func signal() {
        value += 1
    }
}
