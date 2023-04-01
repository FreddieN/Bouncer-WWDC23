import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("Introduction")) {
                    
                    NavigationLink(destination: Introduction()) {
                        Label("Introduction", systemImage: "info.square")
                    }
                    NavigationLink(destination: ExperimentalSetup()) {
                        Label("Experimental Setup", systemImage: "circle.dashed")
                    }
                    NavigationLink(destination: TiltView()) {
                        Label("TiltBounce Minigame", systemImage: "gamecontroller")
                    }    
                }
                Section(header: Text("Predicting the bounce")) {
                    NavigationLink(destination: EnergyMethods()) {
                        Label("Energy Methods", systemImage: "bolt")
                    }
                    NavigationLink(destination: KinematicEquations1()) {
                        Label("Kinematic Equations 1", systemImage: "move.3d")
                    }
                    NavigationLink(destination: CoefficentOfRestitution()) {
                        Label("Coefficent of Restitution", systemImage: "arrowshape.bounce.right")
                    }
                    NavigationLink(destination: KinematicEquations2()) {
                        Label("Kinematic Equations 2", systemImage: "move.3d")
                    }
                }
                Section(header: Text("Results")) {
                    NavigationLink(destination: ARViewEntry()) {
                        Label("AR Tips", systemImage: "info.square")
                    }
                    NavigationLink(destination: ARView()) {
                        Label("Enter AR Model", systemImage: "circle.dashed.rectangle")
                    }
                    NavigationLink(destination: Conclusion()) {
                        Label("Conclusion", systemImage: "checkmark.square")
                    }
                    
                }
                Text("""
This Swift Playgrounds app project and activities within it are written by Freddie Nicholson.

Experiment credit go to Dr Thrishantha Nanayakkara and Dr Mazdak Ghajari from the Dyson School of Design Engineering.
""").font(.footnote).listRowBackground(Color.clear).foregroundColor(.gray)
                
            }.navigationTitle("Bouncer")
            
        } detail: {
            Introduction()
        }
       
    }
}
