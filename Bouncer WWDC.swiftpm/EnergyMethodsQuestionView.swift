import SwiftUI
import AVKit

struct EnergyMethodsQuestionView: View {
    @State var selection = "Select an Answer"

    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                VStack(alignment: .leading) {
                }.padding(.horizontal, 40).padding(.vertical, 10)
                Text("Question").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom)
                Text("""
What will be the initial velocity (starting speed) of the ball in the tube?
""")
                Picker(selection: $selection, label: Text("Select an Answer:")) { 
                    Text("Select an Answer").tag("Select an Answer")
                    Text("2m/s").tag("2")
                    Text("0m/s").tag("0")
                    Text("2.1m/s").tag("2.1")
                    Text("2.98m/s").tag("2.98")

                }.pickerStyle(.menu)
                if selection != "0" {
                    if selection != "Select an Answer" {

                    VStack(alignment:.leading){
                        Text("Incorrect").font(.title).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.white)
                        Text("""
Consider how the ball is likely to start in this experiment.
""").foregroundColor(.white)
                    }.padding(10).background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.red))
                    }

                } else {
                        VStack(alignment:.leading){
                            Text("Correct").font(.title).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.black)
                            Text("""
You can see a full simplified diagram of the motion below. The ball is started from rest for the calculation to work.  We can equate initial kinetic energy in the equation to 0.
""").foregroundColor(.black)
                            Image("energymethodsfulldiagram").resizable()
                                .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                        }.padding(10).background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.green))
                }
                Spacer()
            }
            
        }
    }
}
