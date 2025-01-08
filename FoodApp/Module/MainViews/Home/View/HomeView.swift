import SwiftUI

struct HomeView: View {
    
    @State private var showDropdown = false
    @State private var selectedLocation = AppStrings.location.currentLocation
    @State private var searchQuery = ""
    
    let locations = [AppStrings.location.currentLocation, AppStrings.location.home, AppStrings.location.work, AppStrings.location.other]
    
    @StateObject private var viewModel = HomeViewModel()
    
    
    var body: some View {
        VStack {
            CustomHeaderView(
                showBackArrow: false,
                greetingText: AppStrings.title.homeTitle,
                onBackTapped: {
                    print("Back tapped")
                }
            )
            VStack(alignment: .leading){
                Text(AppStrings.deliveringTo)
                    .textStyle(size: 11, color: Color(UIColor.appPlaceholderColor),
                               fontStyle: .interSemibold)
                
                // Dropdown Menu
                Menu {
                    // Dropdown options
                    ForEach(locations, id: \.self) { location in
                        Button(action: {
                            selectedLocation = location
                        }) {
                            Text(location)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedLocation)
                            .textStyle(size: 16, color: Color(UIColor.appSecondaryFontColor),
                                       fontStyle: .interSemibold)
                        
                        Image(Icons.dropDown.rawValue)
                            .rotationEffect(.degrees(0)) // No need for rotation animation here
                            .padding(.leading, 10)
                    }
                }
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            SearchBar(searchQuery: $searchQuery, placeholder:  AppStrings.searchFood)
                .padding(.top, 35)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Top Categories
                    topCategoriesSection
                    
                    // Popular Restaurants Section
                    sectionHeader(title: AppStrings.popularRestaurants, showViewAll: true)
                    popularRestaurantsSection
                    
                    // Most Popular Section
                    sectionHeader(title: AppStrings.mostPopular, showViewAll: true)
                    mostPopularSection
                    
                    // Recent Items Section
                    sectionHeader(title: AppStrings.recentItems, showViewAll: true)
                    recentItemsSection
                }
                
            }
            
            
        }
        
        Spacer()
    }
    
    // MARK: - Top Categories Section
    private var topCategoriesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 18) {
                ForEach(viewModel.categories) { category in
                    VStack {
                        Image(category.imageName)
                            .resizable()
                            .frame(width: 88, height: 88)
                        
                        
                        Text(category.title)
                            .textStyle(size: 14, color: Color(UIColor.appDarkGeryColor), fontStyle: .interSemibold)
                    }
                }
            }.padding(.top, 30)
                .padding(.horizontal, 21)
        }
    }
    
    // MARK: - Popular Restaurants Section
    private var popularRestaurantsSection: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.popularRestaurants) { restaurant in
                VStack {
                    Image(restaurant.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 193)
                        .clipped()
                        
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(restaurant.name)
                            .textStyle(size: 16, color: Color(UIColor.appDarkGeryColor),
                                       fontStyle: .interSemibold)
                        
                        HStack {
                            Image(Icons.star.rawValue)
                                .frame(width: 13, height: 14)
                            
                            Text(restaurant.rating)
                                .textStyle(size: 11, color: Color(UIColor.appOrangeColor),
                                           fontStyle: .interSemibold)
                            Text(restaurant.category)
                                .textStyle(size: 12, color: Color(UIColor.appPlaceholderColor),
                                           fontStyle: .interSemibold)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 21)
                        .padding(.top, 5)
                }
            }.padding(.top, 31)
        }
    }
    
    // MARK: - Most Popular Section
    private var mostPopularSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.mostPopularRestaurants) { restaurant in
                    VStack(alignment: .leading) {
                        Image(restaurant.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 228, height: 135)
                            .cornerRadius(10)
                        
                        Text(restaurant.name)
                            .textStyle(size: 18, color: Color(UIColor.appDarkGeryColor),
                                       fontStyle: .interSemibold)
                        
                        HStack {
                            Text(restaurant.category)
                                .textStyle(size: 12, color: Color(UIColor.appPlaceholderColor),
                                           fontStyle: .interSemibold)
                            Image(Icons.star.rawValue)
                                .frame(width: 10, height: 10)
                            Text(restaurant.rating)
                                .textStyle(size: 11, color: Color(UIColor.appOrangeColor),
                                           fontStyle: .interSemibold)
                            
                        }
                    }
                }
            }.padding(.horizontal, 21)
        }
    }
    
    // MARK: - Recent Items Section
    private var recentItemsSection: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.recentItems) { restaurant in
                HStack {
                    Image(restaurant.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(restaurant.name)
                            .textStyle(size: 18, color: Color(UIColor.appDarkGeryColor),
                                       fontStyle: .interSemibold)
                        Text(restaurant.category)
                            .textStyle(size: 12, color: Color(UIColor.appPlaceholderColor),
                                       fontStyle: .interSemibold)
                        
                        HStack{
                            Image(Icons.star.rawValue)
                                .frame(width: 10, height: 10)
                            Text(restaurant.rating)
                                .textStyle(size: 11, color: Color(UIColor.appOrangeColor),
                                           fontStyle: .interSemibold)
                            
                            Text(restaurant.ratingNumber)
                                .textStyle(size: 11, color: Color(UIColor.appPlaceholderColor),
                                           fontStyle: .interSemibold)
                        }
                    }.padding(.leading, 22)
                    Spacer()
                }
            }
        }.padding(.horizontal, 21)
    }
    
    // MARK: - Section Header
    private func sectionHeader(title: String, showViewAll: Bool) -> some View {
        HStack {
            Text(title)
                .textStyle(size: 20, color: Color(UIColor.appDarkGeryColor),
                           fontStyle: .interSemibold)
            
            Spacer()
            
            if showViewAll {
                Button(action: {
                    print("\(title) View All tapped")
                }) {
                    Text("View all")
                        .textStyle(size: 13, color: Color(UIColor.appOrangeColor),
                                   fontStyle: .interSemibold)
                }
            }
        }
        .padding(.top)
        .padding(.horizontal,17)
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    HomeView()
}
