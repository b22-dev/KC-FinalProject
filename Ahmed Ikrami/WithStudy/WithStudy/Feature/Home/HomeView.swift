
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var SessionService: SessionServiceImpl
    @ObservedObject var dm = DataManager()
    
    var body: some View {
        ZStack{
            if dm.isConnected == true {
                bottomBar(email: .constant("Admin@withStudy.com"))
            } else {
                NoInternet()
            }
        } // <- Background
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        HomeView()
                .environmentObject(SessionServiceImpl())
        }
        .preferredColorScheme(.light)
    }
}
