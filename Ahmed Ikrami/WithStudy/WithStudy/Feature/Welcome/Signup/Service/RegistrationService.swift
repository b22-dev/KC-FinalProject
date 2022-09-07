
import Combine
import Foundation
import Firebase
import FirebaseDatabase

enum Gender: String, Identifiable, CaseIterable {
    var id: Self { self }
    case male
    case female
}




protocol RegistrationService {
    func register(with credentials: RegistrationCredentials) -> AnyPublisher<Void, Error>
}

enum RegistrationKeys: String {
    case name
    case grade
    case gender
    case email
}

final class RegistrationServiceImpl: RegistrationService {
    
    func register(with credentials: RegistrationCredentials) -> AnyPublisher<Void, Error> {
        
        Deferred {

            Future { promise in
                
                Auth.auth().createUser(withEmail: credentials.email,
                                       password: credentials.password) { res, error in
                    
                    if let err = error {
                        promise(.failure(err))
                    } else {
                        
                        if let uid = res?.user.uid {
                            
                            let values = [RegistrationKeys.name.rawValue: credentials.name,
                                          RegistrationKeys.grade.rawValue: credentials.grade,
                                          RegistrationKeys.email.rawValue: credentials.email,
                                          RegistrationKeys.gender.rawValue: credentials.gender.rawValue] as [String : Any]
                            
                            Database
                                .database()
                                .reference()
                                .child("users")
                                .child(uid)
                                .updateChildValues(values) { error, ref in
                                    
                                    if let err = error {
                                        promise(.failure(err))
                                    } else {
                                        promise(.success(()))
                                    }
                                }
                        }
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
