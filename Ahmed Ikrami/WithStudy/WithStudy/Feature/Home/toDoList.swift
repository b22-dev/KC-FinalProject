
import SwiftUI

struct toDoList: View {
    var body: some View {
        Soon()
            .navigationBarHidden(true)
    }
}

struct toDoList_Previews: PreviewProvider {
    static var previews: some View {
        toDoList()
            .preferredColorScheme(.light)
    }
}
