import SwiftUI
import AVKit

struct ARViewEntry: View {
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                Text("""
You can view the experiment to scale, using the exact calculations shown in this activity. There are also sliders that allow you to see how  the parameters affect the result

For optimal results, the model will directly spawn 3 meters in front of you upon tapping ‘Enter AR Model’. Your camera height should be the same as the entrance to the tube and pointing directly at it. You must be perpendicular to the experiment (if you have it setup). Your starting position will be shown by the red ‘origin’ dot.

This same model was used in the video seen in the 'Introduction' section.
""").padding(.horizontal,40).padding(.top, 10)
                Image("arviewentry").resizable()
                    .aspectRatio(contentMode: .fit).frame(maxHeight:400)
                
                
//                                HStack() {
//                                    
//                                    NavigationLink(destination: ARView()) {
//                                        Label("Enter AR Model", systemImage: "chevron.right")
//                                            .font(.headline)
//                                            .foregroundColor(.blue)
//                                    }
//                                    .padding().padding(.horizontal, 20)
//                                }
//                Spacer()
            }.navigationTitle(Text("AR Model"))
            
        }
    }
}
