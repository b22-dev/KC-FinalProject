
import SwiftUI

struct NavBar: View {
    @State var title = ""
    var body: some View {
        ZStack {
            
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 5)
            
            HStack {
                Image(systemName: "chevron.backward.square.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("teal"))
                    .padding(.leading, 20)
                
                Text("غادر")
                    .foregroundColor(Color("teal"))
                    .font(.headline)
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .leading)

                    .onTapGesture {
                        // Sign out from the chat
                    }
                Spacer()
                
                Text(title)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
            }
        }
            .frame(height: 70)
            .frame(maxHeight: .infinity, alignment: .top)
        
            .navigationBarHidden(true)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(title: "الدردشة")
    }
}
