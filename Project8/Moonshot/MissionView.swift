//
//  MissionView.swift
//  Moonshot
//
//  Created by Peyton Gasink on 9/5/22.
//

import SwiftUI

struct MissionView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: Mission
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        RectangleDividerView()
                        
                        Text("Mission Hightlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text("Launch Date: \(mission.formattedLaunchDate)")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        RectangleDividerView()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    AstronautListView(mission: mission, astronauts: astronauts)
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    
    init(mission: Mission) {
        self.mission = mission
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
