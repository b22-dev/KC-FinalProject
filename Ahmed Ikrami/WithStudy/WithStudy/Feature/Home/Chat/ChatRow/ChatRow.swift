
import SwiftUI

struct ChatRow : View {
    var chatData : msgModel
    @AppStorage("current_user") var user = ""
    
    var body: some View {
        
        HStack(spacing: 15) {
            // msg
            if chatData.user != user{
                
                NickName(icon: Image("user"), name: chatData.user)
            }
            // msg
            if chatData.user == user{Spacer()}
            
            VStack(alignment: chatData.user == user ? .trailing : .leading, spacing: 5, content: {
                
                Text(chatData.msg)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background((chatData.user == user ? Color("teal") : Color.gray).opacity(0.6))
                //custom shape
                    .clipShape(ChatBubble(MyMsg: chatData.user == user))
                
                Text(chatData.timeStamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(chatData.user != user ? .leading : .trailing , 5)
            })
            if chatData.user != user{
                Spacer()
            }
            
            HStack(spacing: 15) {
                
                if chatData.user == user{
                    
                    NickName(icon: Image(systemName: "person.fill"), name: chatData.user)
                }
                
                if chatData.user == user{}
        }
            .padding(.horizontal)
            
            .id(chatData.id)
        }
    }
}
struct NickName : View {
    var icon : Image
    var name : String
    @AppStorage("current_user") var user = ""
    
    var body: some View {
        
        Image(systemName: "person.fill")
            .font(.system(size: 25))
            .frame(width: 50, height: 50)
            .background((name == user ? Color("teal") : Color.gray).opacity(0.5))
            .clipShape(Circle())
            .contentShape(Circle())
            .contextMenu{
                
                Text(name)
                    .fontWeight(.bold)
            }
    }
}
