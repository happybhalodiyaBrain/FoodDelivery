import SwiftUI


struct MenuView: View {
    // MARK: - Properties
    /// ViewModel for managing menu items and navigation
    @StateObject private var viewModel = MenuViewModel()
    /// State for showing a cart alert (if needed)
    @State private var showCartAlert: Bool = false
    /// State for the search query entered by the user
    @State private var searchQuery = ""
    
    // MARK: - Body
    var body: some View {
            VStack {
                // MARK: - Header
                VStack {
                    CustomHeaderView(
                        showBackArrow: false,
                        greetingText: AppStrings.title.menuTitle,
                        onBackTapped: {
                        }
                    )
                }
                // MARK: - Search Bar
                VStack {
                    SearchBar(searchQuery: $searchQuery, placeholder: AppStrings.searchFood)
                        .padding(.top, 25)
                }
                // MARK: - Main Content
                ScrollView {
                    HStack {
                        // Sidebar Image
                        Image(MenuLists.sidebarorange.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 97,maxHeight: .infinity)
                            .padding(.bottom,22)
                            .padding(.top, 30)
                        
                        // Menu Items
                        VStack(spacing: 24) {
                            ForEach(viewModel.menuItems) { item in
                                Button(action: {
                                    viewModel.onNavigateToMenuList(title: item.title)
                                }, label: {
                                    MenuViewCell(menuItem: item){
                                        viewModel.onNavigateToMenuList(title: item.title)
                                    }
                                })
                               
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.leading,-60)
                        .padding(.trailing,36)
                    }
                }
            }
        
    }
    
}
// MARK: - Preview
#Preview {
    MenuView()
}
