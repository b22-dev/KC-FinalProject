
import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

class ChatModel: ObservableObject{
    @Published var txt = ""
    @Published var msgs : [msgModel] = []
    @EnvironmentObject var SessionService: SessionServiceImpl
    @AppStorage("current_user") var user = ""
    let ref = Firestore.firestore()
    @Published var msg : msgModel?
    
    init() {
        readAllMsgs()
    }
    
    func onAppear() {
        
        // Checking the user
        
        if user == ""  {
            UIApplication.shared.windows.first?.rootViewController?.present(alertView(), animated: true)
        }
        
    }
    
    func alertView()->UIAlertController{
        
        let alert = UIAlertController(title: "تسجيل الدخول للشات", message: "ذكرنا باسمك عشان ندخلك الشات", preferredStyle: .alert)
        
        alert.addTextField{ (txt) in
            txt.placeholder = "اكتب اسمك"
        }
        
        let join = UIAlertAction(title: "تم", style: .default) { (_) in
            
            let user = alert.textFields![0].text ?? ""
            
            if user != "" {
                
                self.user = user
                return
            }
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
            //let join = UIAlertAction(title: "تم", style: .default)
            
        }
        alert.addAction(join)
        
        return alert
    }
    
    func readAllMsgs() {
        
        ref.collection("Msgs").order(by: "timeStamp", descending: false).addSnapshotListener { (snap, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            guard let data = snap else{return}
            
            data.documentChanges.forEach { (doc) in
                
                if doc.type == .added {
                    
                    let msg = try! doc.document.data(as: msgModel.self)
                    
                    DispatchQueue.main.async {
                        self.msgs.append(msg)
                    }
                }
            }
        }
    }
    
    func writeMsg() {
        
        let msg = msgModel(msg: txt, user: user, timeStamp: Date())
        
        let _ = try! ref.collection("Msgs").addDocument(from: msg) { (err) in
            
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            
            self.txt = ""
        }
    }
    
}
