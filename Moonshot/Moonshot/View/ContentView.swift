//
//  ContentView.swift
//  Moonshot
//
//  Created by CHIARELLO Berardino - ADECCO on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    //only one column adaptive, it must have minimum 150 point width but can extend whenever it wants
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    @State private var showAsList = true
    
    var body: some View {
        NavigationView{
            VStack{
                if showAsList {
                    List{
                        ForEach(missions) { mission in
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
                        }
                    }
                    .transition(.push(from: Edge.leading))
                    .scrollContentBackground(.hidden)
                    .background(.darkBackground)
                } else {
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
                    .transition(.push(from: Edge.leading))
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItemGroup {
                    Button{
                        withAnimation {
                            showAsList.toggle()
                        }
                    } label: {
                        Image(systemName: showAsList ? "square.grid.2x2" : "list.dash")
                            .foregroundColor(.white)
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
