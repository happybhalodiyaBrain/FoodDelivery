import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home

    let tabs: [TabItem] = [
        TabItem(title: "Menu", iconName: TabIcon.menu.rawValue, tab: .menu),
        TabItem(title: "Offers", iconName: TabIcon.offers.rawValue, tab: .offers),
        TabItem(title: "Home", iconName: TabIcon.home.rawValue, tab: .home),
        TabItem(title: "Profile", iconName: TabIcon.profile.rawValue, tab: .profile),
        TabItem(title: "More", iconName: TabIcon.more.rawValue, tab: .more)
    ]
}
