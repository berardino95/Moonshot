//
//  ListLayout.swift
//  Moonshot
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import SwiftUI

struct ListLayout: View {
    
    let astronauts : [String : Astronaut]
    let missions : [Mission]
    
    var body: some View {
        List(missions){ mission in
                NavigationLink{
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack{
                        Image(mission.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFit()
                        
                        VStack(alignment: .leading){
                            Text(mission.displayName)
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
                .listRowBackground(Color.darkBackground)
        }
        .scrollContentBackground(.hidden)
        .listStyle(.inset)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
            .preferredColorScheme(.dark)
    }
}
