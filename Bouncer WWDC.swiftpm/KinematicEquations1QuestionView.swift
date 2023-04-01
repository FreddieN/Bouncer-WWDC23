import SwiftUI
import AVKit

struct KinematicsEquations1QuestionView: View {
    @State var selection = "Select an Answer"
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                VStack(alignment: .leading) {
                }.padding(.horizontal, 40).padding(.vertical, 10)
                Text("Question").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom)
                Text("""
Which component does sin(θ) give us?
""")
                Picker(selection: $selection, label: Text("Select an Answer:")) { 
                    Text("Select an Answer").tag("Select an Answer")
                    Text("Vertical component").tag("vertical")
                    Text("Horizontal component").tag("horizontal")
                    Text("Reflection component").tag("2.1")
                    Text("Imaginary component").tag("2.98")
                    
                }.pickerStyle(.menu)
                if selection != "vertical" {
                    if selection != "Select an Answer" {
                        
                        VStack(alignment:.leading){
                            Text("Incorrect").font(.title).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.white)
                            Text("""
Try and think about the situation with trigonometry.
""").foregroundColor(.white)
                            Image("kinematics1trigdiagram").resizable()
                                .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                        }.padding(10).background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.red))
                    }
                    
                } else {
                    VStack(alignment:.leading){
                        Text("Correct").font(.title).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.black)
                        Text("""
Using trigonometry, we can see that sin(θ) will give us the vertical component for the velocity. See below for a full simplified diagram with the final values.
""").foregroundColor(.black)
                        Image("kinematics1fulldiagram").resizable()
                            .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                    }.padding(10).background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.green))
                }
                Spacer()
            }
            
        }
    }
}
