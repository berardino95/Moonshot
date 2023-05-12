//
//  GridLayout.swift
//  Moonshot
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import SwiftUI

struct GridLayout: View {
    
    let astronauts : [String : Astronaut]
    let missions : [Mission]
    
    //only one column adaptive, it must have minimum 150 point width but can extend whenever it wants
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView{
            LazyVGrid (columns: columns) {
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
                            
                            VStack(spacing: 5){
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
                .padding(5)
            }
            .padding()
        }
    }
}

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayout(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
            .preferredColorScheme(.dark)
    }
}
