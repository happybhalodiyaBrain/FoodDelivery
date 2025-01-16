import SwiftUI

/// The main view of the home screen that displays categories, popular restaurants, and recent items.
struct HomeView: View {
    
    // MARK: - State Properties
    
    /// Flag to control the visibility of the dropdown menu.
    @State private var showDropdown = false
    
    /// The currently selected location for delivery.
    @State private var selectedLocation = AppStrings.location.currentLocation
    
    /// The search query entered by the user.
    @State private var searchQuery = ""
    
    // MARK: - ViewModel
    
    /// The ViewModel that provides data for the home view.
    @StateObject private var viewModel = HomeViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // MARK: - Header
            CustomHeaderView(
                showBackArrow: false,
                greetingText: AppStrings.title.homeTitle,
                onBackTapped: {
                }
            )
            
            // MARK: - Location Dropdown
            VStack(alignment: .leading) {
                Text(AppStrings.deliveringTo)
                    .textStyle(size: 11, color: Color(UIColor.appPlaceholderColor), fontStyle: .interSemibold)
                
                // Dropdown menu to select a location
                DropdownMenu(
                    options: viewModel.locations,
                    selectedOption: $selectedLocation,
                    spacer: false,
                    textColor : Color(UIColor.appSecondaryFontColor),
                    iconColor:Color(UIColor.appOrangeColor)
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            
            // MARK: - Search Bar
            SearchBar(searchQuery: $searchQuery, placeholder:  AppStrings.searchFood)
                .padding(.top, 35)
            
            // MARK: - Scrollable Sections
            ScrollView {
                VStack(alignment: .leading) {
                    // Top Categories Section
                    TopCategoriesSection(categories: viewModel.categories)
                    
                    // Popular Restaurants Section
                    SectionWithHeader(
                        title: AppStrings.popularRestaurants,
                        showViewAll: true
                    ) {
                        PopularRestaurantsSection(popularRestaurants: viewModel.popularRestaurants)
                    }
                    
                    // Most Popular Section
                    SectionWithHeader(
                        title: AppStrings.mostPopular,
                        showViewAll: true
                    ) {
                        MostPopularSection(mostPopularSection: viewModel.mostPopularRestaurants)
                    }
                    
                    // Recent Items Section
                    SectionWithHeader(
                        title: AppStrings.recentItems,
                        showViewAll: true
                    ) {
                        RecentItemsSection(recentItemsSection: viewModel.recentItems)
                    }
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
