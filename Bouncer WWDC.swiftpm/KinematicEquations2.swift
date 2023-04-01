import SwiftUI
import AVKit

struct KinematicEquations2: View {
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                G4().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Text("Stage 4: Motion of the ball as it leaves the granite slab. (interactive)").padding(.horizontal,40).padding(.top, 10).font(.caption)
                VStack(alignment: .leading) {
                    Text("""
As the ball leaves the surface, the velocity = 3.34 m/s, g = 9.81 meters per second squared and the final velocity will be 0. The following kinematic equation can be used and rearranged to find the time value for half of the projectile motion. 
""")
                  
                    Image("kinematicequations2eqn1").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:120)
                    
                    
                    Text("""
As the projectile motion will be symmetric parabola, double the time of the first half of the parabola to get the time period for the full motion.
""")
                    Image("kinematicsequations2eqn2").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:40)
                    

                    Text("""
Multiply this time by the constant horizontal velocity to find the distance d3.
""")
                    Image("kinematicsequations2eqn3").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:40)
                    Text("""
In order to find the total distance from the end of the tube to the ball landing we add the two distances together:
""")
                    Image("kinematicsequations2eqn4").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:20)
                    
                    Group {
                        
                        DisclosureGroup("Parametric Representation") {
                            Text("""
Parametric equations were used to make the 3D models displayed in this activity.

The parametric representation of this motion assuming constant horizontal velocity is
""")
                            Image("kinematicequations2parametric").resizable()
                                .aspectRatio(contentMode: .fit).frame(maxHeight:90)
                        }
                        
                        DisclosureGroup("Assumptions") {
                            Text("""
We are assuming the following conditions when performing this calculation
""")
                            Image("assumptionskinematicsequations").resizable()
                                .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                        }
                        
                        KinematicsEquations2QuestionView()
                    }
                    
                }.padding(.horizontal, 40).padding(.vertical, 10)
                //                HStack() {
                //                    Spacer()
                //                    NavigationLink(destination: ExperimentalSetup()) {
                //                        Label("Next", systemImage: "chevron.right")
                //                            .font(.headline)
                //                            .foregroundColor(.blue)
                //                    }
                //                    .padding().padding(.horizontal, 20)
                //                }
                Spacer()
            }.navigationTitle(Text("Kinematic Equations 2"))
            
        }
    }
}
