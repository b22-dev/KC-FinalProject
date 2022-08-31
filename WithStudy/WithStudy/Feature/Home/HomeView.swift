
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var SessionService: SessionServiceImpl
    var body: some View {
        ZStack{
        VStack{
            bottomBar(email: .constant("Admin@gmail.com"))
            } // <- Main Stack
        } // <- Background
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        HomeView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
