import SwiftUI
import SceneKit
import ARKit


//func deg2rad(_ number: Double) -> Double {
//    return number * .pi / 180
//}
//
//func quadraticFormulaPositiveResult(a: Double, b: Double, c:Double) -> Double {
//    let result1 = (-b + sqrt(pow(b,2) - 4*a*c))/(2*a)
//    let result2 = (-b - sqrt(pow(b,2) - 4*a*c))/(2*a)
//    if(result1 >= 0) {
//        return result1
//    } else {
//        return result2
//    }
//}
//
//func quadraticFormulaHigherOrLowerResult(a: Double, b: Double, c:Double, d:String) -> Double {
//    let result1 = (-b + sqrt(pow(b,2) - 4*a*c))/(2*a)
//    let result2 = (-b - sqrt(pow(b,2) - 4*a*c))/(2*a)
//    //    print("r1:"+String(result1), "r2:"+String(result2), d)
//    if(result1 >= result2) {
//        if(d == "highest") {
//            return result1
//        }else {
//            return result2
//        }
//    } else {
//        if(d == "highest") {
//            return result2
//        }else {
//            return result1
//        }    }
//}


public class ViewControllerG5: UIViewController {
    var arView = ARSCNView(frame: .zero)
    var anchor: ARAnchor!
    var l: Double = 1.5
    var theta: Double = 25.0
    var e: Double = 0.8239
    var h_2: Double = 0.75
    var g: Double = 9.81
    var loaded: Bool = false

    func dtan(_ degree: Any) -> Double {
        return tan(deg2rad(Double(theta)))
    }
    
    func dcos(_ degree: Any) -> Double {
        return cos(deg2rad(Double(theta)))
    }
    
    func dsin(_ degree: Any) -> Double {
        return Double(sin(deg2rad(Double(theta))))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let h_1 = l*dsin(theta)
        if(!self.loaded) {
            self.view = arView           // IMPORTANT
            arView.scene = SCNScene()
            arView.autoenablesDefaultLighting = true
        }
        self.loaded = true
        
        let scene = arView.scene
        arView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode()
        }
        self.anchor = ARAnchor(name: "special", 
                               transform: .init([1, 0, 0, 0], 
                                                [0, 1, 0, 0], 
                                                [0, 0, 1, 0], 
                                                [0, 0,0, 1] ) )
        let model = SCNNode(geometry: SCNSphere(radius:0.1))
        model.geometry?.firstMaterial?.diffuse.contents = 
        UIColor.red
        model.simdTransform = self.anchor.transform   
        arView.session.add(anchor: self.anchor)
        arView.scene.rootNode.addChildNode(model)
        // ARKit config
        let config = ARWorldTrackingConfiguration()  
        arView.session.run(config)
        let o2 = scene.rootNode
        let universe = SCNNode()
        o2.addChildNode(universe)
        let camera = SCNCamera()
        let observer = SCNNode()
        observer.camera = camera
        observer.position = SCNVector3(x: 2.5, y: 1, z: 5)
        universe.addChildNode(observer)
        universe.position =  SCNVector3(0, -(h_1+h_2), -3)
        
        let light = SCNLight()
        light.type = .directional
        let torch = SCNNode()
        torch.light = light
        torch.position = SCNVector3(x: 0, y: 0, z: 25)
        universe.addChildNode(torch)
        
        light.type = .directional
        let torch2 = SCNNode()
        torch2.light = light
        torch2.position = SCNVector3(x: 0, y: 0, z: -25)
        universe.addChildNode(torch2)
        
        
        
        let h_a = h_2 + l*sin(deg2rad(Double(theta)))
        let h_b = h_2
        let v_r = sqrt((10/7)*g*(h_a-h_b))
        
        func y_1(_ x: Double) -> Double {
            //    print(x, ((-l*sin(deg2rad(Double(theta))))
            //                /
            //                 (l*cos(deg2rad(Double(theta)))))*x + h_a)
            
            return ((-l*sin(deg2rad(Double(theta))))
                    /
                    (l*cos(deg2rad(Double(theta)))))*x + h_a
        }
        
        let t_r = quadraticFormulaPositiveResult(
            a:0.5*g, 
            b:v_r*sin(deg2rad(Double(theta))) ,
            c:(-h_2))
        
