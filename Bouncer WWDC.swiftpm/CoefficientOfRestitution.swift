import SwiftUI
import AVKit

struct CoefficentOfRestitution: View {
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                G3().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Text("Stage 2: Motion of the ball as it hits the granite slab. (interactive)").padding(.horizontal,40).padding(.top, 10).font(.caption)
                VStack(alignment: .leading) {
                    Text("""
The coefficient of restitution is a measure of the "bounciness" of a collision between two objects. It is defined as the ratio of the final velocity to the initial velocity of a colliding object after a collision has occurred. A coefficient of restitution of 1 indicates a perfectly elastic collision, where the objects bounce off each other with no loss of kinetic energy, while a coefficient of 0 indicates a perfectly inelastic collision, where the objects stick together after colliding.

To calculate the new vertical velocity, the coefficient of restitution is multiplied by the vertical velocity just before hitting the granite slab.
""")
                    Image("coefficentofrestituioneqn").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:90)
                    
                    DisclosureGroup("Assumptions") {
                        Text("""
We are assuming the following conditions when performing this calculation
""")
                        Image("coefficentofrestitutionassumption").resizable()
                            .aspectRatio(contentMode: .fit).frame(maxHeight:500)
    
                    }
                        
                    CoefficientOfRestitutionQuestionView()

                    
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
            }.navigationTitle(Text("Coefficent of Restitution"))
            
        }
    }
}
