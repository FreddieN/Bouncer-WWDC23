import SwiftUI
import AVKit

struct CoefficientOfRestitutionQuestionView: View {
    @State var selection = "Select an Answer"
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                VStack(alignment: .leading) {
                }.padding(.horizontal, 40).padding(.vertical, 10)
                Text("Question").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom)
                Text("""
What coefficient of restitution would cause objects to stick together after colliding?
""")
                Picker(selection: $selection, label: Text("Select an Answer:")) { 
                    Text("Select an Answer").tag("Select an Answer")
                    Text("1.000001").tag("vertical")
                    Text("1.5").tag("horizontal")
                    Text("1.66").tag("2.1")
                    Text("0").tag("0")
                    
                }.pickerStyle(.menu)
                if selection != "0" {
                    if selection != "Select an Answer" {
                        
                        VStack(alignment:.leading){
                            Text("Incorrect").font(.title).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.white)
                            Text("""
A coefficient of restitution can never be greater than 1.
""").foregroundColor(.white)
                                .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                        }.padding(10).background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.red))
                    }
                    
                } else {
                    VStack(alignment:.leading){
                        Text("Correct").font(.title).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.black)
                        Text("""
A coefficient of 0 indicates a perfectly inelastic collision, where the objects stick together after colliding. See below for the finished simplified diagram of these calculations.
""").foregroundColor(.black)
                        Image("coefficentofrestitutionfulldiagram").resizable()
                            .aspectRatio(contentMode: .fit).frame(maxHeight:500)
                    }.padding(10).background(    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.green))
                }
                Spacer()
            }
            
        }
    }
}