        let d_1 = l*cos(deg2rad(Double(theta)))
        
        
        func y_2(_ x: Double) -> Double {
            let first_bit = -dtan(theta)*(x-d_1)
            let second_bit = 2*pow(v_r,2)*pow(dcos(-theta),2)
            let second_bit_g = g/second_bit
            let third_bit = pow((x-d_1),2)
            //    print(x, (first_bit - second_bit_g*third_bit)+h_b)
            return (first_bit - second_bit_g*third_bit)+h_b
        }
        
        let e_1 = 0.8279
        let v_ym = (v_r*dsin(theta))+(g*t_r)
        let v_yp = e_1*v_ym
        let v_h = v_r*dcos(theta)
        let d_2 = t_r*v_h
        
        func y_3(_ x: Double) -> Double {
            let first_bit = v_yp*((x-(d_1+d_2))/(v_r*dcos(theta)))
            let second_bit = g*0.5*pow(((x-(d_1+d_2))/(v_r*dcos(theta))),2)
            return first_bit - second_bit
        }
        
        
        
        for i in stride(from: 0, to: l*cos(deg2rad(Double(theta))), by: 0.2) {
            let ballaObject = SCNSphere(radius: 0.05)
            let ballaMaterial = ballaObject.firstMaterial!
            ballaMaterial.diffuse.contents  = UIColor(red: CGFloat(1), green: CGFloat(0.5), blue: CGFloat(0/255.0), alpha: CGFloat(1))
            let balla = SCNNode(geometry: ballaObject)
            universe.addChildNode(balla)
            torch.look(at: balla.position)
            
            balla.position = SCNVector3(x: Float(i), y: Float(y_1(i)), z: 0)
        }
        for i in stride(from: l*cos(deg2rad(Double(theta))), to: d_1+d_2, by: 0.2) {
            let ballbObject = SCNSphere(radius: 0.05)
            let ballbMaterial = ballbObject.firstMaterial!
            ballbMaterial.diffuse.contents  = UIColor(red: CGFloat(0/255.0), green: CGFloat(255/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1))
            let ballb = SCNNode(geometry: ballbObject)
            universe.addChildNode(ballb)
            //observer.look(at: ball.position)
            torch.look(at: ballb.position)
            //    ballb.opacity = 0.3
            
            ballb.position = SCNVector3(x: Float(i), y: Float(y_2(i)), z: 0)
        }
        
        let t_2 = (-v_yp-v_yp)/(-g)
        let d_3 = t_2*v_h
        
        for i in stride(from: d_1+d_2, to: d_3+d_1+d_2, by: 0.2) {
            //    print(i)
            let ballcObject = SCNSphere(radius: 0.05)
            let ballcMaterial = ballcObject.firstMaterial!
            ballcMaterial.diffuse.contents  = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(255/255.0), alpha: CGFloat(1))
            let ballc = SCNNode(geometry: ballcObject)
            //    ballc.opacity = 0.3
            universe.addChildNode(ballc)
            //observer.look(at: ball.position)
            torch.look(at: ballc.position)
            
