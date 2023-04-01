import SwiftUI
import AVKit

struct ExperimentalSetup: View {

    
    var body: some View {

        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Image("experimentsetupirl").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                    
                    Text("A photo of the experimental setup in real life").padding(.horizontal,40).padding(.top, 10).font(.caption)
                    VStack(alignment: .leading) {
                        //                    Text("Welcome").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom)
                        Text("""
In this experiment, a ball is placed in a tube and its motion is predicted using energy methods, kinematics, and restitution. The material placed at first bounce is granite. The ball will follow a linear velocity at the start whilst travelling in the tube and proceed to undergo variable velocity as the ball performs projectile motion due to gravitational field strength acting on the ball. 
""")
                    }
                    Group {
                        Text("""
Objective
""").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical, 10)
                        Text("""
The objective of the project is to predict the distance between the tube and the impact after first bounce along the horizontal axis, distance 2 (d2) + distance 3 (d3) to the highest degree of precision and accuracy.
""")
                        Image("experimentsetupsimple").resizable()
                            .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                        
                        Text("A simplified diagram of the experimental setup.").padding(.horizontal,40).padding(.top, 10).font(.caption)
                        
                        Text("""
Simplification
""").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical, 10)
                        Text("""
To solve mechanics problems, we often simplify them down into more basic diagrams. You can see a simpler diagram of the experiment above. The dropdown below has some detail about what each symbol means in the diagram and the rest of the activity. The colours we will be using throughout represents the different stages of the calculation.

Orange is the linear motion of the ball in the tube. (Stage 1 – Energy Methods)
Green is the projectile motion of the ball as it falls out of the tube. (Stage 2 – Kinematic Equations)
Blue is the projectile motion of the ball after it has bounced off the granite slab. (Stage 3 – Coefficient of Restitution and Kinematic Equations)

""")
                    } 
                    Group {
                        DisclosureGroup("What do the symbols mean?") {
                            Text("Each symbol is a variable used throughout the activity. Here is a table explaining what each one of them means:")
                            Image("tableexperimentsetup").resizable()
                                .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                        }
                        Text("""
Parameters
""").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical, 10)
                        Text("""
It’s important to note that there are various parameters we have set in advance. These will influence the final calculation. For our experiment, we will be assuming the gravitational field strength is 9.81, the height of the tube above ground is 75cm, the length of the tube is 1.5m, the coefficient of restitution of the granite block on the floor is 0.8279 and the angle of the tube above the horizontal is 25 °. You can see what sorts of things they may change by using the sliders to change the interactive model below. The speed of the ball for the different sections is also calculated. You can also pan and zoom around the model by interacting with it.

""")
                        Group {
                            Params3DBouncer()
                        }
                    }
                        
                    
                    }.padding(.horizontal, 40).padding(.vertical, 10)
                Spacer()
//                HStack() {
//                    Spacer()
//                    NavigationLink(destination: EnergyMethods()) {
//                        Label("Next", systemImage: "chevron.right")
//                            .font(.headline)
//                            .foregroundColor(.blue)
//                    }
//                    .padding().padding(.horizontal, 20)
//                }
            }.navigationTitle(Text("Experiment Setup"))
            
        }
    }

}
