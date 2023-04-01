import SwiftUI
import AVKit

struct KinematicEquations1: View {
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                G2().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Text("Stage 2: Projectile motion of the ball as it leaves the tube. (interactive)").padding(.horizontal,40).padding(.top, 10).font(.caption)
                VStack(alignment: .leading) {
                    Text("""
In this section, we are investigating the motion of a ball as it leaves the tube. We are interested in finding the final vertical velocity of the ball as it reaches the floor. To do this, we use kinematic equations to describe the ball's motion in terms of its position, velocity, acceleration, and time. By using the vertical displacement of the ball, its initial velocity, and the acceleration due to gravity, we can derive a formula to solve for the final vertical velocity of the ball. This formula allows us to determine the speed at which the ball hits the floor after leaving the tube. Kinematic equations describe the motion of objects by relating their displacement, velocity, acceleration, and time. They are used in physics and engineering to analyze and predict object motion.
""")
                    Text("""

First, we find the time for the motion using gravitational field strength:
""")
                    Image("kinematicequations1eqn1").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:30)
                    
                    DisclosureGroup("The steps following this are a step above what we have time for today but you can view them here.") {
                        Image("kinematicsequations1eqn2").resizable()
                            .aspectRatio(contentMode: .fit).frame(maxHeight:140)
                    }
                    Text("""

t (b) = 0.28s

The velocity just before the ball hits the granite slab can be found using the following kinematic equation and the time we just calculated:
""")
                    Image("kinematicsequations1eqn3").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:120)
 
                    
                    Group {
           
                        DisclosureGroup("Parametric Representation") {
                            Text("""
Parametric equations were used to make the 3D models displayed in this activity.

The parametric representation of this motion assuming constant horizontal velocity is
""")
                            Image("kinematicequationsparametric").resizable()
                                .aspectRatio(contentMode: .fit).frame(maxHeight:90)
                        }
                        
                        DisclosureGroup("Assumptions") {
                            Text("""
We are assuming the following conditions when performing this calculation
""")
                            Image("assumptionskinematicsequations").resizable()
                                .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                        }
                        
                        KinematicsEquations1QuestionView()
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
            }.navigationTitle(Text("Kinematic Equations 1"))
            
        }
    }
}
