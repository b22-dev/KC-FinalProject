
import SwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions lunchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main

struct WithStudyApp : App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var SessionService = SessionServiceImpl()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch SessionService.state {
                case .loggedIn:
                    HomeView()
                        .environmentObject(SessionService)
                case .loggedOut:
                    welcome()
                }
            }
        }
    }
}
