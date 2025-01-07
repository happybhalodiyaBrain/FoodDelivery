import Foundation

struct TabItem: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let tab: Tab
}

enum Tab {
    case menu
    case offers
    case home
    case profile
    case more
}
