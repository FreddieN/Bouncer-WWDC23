import SwiftUI
import AVKit


struct KinematicsEquations2QuestionView: View {
    @State var selection = "Select an Answer"
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                VStack(alignment: .leading) {
                }.padding(.horizontal, 40).padding(.vertical, 10)
                Text("Question").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom)
                Text("""
Why did we multiply the time value for the first half of the collision to find the complete time of this stage?
""")
                Picker(selection: $selection, label: Text("Select an Answer:")) { 
                    Text("Select an Answer").tag("Select an Answer")
                    Text("The initial velocity of the ball is 0 m/s.").tag("vertical")
                    Text("The initial acceleration of the ball is 0 m/s.").tag("horizontal")
                    Text("The parabola is a Fourier series.").tag("2.1")
                    Text("The parabola is perfectly symmetric. ").tag("1")
                    
                }.pickerStyle(.menu)
                if selection != "1" {
                    if selection != "Select an Answer" {
                        
                        VStack(alignment:.leading){
                            Text("Incorrect").font(.title).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.white)
                            Text("""
Consider what property might make you double the time value.
""").foregroundColor(.white)
                           
                        }.padding(10).background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.red))
                    }
                    
                } else {
                    VStack(alignment:.leading){
                        Text("Correct").font(.title).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.black)
                        Text("""
As the parabola is perfectly symmetric, the time value for the entire motion is simply double the time taken for the first half using SUVAT. The final simplified diagram can be seen below:
""").foregroundColor(.black)
                        Image("kinematics2fulldiagram").resizable()
                            .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                    }.padding(10).background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.green))
                }
                Spacer()
            }
            
        }
    }
}
