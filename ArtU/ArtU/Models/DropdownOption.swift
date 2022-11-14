import SwiftUI

struct DropdownOption: Identifiable, Hashable {
    var id = UUID()
    let key: Int
    let value: String
    let tags: [String]
}
