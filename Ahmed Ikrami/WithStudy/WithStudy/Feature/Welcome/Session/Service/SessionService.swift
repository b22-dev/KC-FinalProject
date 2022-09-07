import Foundation
import FirebaseAuth
import FirebaseDatabase
import Combine

// Create a protocol with the following
/**
 * Init
 * state
 * Publisher to return the user so in the view model you can map and create a struct
 */

enum SessionState {
    case loggedIn
    case loggedOut
}


protocol SessionService {
    var state: SessionState { get }
    var userDetails: UserSessionDetails? { get }
    init()
    func logout()
}

final class SessionServiceImpl: SessionService, ObservableObject {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: UserSessionDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        setupObservations()
    }
    
    deinit {
        guard let handler = handler else { return }
        Auth.auth().removeStateDidChangeListener(handler)
        print("deinit SessionServiceImpl")
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}


private extension SessionServiceImpl {
    
    func setupObservations() {
        
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] _,_ in
                guard let self = self else { return }
                
                let currentUser = Auth.auth().currentUser
                self.state = currentUser == nil ? .loggedOut : .loggedIn
                
                if let uid = currentUser?.uid {
                    
                    Database
                        .database()
                        .reference()
                        .child("users")
                        .child(uid)
                        .observe(.value) { [weak self] snapshot in
                            
                            guard let self = self,
                                  let value = snapshot.value as? NSDictionary,
                                  let name = value[RegistrationKeys.name.rawValue] as? String,
                                  let grade = value[RegistrationKeys.grade.rawValue] as? Int,
                                  let email = value[RegistrationKeys.email.rawValue] as? String,
                                  let gender = value[RegistrationKeys.gender.rawValue] as? String else {
                                return
                            }

                            DispatchQueue.main.async {
                                self.userDetails = UserSessionDetails(name: name, grade: grade, email: email, gender: Gender(rawValue: gender) ?? .male)
                            }
                        }
                }
            }
    }
}
