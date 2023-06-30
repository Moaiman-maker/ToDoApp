//
//  UserTask.swift
//  ToDoApp
//
//  Created by 橋本龍 on 2023/05/22.
//

import SwiftUI

struct Task: Identifiable, Equatable{
    let id = UUID()
    var title: String
    var checked: Bool
    
    init(title: String, checked: Bool) {
        self.title = title
        self.checked = checked
    }
}
