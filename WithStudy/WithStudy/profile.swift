
import SwiftUI

struct profile: View {
    @Binding var name1: String
    @Binding var grade1: Int
    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            
            VStack{
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 150))
                    .foregroundColor(Color("teal"))
                    .padding(25)
                Text("\(name1)")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .padding(.bottom, 10)
                
                Text("\(grade1)")
            }
        }
    }
}

struct profile_Previews: PreviewProvider {
    static var previews: some View {
        profile(name1: .constant("Ahmed"), grade1: .constant(10))
            .preferredColorScheme(.dark)
    }
}
