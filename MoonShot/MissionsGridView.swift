//
//  MissionsGridView.swift
//  MoonShot
//
//  Created by Asghar on 8/10/23.
//

import SwiftUI

struct MissionsGridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                            
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    }
                }
            }
        }
        .padding([.horizontal, .vertical])
    }
}

struct MissionsGridView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
