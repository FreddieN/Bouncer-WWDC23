import SwiftUI
import Charts

struct DisplacementPoint: Identifiable {
    let id = UUID()
    let x: Float
    let y: Float
    
    init(x: Float, y: Float) {
        self.x=x
        self.y=y
    }
}
struct Params3DBouncer: View {
    @State var l = 1.5
    @State var theta = 25.0
    @State var e = 0.8239
    @State var h_2 = 0.75
    @State var graviational_field_strength = 9.81
    @State var chart_i = 0
    @State var displacementPoints: [DisplacementPoint] = []

    let data: [Double] = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

    @State private var isEditing = false
    func redoDisplacementPoints() {
        displacementPoints = []
        let h_a = h_2 + l*sin(deg2rad(Double(theta)))
        let h_b = h_2
        let v_r = sqrt((10/7)*graviational_field_strength*(h_a-h_b))
        
        func y_1(_ x: Double) -> Double {
            //    print(x, ((-l*sin(deg2rad(Double(theta))))
            //                /
            //                 (l*cos(deg2rad(Double(theta)))))*x + h_a)
            
            return ((-l*sin(deg2rad(Double(theta))))
                    /
                    (l*cos(deg2rad(Double(theta)))))*x + h_a
        }
        
        let t_r = quadraticFormulaPositiveResult(
            a:0.5*graviational_field_strength, 
            b:v_r*sin(deg2rad(Double(theta))) ,
            c:(-h_2))
        
        let d_1 = l*cos(deg2rad(Double(theta)))
        
        func dtan(_ degree: Any) -> Double {
            return tan(deg2rad(Double(theta)))
        }
        
        func dcos(_ degree: Any) -> Double {
            return cos(deg2rad(Double(theta)))
        }
        
        func dsin(_ degree: Any) -> Double {
            return Double(sin(deg2rad(Double(theta))))
        }
        
        func y_2(_ x: Double) -> Double {
            let first_bit = -dtan(theta)*(x-d_1)
            let second_bit = 2*pow(v_r,2)*pow(dcos(-theta),2)
            let second_bit_g = graviational_field_strength/second_bit
            let third_bit = pow((x-d_1),2)
            //    print(x, (first_bit - second_bit_g*third_bit)+h_b)
            return (first_bit - second_bit_g*third_bit)+h_b
        }
        
        let e_1 = 0.8279
        let v_ym = (v_r*dsin(theta))+(graviational_field_strength*t_r)
        let v_yp = e_1*v_ym
        let v_h = v_r*dcos(theta)
        let d_2 = t_r*v_h
        
        func y_3(_ x: Double) -> Double {
            let first_bit = v_yp*((x-(d_1+d_2))/(v_r*dcos(theta)))
            let second_bit = graviational_field_strength*0.5*pow(((x-(d_1+d_2))/(v_r*dcos(theta))),2)
            return first_bit - second_bit
        }
        
        
        
        for i in stride(from: 0, to: l*cos(deg2rad(Double(theta))), by: 0.2) {
            //                            let ballaObject = SCNSphere(radius: 0.05)
            //                            let ballaMaterial = ballaObject.firstMaterial!
            //                            ballaMaterial.diffuse.contents  = UIColor(red: CGFloat(1), green: CGFloat(0.5), blue: CGFloat(0/255.0), alpha: CGFloat(1))
            //                            let balla = SCNNode(geometry: ballaObject)
            //                            universe.addChildNode(balla)
            //                            torch.look(at: balla.position)
            //                            
            //                            balla.position = SCNVector3(x: Float(i), y: Float(y_1(i)), z: 0)
            displacementPoints.append(DisplacementPoint(x:Float(i), y:Float(y_1(i))))
        }
        for i in stride(from: l*cos(deg2rad(Double(theta))), to: d_1+d_2, by: 0.2) {
            //                            let ballbObject = SCNSphere(radius: 0.05)
            //                            let ballbMaterial = ballbObject.firstMaterial!
            //                            ballbMaterial.diffuse.contents  = UIColor(red: CGFloat(0/255.0), green: CGFloat(255/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1))
            //                            let ballb = SCNNode(geometry: ballbObject)
            //                            universe.addChildNode(ballb)
            //                            //observer.look(at: ball.position)
            //                            torch.look(at: ballb.position)
            //                            //    ballb.opacity = 0.3
            //                            
            //                            ballb.position = SCNVector3(x: Float(i), y: Float(y_2(i)), z: 0)
            displacementPoints.append(DisplacementPoint(x:Float(i), y:Float(y_2(i))))
    
        }
        
        let t_2 = (-v_yp-v_yp)/(-graviational_field_strength)
        let d_3 = t_2*v_h
        
        for i in stride(from: d_1+d_2, to: d_3+d_1+d_2+1, by: 0.01) {
            //    print(i)
            //                            let ballcObject = SCNSphere(radius: 0.05)
            //                            let ballcMaterial = ballcObject.firstMaterial!
            //                            ballcMaterial.diffuse.contents  = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(255/255.0), alpha: CGFloat(1))
            //                            let ballc = SCNNode(geometry: ballcObject)
            //                            //    ballc.opacity = 0.3
            //                            universe.addChildNode(ballc)
            //                            //observer.look(at: ball.position)
            //                            torch.look(at: ballc.position)
            //                            
            //                            ballc.position = SCNVector3(x: Float(i), y: Float(y_3(i)), z: 0)
            if(Float(y_3(i)) >= 0){
                displacementPoints.append(DisplacementPoint(x:Float(i), y:Float(y_3(i))))
            }

        }
    }
    var body: some View {
        VStack() {
            HStack() {
                Text("Length of tube: \(l, specifier: "%.2f")m").frame(width:200)
                Slider(
                    value: $l,
                    in: 0...10,
                    onEditingChanged: { editing in
                        isEditing = editing
                        redoDisplacementPoints()
                    }
                )
            }
            HStack() {
                Text("Angle: \(theta, specifier: "%.2f")°").frame(width:200)
                Slider(
                    value: $theta,
                    in: 0.1...89,
                    onEditingChanged: { editing in
                        isEditing = editing
                        redoDisplacementPoints()
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
                Text("Height off ground: \(h_2, specifier: "%.2f")m").frame(width:200)
                Slider(
                    value: $h_2,
                    in: 0...10,
                    onEditingChanged: { editing in
                        isEditing = editing
                       redoDisplacementPoints()
                    }
                )
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
            ViewControllerRepresentable(parent: self).frame(width:400,height:400)
            VStack {
                GroupBox ( "Displacement Chart") {
                    Chart {
                        ForEach(displacementPoints) {
                            LineMark(
                                x: .value("Horizontal Displacement", $0.x),
                                y: .value("Vertical Displacement", $0.y)
                            )
                        }
                    }.chartXAxisLabel("Horizontal Displacement (metres)").chartYAxisLabel("Vertical Displacement (metres)")

.frame(height: 300)
                    }
            }.onAppear {
                redoDisplacementPoints()
            }
            //            Image(systemName: "globe")
            //                .imageScale(.large)
            //                .foregroundColor(.accentColor)
            //            Text("Hello, world!")
        }
    }
}

struct ViewControllerRepresentable:
    UIViewControllerRepresentable {
    var parent: Params3DBouncer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerRepresentable>) ->
    ViewControllerG {
        let viewController = ViewControllerG()
        viewController.l = parent.l
        viewController.theta = parent.theta
        viewController.e = parent.e
        viewController.h_2 = parent.h_2
        viewController.graviational_field_strength = parent.graviational_field_strength
        return viewController
    }
    func updateUIViewController(_ uiViewController: ViewControllerG, context: Context) {
        uiViewController.l = parent.l
        uiViewController.theta = parent.theta
        uiViewController.e = parent.e
        uiViewController.h_2 = parent.h_2
        uiViewController.graviational_field_strength = parent.graviational_field_strength
        uiViewController.viewDidLoad()
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: ViewControllerRepresentable
        
        init(_ viewControllerRepresentable: ViewControllerRepresentable) {
            self.parent = viewControllerRepresentable
        }
    }
}
