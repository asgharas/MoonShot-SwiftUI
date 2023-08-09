//
//  MIssionsListView.swift
//  MoonShot
//
//  Created by Asghar on 8/10/23.
//

import SwiftUI

struct MissionsListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                            
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(mission.displayName)
                                    .font(.title3.bold())
                                    .foregroundColor(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.footnote)
                                    .foregroundColor(.white.opacity(0.6))
                                Spacer()
                                }
                            .frame(maxWidth: .infinity)
                            
                            Text(mission.crewMemberNames)
                            .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                    }
//                    .background(.lightBackground)
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

struct MIssionsListView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    static var previews: some View {
        ScrollView{
            MissionsListView(missions: missions, astronauts: astronauts)
                .preferredColorScheme(.dark)
        }
    }
}
