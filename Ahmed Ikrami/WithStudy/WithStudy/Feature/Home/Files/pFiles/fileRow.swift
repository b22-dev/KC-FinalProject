
import Foundation
import SwiftUI

struct file: Identifiable {
    let id = UUID()
    let name : String
    let grade : Int
    let icon : Image
}


var eng = file(name: "الانجليزي", grade: 10, icon: Image("wifi"))
var mat = file(name: "الرياضيات", grade: 10, icon: Image("wifi"))


var fil = [eng, mat]
