import SwiftUI
import AVKit

struct Conclusion: View {
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                Image("actualexperimentball").resizable()
                    .aspectRatio(contentMode: .fit).frame(maxHeight:400)
                Text("Actual path of ball undergoing motion.").padding(.horizontal,40).padding(.top, 10).font(.caption)
                
                Image("threeshotsar").resizable()
                    .aspectRatio(contentMode: .fit).frame(maxHeight:400)
                Text("""
The model, once calibrated correctly with the origin in the correct place, accurately depicted the motion of the ball showing that the calculations and assumptions behind them were in fact correct.
                    
Overall, the results from the initial calculations were accurate and the result of the experiment is shown below with the predicted distance of 2.61m being in the middle.
""").padding(.horizontal,40).padding(.top, 10)
                Image("resultsheet").resizable()
                    .aspectRatio(contentMode: .fit).frame(maxHeight:400)
                
                VStack(alignment: .leading) {
                    Text("""
There are some factors that could cause the results to be less than expected. Examples include air resistance, uncertainties in the measurement of parameters, friction and more but these are almost negligible and quite advanced.

Congratulations! I hope you found this activity interesting.
""")
                    Image("freddieopenhouse") .resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:400)
                    Text("Freddie Nicholson (the author) showing the SceneKit model at university open day.").padding(.horizontal,40).padding(.top, 10).font(.caption)
                    
                    
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
            }.navigationTitle(Text("Conclusion"))
            
        }
    }
}
