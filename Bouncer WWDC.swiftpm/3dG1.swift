import SwiftUI

struct G1: View {
    @State var l = 1.5
    @State var theta = 25.0
    @State var e = 0.8239
    @State var h_2 = 1.75
    @State var graviational_field_strength = 9.81
    
    @State private var isEditing = false
    
    var body: some View {
        VStack() {
           
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
            ViewControllerRepresentableG1(parent: self).frame(width:400,height:400)
            //            Image(systemName: "globe")
            //                .imageScale(.large)
            //                .foregroundColor(.accentColor)
            //            Text("Hello, world!")
        }
    }
}

struct ViewControllerRepresentableG1:
    UIViewControllerRepresentable {
    var parent: G1
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerRepresentableG1>) ->
    ViewControllerG1 {
        let viewController = ViewControllerG1()
        viewController.l = parent.l
        viewController.theta = parent.theta
        viewController.e = parent.e
        viewController.h_2 = parent.h_2
        viewController.graviational_field_strength = parent.graviational_field_strength
        return viewController
    }
    func updateUIViewController(_ uiViewController: ViewControllerG1, context: Context) {
        uiViewController.l = parent.l
        uiViewController.theta = parent.theta
        uiViewController.e = parent.e
        uiViewController.h_2 = parent.h_2
        uiViewController.graviational_field_strength = parent.graviational_field_strength
        uiViewController.viewDidLoad()
    }
   
}
