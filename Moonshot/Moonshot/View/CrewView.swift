//
//  CrewView.swift
//  Moonshot
//
//  Created by CHIARELLO Berardino - ADECCO on 10/05/23.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(){
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack{
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(crewMember.role == "Commander" ? .gold : .white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading, spacing: 5){
                                Text(crewMember.astronaut.name)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .accessibilityLabel(crewMember.astronaut.name.replacingOccurrences(of: ".", with: " "))
                                Text(crewMember.role)
                                    .foregroundColor(crewMember.role == "Commander" ? .gold : .white)
                                    .opacity(0.7)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    static let mission : Mission = missions[0]
    
    static var myCrew : [MissionView.CrewMember] = mission.crew.map { member in
        if let astronaut = astronauts[member.name] {
            //create a new CrewMember
            return MissionView.CrewMember(role: member.role, astronaut: astronaut)
        } else {
            //if there isn't a matching astronauts we have some problem
            fatalError("Missing \(member.name)")
        }
    }
    
    static var previews: some View {
        CrewView(crew: myCrew)
            .preferredColorScheme(.dark)
    }
}
