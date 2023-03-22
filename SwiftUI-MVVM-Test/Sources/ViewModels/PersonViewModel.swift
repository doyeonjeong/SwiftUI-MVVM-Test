//
//  PersonViewModel.swift
//  SwiftUI-MVVM-Test
//
//  Created by Doyeon on 2023/03/22.
//

import SwiftUI

class PersonViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    init() {
        addPerson()
    }
    
    func addPerson() {
        people = peopleData
    }
    
    func shuffleOrder() {
        people.shuffle()
    }
    
    func reverseOrder() {
        people.reverse()
    }
    
    func removeLasePerson() {
        people.removeLast()
    }
    
    func removeFirstPerson() {
        people.removeFirst()
    }
}

let peopleData = [
    Person(name: "팜 하니", email: "hani@mail.com", phone: "010-1234-1234"),
    Person(name: "킴 민지", email: "kim@mail.com", phone: "010-1234-1234"),
    Person(name: "해린", email: "kang@mail.com", phone: "010-1234-1234"),
    Person(name: "혜인", email: "hyein@mail.com", phone: "010-1234-1234"),
    Person(name: "다니엘", email: "daniel@mail.com", phone: "010-1234-1234")
]
