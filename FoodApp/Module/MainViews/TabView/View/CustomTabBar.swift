import SwiftUI

struct CustomTabBar: View {
    @ObservedObject var viewModel: TabBarViewModel

    var body: some View {
        HStack {
            ForEach(viewModel.tabs) { tabItem in
                VStack {
                    Image(tabItem.iconName)
                        .renderingMode(.template)
                        .font(.system(size: 14))
                        .foregroundColor(viewModel.selectedTab == tabItem.tab ? Color(UIColor.appOrangeColor) : Color(UIColor.appPlaceholderColor))
                    Text(tabItem.title)
                        .font(.caption)
                        .foregroundColor(viewModel.selectedTab == tabItem.tab ? Color(UIColor.appOrangeColor) : Color(UIColor.appPlaceholderColor))
                }
                .padding()
                .onTapGesture {
                    withAnimation {
                        viewModel.selectedTab = tabItem.tab
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 92)
        .background(Color.white.shadow(radius: 5))
    }
}
