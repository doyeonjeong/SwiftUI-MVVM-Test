//
//  Person.swift
//  SwiftUI-MVVM-Test
//
//  Created by Doyeon on 2023/03/22.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var phone: String
}
