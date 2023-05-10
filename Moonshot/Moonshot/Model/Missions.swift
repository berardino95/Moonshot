//
//  Missions.swift
//  Moonshot
//
//  Created by CHIARELLO Berardino - ADECCO on 08/05/23.
//

import Foundation



struct Mission: Codable, Identifiable {
    //Nested struct, put this struct inside Mission because this struct is used only to decode Json, this can help to keep the code cleaner
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate : Date?
    let crew: [CrewRole]
    let description: String
    
    //Generate a string with the name of the mission interpolating string "Apollo" + id of the mission
    var displayName : String {
        "Apollo \(id)"
    }
    
    //generate a string that match the image name in the assets for every image. es image name apollo1, mission id is 1, "apollo\(id) for mission 1 is apollo1"
    var image : String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var longFormattedLaunchDate: String {
        launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
}
