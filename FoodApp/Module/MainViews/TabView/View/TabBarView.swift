import SwiftUI

struct TabBarView: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
           VStack(spacing: 0) {
               // Display the content based on the selected tab
               TabView(selection: $viewModel.selectedTab) {
                   MenuView()
                       .tag(Tab.menu)
                   OffersView()
                       .tag(Tab.offers)
                   HomeView()
                       .tag(Tab.home)
                   ProfileView()
                       .tag(Tab.profile)
                   MoreView()
                       .tag(Tab.more)
               }
               .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hides the default tab bar

               // Custom Tab Bar
               CustomTabBar(viewModel: viewModel)
           }.ignoresSafeArea(edges: .bottom)
       }
}

#Preview {
    TabBarView()
}

