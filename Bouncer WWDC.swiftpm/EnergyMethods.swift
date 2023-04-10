import SwiftUI
import AVKit

struct EnergyMethods: View {
   
    
    var body: some View {
        ScrollView {
            
                VStack(alignment: .center) {
                    G1().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Text("Stage 1: Linear motion of the ball in the tube. (interactive)").padding(.horizontal,40).padding(.top, 10).font(.caption)
                VStack(alignment: .leading) {
                    Text("""
In accordance with the law of conservation of energy, the total energy of a closed system before and after any event must be equal. This principle applies to the case of a ball moving in a gravitational field, where the potential energy due to its position is equal to the sum of its translational and rotational kinetic energy, as well as its gravitational potential energy. By substituting the appropriate formulae, the final velocity of the ball can be determined. It is important to note that the total energy of the system, which is the sum of its kinetic and potential energy, remains constant before and after the ball's motion. This fundamental principle in physics underpins many phenomena, from the motion of celestial bodies to the behaviour of subatomic particles. As such, it is a cornerstone of modern science and engineering, with wide-ranging implications.
""")
                    Text("""

The energy balance of the system is as follows:
""")
                    Image("KE equations").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:15)
                    Text("""

We can substitute these known formulae to find the final velocity of the ball using the kinetic energy equation.
""")
                    DisclosureGroup("The steps following this are a step above what we have time for today but you can view them here.") {
                        Image("energymethodsmoredetail").resizable()
                            .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                    }
                    Text("""

The final formula is:
""")
                    Image("finalformulaenergymethods").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:30)
                    Group {
                        Text("""
To find the final speed out of the tube, we put our parameters in from the experimental setup:
""")
                        Image("finalformulaenergymethodsnumbers").resizable().aspectRatio(contentMode: .fit).frame(maxHeight:30)

                        DisclosureGroup("Assumptions") {
                            Text("""
We are assuming the following conditions when performing this calculation
""")
                            Image("assumptionsenergymethods").resizable()
                                .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                        }
                        
                        EnergyMethodsQuestionView()
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
            }.navigationTitle(Text("Energy Balance"))
            
        }
    }
}
