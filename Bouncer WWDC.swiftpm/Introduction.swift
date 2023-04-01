import SwiftUI
import AVKit

struct Introduction: View {
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "video",
                                                      withExtension: "m4v")!)
    
    var body: some View {
        ScrollView {
   
        VStack(alignment: .leading) {
        VideoPlayer(player:player).onAppear(perform: {
            player.play()
            
            var i = 0
            Timer.scheduledTimer(withTimeInterval: 117, repeats: true) { timer in
                i += 1
                player.seek(to: CMTime.zero)
                player.play()
                if i == 5 {
                }
            }
        }).frame(height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("A video of the experiment we are going to work through.").padding(.horizontal,40).padding(.top, 10).font(.caption)
            VStack(alignment: .leading) {
                Text("Welcome to my WWDC23 entry").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom)
                Text("""
In this activity, we will be working through some solid mechanics principles to calculate how far a ball bearing will travel out of an experimental setup. 

Solid Mechanics is the discipline in which we investigate the way things move when forces are placed upon them. Solid mechanics uses mathematical models and principles to analyse and predict the behaviour of materials. It helps engineers and scientists design structures and machines that are safe, efficient, and reliable, by ensuring that they can withstand the forces and stresses that they will encounter in use.

The video above is a real execution of the experiment, performed at Imperial College London, that we are going to walk through.

This activity is designed for beginners, generally more advanced content will be hidden by default.
""")
                VStack(alignment: .center) {
                    Image("sidebar").resizable()
                        .aspectRatio(contentMode: .fit).frame(maxHeight:300)
                    Text("Use the sidebar to navigate through the pages in order.").padding(.horizontal,40).padding(.top, 10).font(.caption)
                }
            }.padding(.horizontal, 40).padding(.vertical, 10)
//            HStack() {
//                Spacer()
//                NavigationLink(destination: ExperimentalSetup()) {
//                    Label("Next", systemImage: "chevron.right")
//                        .font(.headline)
//                        .foregroundColor(.blue)
//                }
//                .padding().padding(.horizontal, 20)
//            }
        Spacer()
        }.navigationTitle(Text("Introduction"))
            
        }
    }
}
