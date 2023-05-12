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
    
    //Saving the value in UserDefaults
    @AppStorage("ShowAsList") private var showAsList = false
    
    var body: some View {
        NavigationView{
            VStack{
                if showAsList {
                    ListLayout(astronauts: astronauts, missions: missions)
                        .transition(.asymmetric(insertion: .push(from: Edge.leading), removal: .push(from: Edge.trailing)))
                } else {
                    GridLayout(astronauts: astronauts, missions: missions)
                        .transition(.asymmetric(insertion: .push(from: Edge.trailing), removal: .push(from: Edge.leading)))
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
