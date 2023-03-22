//
//  MainView.swift
//  SwiftUI-MVVM-Test
//
//  Created by Doyeon on 2023/03/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = PersonViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                ForEach(viewModel.people) { person in
                    HStack {
                        Text(person.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(person.phone)
                            Text(person.email)
                        }
                    }
                    .padding(14)
                }
            }
            Menu("Menu".uppercased()) {
                Button("Reverse") { viewModel.reverseOrder() }
                Button("Shufflle") { viewModel.shuffleOrder() }
                Button("Remove last") { viewModel.removeLastPerson() }
                Button("Remove first") { viewModel.removeFirstPerson() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