            ballc.position = SCNVector3(x: Float(i), y: Float(y_3(i)), z: 0)
        }
        
        let light3 = SCNLight()
        light3.type = .spot
        light3.intensity=600
        let torch3 = SCNNode()
        torch3.light = light3
        torch3.position = SCNVector3(x: Float(d_1+d_2), y: 20, z: 0)
        universe.addChildNode(torch3)
        torch3.look(at:SCNVector3(Float(d_1+d_2),0,0))
        
        let light4 = SCNLight()
        light4.type = .omni
        light4.intensity=250
        let torch4 = SCNNode()
        torch4.light = light4
        torch4.position = SCNVector3(x: Float(d_1+d_2), y: 100, z: -10)
        universe.addChildNode(torch4)
        torch4.look(at:SCNVector3(Float(d_1+d_2),0,-10))
        
        let ball1Object = SCNSphere(radius: 0.1)
        let ball1Material = ball1Object.firstMaterial!
        ball1Material.diffuse.contents  = UIColor.yellow
        let ball1 = SCNNode(geometry: ball1Object)
        universe.addChildNode(ball1)
        //observer.look(at: ball.position)
        torch.look(at: ball1.position)
        
        ball1.position = SCNVector3(x: 0, y: Float(y_1(0)), z: 0)
        
        let initBall = SCNAction.move(to: SCNVector3(x:0,y:Float(y_1(0)),z:0), duration: 0)
        let tubeMovementTime = Float((2*l)/(0+v_r))
        let tubeMovement = SCNAction.move(to: SCNVector3(x:Float(l*dcos(theta)),y:Float(y_1(l*dcos(theta))),z:0), duration: TimeInterval(tubeMovementTime));
        var animSequence = [initBall,tubeMovement]
        for i in stride(from: l*cos(deg2rad(Double(theta))), to: d_1+d_2, by: 0.2) {
            
            let t_z = quadraticFormulaPositiveResult(
                a:0.5*g, 
                b:v_r*sin(deg2rad(Double(theta))) ,
                c:(-(h_2-Double(y_2(i)))))
            let t_z1 = quadraticFormulaPositiveResult(
                a:0.5*g, 
                b:v_r*sin(deg2rad(Double(theta))) ,
                c:(-(h_2-Double(y_2(i+0.2)))))
            let t=t_z1-t_z
            let am1 = SCNAction.move(to: SCNVector3(x: Float(i), y: Float(y_2(i)), z: 0), duration: t)
            animSequence.append(am1)
        }
        //for i in stride(from: d_1+d_2, to: d_3+d_1+d_2, by: 0.2) {
        //    
        //    
        //}
        
        
        let t_z = quadraticFormulaHigherOrLowerResult(
            a:-0.5*g, 
            b:v_yp,
            c:(-Double(y_3(d_1+d_2))),
            d:"lowest")
        let t_z1 = quadraticFormulaHigherOrLowerResult(
            a:-0.5*g, 
            b:v_yp ,
            c:(-Double(y_3(d_1+d_2+0.2))),
            d:"lowest")
        var t=t_z1-t_z
        if(t<0) {
            t = 0.2
        }
        for i in stride(from: d_1+d_2, to: (d_3)+d_1+d_2, by: 0.2) {
            
            let am1 = SCNAction.move(to: SCNVector3(x: Float(i), y: Float(y_3(i)), z: 0), duration: t)
            animSequence.append(am1)
        }
        
        let sequence = SCNAction.sequence(animSequence)
        let loop = SCNAction.repeatForever(sequence)
        ball1.runAction(loop)
        
        //        let floorObject = SCNFloor()
        //        floorObject.reflectivity = 0.1
        //        floorObject.firstMaterial!.diffuse.contents = UIColor(red: CGFloat(204/255.0), green: CGFloat(204/255.0), blue: CGFloat(204/255.0), alpha: CGFloat(1.0))
        //        let floor = SCNNode(geometry: floorObject)
        //        universe.addChildNode(floor)
        //        floor.position = SCNVector3(x:0,y:-0.01,z:0)
        
        let tubeObject = SCNTube(innerRadius: 0.12, outerRadius: 0.13, height: l)
        let tubeMaterial = tubeObject.firstMaterial!
        tubeMaterial.diffuse.contents  = UIColor.white
        let tube = SCNNode(geometry: tubeObject)
        tube.opacity = 0.3
        universe.addChildNode(tube)
        tube.position = SCNVector3(x:Float(d_1)/2,y:Float(y_1(d_1/2)),z:0)
        let rAngle = CGFloat(90-theta)
        tube.eulerAngles = SCNVector3(x:0,y:0,z:Float(((rAngle)*CGFloat.pi))/180)
        
        let mat_aObject = SCNPlane(width: 0.25, height:0.25)
        //floorObject.reflectivity = 1
        mat_aObject.firstMaterial!.diffuse.contents = UIColor.white
        let mat_a = SCNNode(geometry: mat_aObject)
        universe.addChildNode(mat_a)
        mat_a.position = SCNVector3(x:Float((d_1)+(d_2)),y:0,z:0)
        mat_a.eulerAngles = SCNVector3(x:Float(((-90)*CGFloat.pi))/180,y:0,z:0)
        mat_a.opacity=0.8
        
        let mat_bObject = SCNPlane(width: 0.25, height:0.25)
        //floorObject.reflectivity = 1
        mat_bObject.firstMaterial!.diffuse.contents = UIColor.white
        let mat_b = SCNNode(geometry: mat_bObject)
        mat_b.opacity=0.6
        universe.addChildNode(mat_b)
        mat_b.position = SCNVector3(x:Float((d_1)+(d_2)+d_3),y:0,z:0)
        mat_b.eulerAngles = SCNVector3(x:Float(((-90)*CGFloat.pi))/180,y:0,z:0)
        
        //let d_1_markerObject = SCNPlane(width: Double(d_1), height:0.02)
        ////floorObject.reflectivity = 1
        //d_1_markerObject.firstMaterial!.diffuse.contents = UIColor.white
        //let d_1_marker = SCNNode(geometry: d_1_markerObject)
        //universe.addChildNode(d_1_marker)
        //let top_1 = h_a
        //d_1_marker.position = SCNVector3(x:Float((d_1/2)),y:Float(top_1+0.2),z:0)
        //
        //let d_1_markerTextObject = SCNText(string:String(round(d_1 * 100) / 100.0)+"m", extrusionDepth:0.1)
        //d_1_markerTextObject.font = UIFont.systemFont(ofSize: 0.3, weight: UIFont.Weight.thin)
        ////floorObject.reflectivity = 1
        ////d_1_markerTextObject.firstMaterial!.diffuse.contents = UIColor.white
        //let d_1_markerText = SCNNode(geometry: d_1_markerTextObject)
        //universe.addChildNode(d_1_markerText)
        //d_1_markerText.position = SCNVector3(x:Float(d_1)+0.1,y:Float(h_a-1),z:-0.1)
        //
        //
        //let d_2_markerObject = SCNPlane(width: Double(d_2), height:0.02)
        ////floorObject.reflectivity = 1
        //d_2_markerObject.firstMaterial!.diffuse.contents = UIColor.white
        //let d_2_marker = SCNNode(geometry: d_2_markerObject)
        //universe.addChildNode(d_2_marker)
        //let top_2 = (Float(y_2(d_1)))
        //d_2_marker.position = SCNVector3(x:Float(d_1+(d_2/2)),y:top_2+0.2,z:0)
        //
        //let d_2_markerTextObject = SCNText(string:String(round(d_2 * 100) / 100.0)+"m", extrusionDepth:0.1)
        //d_2_markerTextObject.font = UIFont.systemFont(ofSize: 0.3, weight: UIFont.Weight.thin)
        ////floorObject.reflectivity = 1
        ////d_1_markerTextObject.firstMaterial!.diffuse.contents = UIColor.white
        //let d_2_markerText = SCNNode(geometry: d_2_markerTextObject)
        //universe.addChildNode(d_2_markerText)
        //d_2_markerText.position = SCNVector3(x:Float(d_1+d_2)+0.1,y:Float(y_2(d_1)-0.9),z:-0.1)
        //
        //
        //let d_3_markerObject = SCNPlane(width: Double(d_3), height:0.02)
        ////floorObject.reflectivity = 1
        //d_3_markerObject.firstMaterial!.diffuse.contents = UIColor.white
        //let d_3_marker = SCNNode(geometry: d_3_markerObject)
        //universe.addChildNode(d_3_marker)
        //let top_3 = (Float(y_3(d_1+d_2+(d_3/2))))
        //d_3_marker.position = SCNVector3(x:Float(d_1+d_2+(d_3/2)),y:top_3+0.2,z:0)
        //ball.position = SCNVector3(x: Float(i), y: Float(y_1(i)), z: 0)
        
        //observer.look(at: SCNVector3(x:Float(d_1+d_2), y:Float(y_3(d_1+d_2)), z:0))
        //observer.runAction(
        //    .repeatForever(SCNAction.sequence([
        //                                        SCNAction.move(to: SCNVector3(x: Float(d_3)+4, y: 2, z: 0), duration: 2),
        //        SCNAction.move(to: SCNVector3(x: Float(d_3), y: 2, z: -6), duration: 2),
        //        SCNAction.move(to: SCNVector3(x: Float(d_3)-4, y: 2, z: 0), duration: 2),
        //        SCNAction.move(to: SCNVector3(x: Float(d_3), y: 2, z: 6), duration: 2)
        //
        //    ])))
        
        //
        //let origin = SCNNode()
        //origin.position = SCNVector3(x:Float(d_1+d_2),y:0,z:0)
        //let lookAtConstraint = SCNLookAtConstraint(target: origin)
        //
        //observer.constraints = [lookAtConstraint]
        torch2.look(at:ball1.position)        
    }
    
}
