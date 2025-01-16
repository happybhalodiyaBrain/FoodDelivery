import SwiftUI

/// A view displaying offers and popular restaurants.
struct OffersView: View {
    
    // MARK: - Properties
    /// The view model for managing the offers and restaurant data
    @StateObject private var viewModel = OffersViewModel()
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            VStack{
                // MARK: - Header Section
                CustomHeaderView(
                    showBackArrow: false,
                    greetingText: AppStrings.title.offersTitle,
                    onBackTapped: {
                    }
                )
                // MARK: - Offers Note Section
                VStack(alignment: .leading){
                    Text(AppStrings.offersNote)
                        .textStyle(size: 14, color: Color(UIColor.appPlaceholderColor),
                                   fontStyle: .interSemibold)
                    
                    Button(action: {
                        // Action for the button
                        print("Check Offers button tapped")
                    }) {
                        Text(AppStrings.buttons.checkOffers)
                            .textStyle(size: 11, color: Color(UIColor.appWhiteColor),
                                       fontStyle: .interSemibold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color(UIColor.appOrangeColor))
                            .clipShape(Capsule())
                    }.appTopPadding(24)
                }.appHorizontalPadding(21)
                    .frame(width: geometry.size.width,
                           alignment: .leading)
                
                // MARK: - Popular Restaurants Section
                ScrollView{
                    PopularRestaurantsSection(popularRestaurants: viewModel.restaurants)
                }.appTopPadding(36)
                
                Spacer()
            }
        }
    }
}

#Preview {
    OffersView()
}
