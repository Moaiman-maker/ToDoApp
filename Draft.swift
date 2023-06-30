//
//  Draft.swift
//  ToDoApp
//
//  Created by 橋本龍 on 2023/05/22.
//

import SwiftUI

struct Draft: View {
    @State var taskTitle = ""
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        TextField("タスクを入力してください", text: $taskTitle)
        .onSubmit {
            self.createTask()
            self.userData.isEditing = false
        }
    }
    func createTask(){
        let newtask = Task(title: self.taskTitle, checked: false)
        self.userData.tasks.insert(newtask, at: 0)
        self.taskTitle = ""
    }
}



struct Draft_Previews: PreviewProvider {
    static var previews: some View {
        Draft()
    }
}
