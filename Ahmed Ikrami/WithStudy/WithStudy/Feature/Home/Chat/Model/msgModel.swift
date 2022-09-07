
import SwiftUI
import FirebaseFirestoreSwift

//For on Change
struct msgModel: Codable,Identifiable,Hashable{
    
    @DocumentID var id: String?
    var msg : String
    var user : String
    var timeStamp: Date
    
    enum CodingKeys: String,CodingKey {
        case id
        case msg
        case user
        case timeStamp
    }
}
