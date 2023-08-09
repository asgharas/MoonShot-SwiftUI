//
//  Mission.swift
//  MoonShot
//
//  Created by Asghar on 8/9/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Appolo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var crewMemberNames: String {
        var crewMembersString = ""
        for i in 0..<crew.count {
            crewMembersString += crew[i].name
            
            if i != crew.count - 1 {
                crewMembersString += ", "
            }
        }
        return crewMembersString
    }
}
