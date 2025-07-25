//
//  ContentView.swift
//  SwiftData
//
//  Created by Tiger on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Joan", bday: .now),
        Friend(name: "Sienna", bday: .now)
    ]
    @State private var newName = ""
    @State private var newBDay: Date = .now
    
    var body: some View {
        List(friends, id: \.name) { friend in
            HStack {
                Text(friend.name)
                Spacer()
                Text(friend.bday, format: .dateTime.month(.wide).day().year())
            }
        }
        .navigationTitle(Text("Birthdays"))
        .safeAreaInset(edge: .bottom){
            VStack(alignment: .center, spacing: 20){
                Text("New Birthday")
                    .font(.headline)
                DatePicker(selection: $newBDay, in: Date.distantPast...Date.now, displayedComponents:.date){
                    TextField("Name", text: $newName).textFieldStyle(.roundedBorder)
                }
                
                Button("Save"){
                    let newFriend = Friend(name: newName, bday: newBDay)
                    friends.append(newFriend)
                    newName = ""
                    newBDay = .now
                }
                .bold()
            }
            .padding()
            .background(.bar)
        }
    }
}

#Preview {
    ContentView()
}
