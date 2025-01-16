import SwiftUI


struct MenuDetails: View {
    
    // MARK: - ViewModel
    /// The view model that manages the data and state of the menu details.
    @StateObject private var viewModel = MenuDetailsViewModel()
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                // MARK: - Top Section (Header Image and Buttons)
                ZStack(alignment: .top)  {
                    // Menu Detail Image (background)
                    Image(MenuDetailImages.menudetail.rawValue)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width,
                               height: geometry.size.height / 2)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(maxWidth: .infinity, maxHeight: 160)
                            .alignmentGuide(.top) { _ in 0 },
                            alignment: .top
                        )
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            // Back Button
                            Button(action: {
                                viewModel.onNavigateToBack()
                            }) {
                                Image(Icons.whiteBack.rawValue)
                                    .scaledToFit()
                            }
                            Spacer()
                            // Cart Button
                            Button(action: {
                            }) {
                                Image(Icons.whiteCart.rawValue)
                                    .scaledToFit()
                            }
                        }
                        .padding(.horizontal)
                        .appTopPadding(50)
                    }
                }
                // MARK: - Menu Content Section
                VStack(alignment: .leading){
                    
                    ScrollView{
                        VStack(alignment: .leading){
                            // Menu Title
                            Text(AppStrings.menuDetails.menuTitle)
                                .textStyle(size: 22, color: Color(UIColor.appDarkGeryColor),
                                           fontStyle: .interSemibold)
                            // Star Rating
                            HStack {
                                ForEach(0..<4) { _ in
                                    Image(Icons.star.rawValue)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15,height: 14)
                                }
                                Image(Icons.borderStar.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15,height: 14)
                            }.padding(.bottom, 5)
                            
                            // Star Rating Label
                            Text(AppStrings.menuDetails.starRatings)
                                .textStyle(size: 11, color: Color(UIColor.appOrangeColor),
                                           fontStyle: .interSemibold)
                            // Price and Portion Label
                            HStack {
                                Spacer()
                                VStack {
                                    Text(AppStrings.menuDetails.menuRs)
                                        .textStyle(size: 31, color: Color(UIColor.appDarkGeryColor),
                                                   fontStyle: .interSemibold)
                                    Text(AppStrings.menuDetails.perPortion)
                                        .textStyle(size: 12, color: Color(UIColor.appDarkGeryColor),
                                                   fontStyle: .interSemibold)
                                        .padding(.leading,25)
                                        .padding(.bottom,10)
                                    
                                }.padding(.trailing, 0)
                            }
                            .padding(.top,-50)
                            
                            // Description and Additional Details
                            VStack(alignment: .leading) {
                                Text(AppStrings.menuDetails.description)
                                    .textStyle(size: 14, color: Color(UIColor.appDarkGeryColor),
                                               fontStyle: .interSemibold)
                                    .padding(.bottom,10)
                                Text(AppStrings.menuDetails.dummyDescription)
                                    .multilineTextAlignment(.leading)
                                    .textStyle(size: 12, color: Color(UIColor.appPlaceholderColor),
                                               fontStyle: .interSemibold)
                                    .lineSpacing(4)
                                    .padding(.bottom,20)
                                   
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            Divider()
                            //MARK: - Customize your Order
                            
                            Text(AppStrings.menuDetails.customizeYourOrder)
                                .textStyle(size: 14, color: Color(UIColor.appDarkGeryColor),
                                           fontStyle: .interSemibold)
                                .appTopPadding(15)
                            
                            VStack(spacing: 20) {
                                // Dropdown for size selection
                                DropdownMenu(
                                    options: viewModel.sizeOptions,
                                    selectedOption: $viewModel.selectedSize,
                                    spacer: true,
                                    textColor : Color(UIColor.appDarkGeryColor),
                                    iconColor:Color(UIColor.appGrayColor)
                                )
                                .padding()
                                .background(Color(UIColor.appLightGrayColor))
                                .cornerRadius(4)
                                
                                // Dropdown for ingredient selection
                                DropdownMenu(
                                    options: viewModel.ingredientOptions,
                                    selectedOption: $viewModel.selectedIngredient,
                                    spacer: true,
                                    textColor : Color(UIColor.appDarkGeryColor),
                                    iconColor:Color(UIColor.appGrayColor)
                                )
                                .padding()
                                .background(Color(UIColor.appLightGrayColor))
                                .cornerRadius(4)
                                
                                // MARK: - Portion Count Controls

                                HStack{
                                    Text(AppStrings.menuDetails.numberofPortions)
                                        .textStyle(size: 14, color: Color(UIColor.appDarkGeryColor),
                                                   fontStyle: .interBold)
                                    Spacer()
                                    
                                    // Decrease Portion Count Button
                                    Button(action: {
                                        if viewModel.portionCount > 1 { viewModel.portionCount -= 1 } // Ensure portionCount doesn't go below 1
                                    }) {
                                        
                                        Text("-")
                                            .font(.title2)
                                            .frame(width: 52, height: 30)
                                            .background(Color(UIColor.appOrangeColor))
                                            .foregroundColor(.white)
                                            .clipShape(Capsule())
                                            .shadow(color: .gray.opacity(0.4), radius: 4, x: 2, y: 2)
                                    }
                                    
                                    // Portion Count Display
                                    Text("\(viewModel.portionCount)")
                                        .textStyle(size: 14, color: Color(UIColor.appOrangeColor),
                                                   fontStyle: .interSemibold)
                                        .frame(width: 52, height: 30)
                                        .background(Color(UIColor.appWhiteColor))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color(UIColor.appOrangeColor), lineWidth: 1)
                                        )
                                    
                                    // Increase Portion Count Button
                                    Button(action: {
                                        viewModel.portionCount += 1 // Increment portion count
                                    }) {
                                        Text("+")
                                            .font(.title2)
                                            .frame(width: 52, height: 30)
                                            .background(Color(UIColor.appOrangeColor))
                                            .foregroundColor(.white)
                                            .clipShape(Capsule())
                                            .shadow(color: .gray.opacity(0.4), radius: 4, x: 2, y: 2)
                                    }
                                }.appTopPadding(24)
                                Spacer()
                            }.appTopPadding(21)
                        }.padding([.leading, .trailing], 22)
                            .appTopPadding(31)
                        
                        // MARK: - Footer Section with Total Price and Cart Button
                        ZStack (alignment: .leading){
                            /// Background image for the side of the cell
                            Image(MenuDetailImages.menuRectangle.rawValue)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: 97,maxHeight: 171)
                                .padding(.bottom,22)
                            
                            ZStack {
                                // Background image for the menu item cell
                                Image(MenuDetailImages.menuWhiteRectangle.rawValue)
                                    .resizable()
                                    .aspectRatio(6/3, contentMode: .fill)
                                    .frame(maxWidth: .infinity, maxHeight: 122)
                                    .padding(.leading,50)
                                    .padding(.trailing,44)
                                HStack {
                                    HStack {
                                        Spacer()
                                        VStack(alignment: .center,spacing: 5) {
                                            ///for total price
                                            Text(AppStrings.menuDetails.totalPrice)
                                                .textStyle(size: 12,
                                                           color: Color(UIColor.appDarkGeryColor),
                                                           fontStyle: .interRegular)
                                            
                                            
                                            ///Display the total pric
                                            Text(AppStrings.menuDetails.lKR1500)
                                                .textStyle(size: 21,
                                                           color: Color(UIColor.appDarkGeryColor),
                                                           fontStyle: .interRegular)
                                            
                                            /// "Add to Cart" button
                                            Button(action: {}) {
                                                Text(AppStrings.menuDetails.addToCart)
                                                    .textStyle(size: 11,
                                                               color: Color(UIColor.appWhiteColor),
                                                               fontStyle: .interRegular)
                                                    .padding()
                                                    .foregroundColor(Color.white)
                                                    .frame(height: 15)
                                                    .background(Color(UIColor.appOrangeColor))
                                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                            }
                                            .padding(.leading, -50)
                                            
                                        }
                                        .padding()
                                        Spacer()
                                    }
                                    
                                    // Button to trigger the action, shown as an arrow on the right side of the cell
                                    Button(action: {}) {
                                        Image(MenuDetailImages.menuCart.rawValue)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 47,height: 47)
                                    }
                                    .padding(.trailing, 21)
                                }
                            }
                        }
                        
                    }.frame(width: geometry.size.width, alignment: .leading)
                        .background(Color(UIColor.appWhiteColor))
                        .cornerRadius(42)
                        .padding(.top, -90)
                }
                
                
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MenuDetails()
}
