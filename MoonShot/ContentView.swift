//
//  ContentView.swift
//  MoonShot
//
//  Created by Asghar on 8/4/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] =  Bundle.main.decode("missions.json")
    
    @State var showList = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    if showList {
                        MissionsListView(missions: missions, astronauts: astronauts)
                            .transition(.push(from: .leading))
                    } else {
                        MissionsGridView(missions: missions, astronauts: astronauts)
                            .transition(.push(from: .trailing))
                    }
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    withAnimation() {
                        showList.toggle()
                    }
                    
                } label: {
                    HStack {
                        Text(showList ? "Grid" : "List")
                        Image(systemName: showList ? "square.grid.2x2" : "list.dash")
                    }
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
