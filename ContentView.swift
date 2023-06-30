//
//  ContentView.swift
//  ToDoApp
//
//  Created by 橋本龍 on 2023/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData : UserData
    @State var showView = false
     
    var body: some View {
        NavigationView{
            List{
                ForEach(userData.tasks) { task in
                    Button(action: {
                        guard let index = self.userData.tasks.firstIndex(of: task) else{
                            return
                        }
                        
                        self.userData.tasks[index].checked.toggle()
                    })
                    {
                        ListRow(task: task.title, isCheck: task.checked)
                    }
                }
                
                if self.userData.isEditing{
                    Draft()
                }else{
                    Button(action:{
                        self.userData.isEditing = true
                    }){
                        Text("+")
                            .font(.title)
                    }
                }
                Button(action: {
                    showView = true
                }){
                    Text("ステータス")
                }
                .sheet(isPresented: $showView, content:{ AnotherView(showView: $showView)
                })
                
            }
            .navigationBarTitle(Text("タスク"))
            .navigationBarItems(trailing: Button(action: {DeleteTask()
            })
            {
                Text("Delete")
                
            })
        }
    }
    
    func DeleteTask() {
        let nesessaryTask = self.userData.tasks.filter({!$0.checked})
        self.userData.tasks = nesessaryTask
    }
}

struct AnotherView: View{
    @Binding var showView: Bool
    var body: some View{
        Button(action:{
            showView = false
        }){
            Text("戻る")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
