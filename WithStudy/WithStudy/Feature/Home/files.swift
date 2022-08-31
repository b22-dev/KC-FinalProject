
import SwiftUI

struct files: View {
    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            ZStack{
            Color("teal")
                .frame(width: 350, height: 350)
                .cornerRadius(10)
                VStack{
            Text("قريبا!")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
            Text("جايين جايين! جالسين نطورها حاليا.")
                        .foregroundColor(.black)
                }
            }
            .shadow(color: Color("teal"), radius: 10, x: 3, y: 7)
        }
        
    }
}

struct files_Previews: PreviewProvider {
    static var previews: some View {
        files()
            .preferredColorScheme(.light)
    }
}
