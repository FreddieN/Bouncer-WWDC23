import SwiftUI

struct ARView: View {
    @State var l = 1.5
    @State var theta = 25.0
    @State var e = 0.8239
    @State var h_2 = 0.75
    @State var g = 9.81
    
    @State private var isEditing = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ViewControllerRepresentable5(parent: self)
            VStack() {
                VStack() {
                    HStack() {
                        Text("Length of tube: \(l, specifier: "%.2f")m").frame(width:200).padding().background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.white))
                        Slider(
                            value: $l,
                            in: 0...10,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                    }
                    HStack() {
                        Text("Angle: \(theta, specifier: "%.2f")°").frame(width:200).padding().background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.white))
                        Slider(
                            value: $theta,
                            in: 0.1...89,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                    }
                    //            HStack() {
                    //                Text("e: \(e)")
                    //                Slider(
                    //                    value: $e,
                    //                    in: 0...1,
                    //                    onEditingChanged: { editing in
                    //                        isEditing = editing
                    //                    }
                    //                )
                    //            }
                    HStack() {
                        Text("Height off ground: \(h_2, specifier: "%.2f")m").frame(width:200).padding().background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.white))
                        Slider(
                            value: $h_2,
                            in: 0...10,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                    }
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
            }.padding(.horizontal, 40).padding(.vertical, 20).navigationTitle("AR Model")
        }
             
        }
       
}

struct ViewControllerRepresentable5:
    UIViewControllerRepresentable {
    var parent: ARView
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerRepresentable5>) ->
    ViewControllerG5 {
        let viewController = ViewControllerG5()
        viewController.l = parent.l
        viewController.theta = parent.theta
        viewController.e = parent.e
        viewController.h_2 = parent.h_2
        viewController.g = parent.g
        return viewController
    }
    func updateUIViewController(_ uiViewController: ViewControllerG5, context: Context) {
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
        var parent: ViewControllerRepresentable5
        
        init(_ viewControllerRepresentable: ViewControllerRepresentable5) {
            self.parent = viewControllerRepresentable
        }
    }
}
