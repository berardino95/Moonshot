//
//  MissionView.swift
//  Moonshot


//Every mission has 3 members, we have the member info in another JSON, we need to match the member crew with the information. We can create a inline struct in this file.

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role : String //es Command Pilot
        let astronaut : Astronauts //has id, name, description
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                        Text(mission.description)
                    }
                    .padding()
                }
                .padding(.bottom)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 30){
                        ForEach(crew, id: \.astronaut.name) { crew in
                            VStack(spacing: 5){
                                Text(crew.astronaut.name)
                                    .fontWeight(.bold)
                                Text(crew.role)
                            }
                        }
                    }
                    .padding()
                }
                .padding(.bottom)

            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronauts]) {
        self.mission = mission
        
        self.crew = mission.crew.map{ member in //Mission.crew : [CrewRole] that as name and id
            //checking if astronauts has a member.name
            if let astronaut = astronauts[member.name] {
                //create a new CrewMember
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                //if there isn't a matching astronauts we have some problem
                fatalError("Missing \(member.name)")
            }
            
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    
    //create a variable retrieving data and use it in the preview provider
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static let astronauts : [String : Astronauts] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[5], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
