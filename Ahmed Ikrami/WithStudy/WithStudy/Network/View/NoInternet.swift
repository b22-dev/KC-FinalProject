
import SwiftUI

struct NoInternet: View {
    @ObservedObject var dm = DataManager()
    var body: some View {
        ZStack{
            Color("white")
                .ignoresSafeArea(.all, edges: .all)
            
    VStack{
        LottieView(filename: "noInternet")
            .frame(width: 400, height: 400)
                
                Text("تعذر وجود اتصال بالانترنت!")
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
        
        
        ZStack{
            Color("teal")
                .frame(width: 250, height: 50)
                .cornerRadius(10)
            
            Text("اعادة المحاولة")
        }
        .shadow(color: Color("teal"), radius: 10, x: 1, y: 7)
        .padding()
        .onTapGesture {
            if dm.isConnected == true {
                welcome()
            } else {
                NoInternet()
            }
        }
        
            }
        }
        .navigationBarHidden(true)
    }
}

struct NoInternet_Previews: PreviewProvider {
    static var previews: some View {
        NoInternet()
            .preferredColorScheme(.dark)
    }
}
