import SwiftUI

struct TiltView: View {
    @State var l = 1.5
    @State var theta = 25.0
    @State var e = 0.8239
    @State var h_2 = 0.75
    @State var g = 9.81
    @State var inGame = false
    @State private var isEditing = false
    

    
    var body: some View {
        VStack() {
            ZStack(alignment: .top) {
                
                if(!inGame) {
                    VStack() {
                        Text("""
In this game, you will apply what you have just learnt about the effects of the different parameters on the experiment.

A red 'objective tube' will appear between you and the maximum distance reachable by the experiment setup with the given parameters. Your iPad tilt will match the angle of the tube. Tilt your iPad in order to work out the right angle for the given distance. You must hold at that angle for a short moment in order to score a point.

Each objective is timed and as you score this time will decrease making the game harder!

Make sure you are in a clear space ideally with a floor in front of you with a distance of 4 metres. The tube will spawn directly in front of the iPad. Press 'Start Game' to begin
""").padding(.horizontal,40).padding(.top, 10)
                        Image("tiltbounce").resizable()
                            .aspectRatio(contentMode: .fit).frame(maxHeight:300)
                        Button(action: { inGame=true}) {
                            Text("Start Game")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                } else {
                    ViewControllerRepresentable6(parent: self)
                    VStack() {
                        VStack() {
                            
//                            HStack() {
//                                Text("Angle: \(theta, specifier: "%.2f")°").frame(width:200).padding().background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.white))
//                                Slider(
//                                    value: $theta,
//                                    in: 0.1...89,
//                                    onEditingChanged: { editing in
//                                        isEditing = editing
//                                    }
//                                )
//                            }
                        }
                                        HStack() {
                            //                Text("e: \(e)")
                            //                Slider(
                            //                    value: $e,
                            //                    in: 0...1,
                            //                    onEditingChanged: { editing in
                            //                        isEditing = editing
                            //                    }
                            //                )
                            //            }
                            
                        }
                        //            HStack() {
                        //                Text("g: \(g)")
                        //                Slider(
                        //                    value: $g,
                        //                    in: 0...20,
                        //                    onEditingChanged: { editing in
                        //                        isEditing = editing
                        //                    }
                        //                )
                        //            }
                        
                        //            Image(systemName: "globe")
                        //                .imageScale(.large)
                        //                .foregroundColor(.accentColor)
                        //            Text("Hello, world!")
                    }
                }
            }.padding(.horizontal, 40).padding(.vertical, 20).navigationTitle("TiltBounce Minigame")
            Spacer()
            if(inGame) {
                Button(action: { inGame=false}) {
                    Text("Restart")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }.padding()
            }
        }
        
    }
    
}

struct ViewControllerRepresentable6:
    UIViewControllerRepresentable {
    var parent: TiltView
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerRepresentable6>) ->
    ViewControllerG6 {
        let viewController = ViewControllerG6()
        viewController.l = parent.l
        viewController.theta = parent.theta
        viewController.e = parent.e
        viewController.h_2 = parent.h_2
        viewController.g = parent.g
        return viewController
    }
    func updateUIViewController(_ uiViewController: ViewControllerG6, context: Context) {
//        print(parent.g)
        uiViewController.l = parent.l
        uiViewController.theta = parent.theta
        uiViewController.e = parent.e
        uiViewController.h_2 = parent.h_2
        uiViewController.g = parent.g
        uiViewController.viewDidLoad()
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: ViewControllerRepresentable6
        
        init(_ viewControllerRepresentable: ViewControllerRepresentable6) {
            self.parent = viewControllerRepresentable
        }
    }
}
