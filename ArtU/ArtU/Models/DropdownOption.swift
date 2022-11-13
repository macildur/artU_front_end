import SwiftUI

struct DropdownOption: Identifiable, Hashable {
    var id = UUID()
    let key: String
    let value: String
//
//    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
//        return lhs.key == rhs.key
//    }
}
