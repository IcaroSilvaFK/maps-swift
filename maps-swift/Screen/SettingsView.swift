//
//  SettingsView.swift
//  maps-swift
//
//  Created by Icaro on 20/08/23.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    
    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor' Choice")
                            .fontWeight(.medium)
                        
                    }
                    
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGrayLight, .customGreenMedium,.customGreenDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even btter once you are actually there. The hike that you hope to do again someday, \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            // MARK: - SECTION: ICONS
            Section(
                header: Text("Alternate Icons")
            ){
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack{
                        ForEach(alternateAppIcons, id: \.self) {image in
                            
                            Button {
                                print("Alternate icon \(image)")
                                UIApplication.shared.setAlternateIconName(image) {error in
                                    if let err = error {
                                        print("Error in change icon", err)
                                    }else {
                                        print("not error in change icon")
                                    }
                                }
                            }label: {
                                Image("\(image)-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                            
                        }
                        
                    }
                }
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
                .listRowSeparator(.hidden)
            
            //MARK: - SECTION: ABOUT
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    
                    Text("Copyright © All right reserved.")
                    Spacer()
                        
                }.padding(.vertical, 8)
            ) {
                // 1. Basic labeled content
//                LabeledContent("Application", value: "Hike")
                // 2. Advanced labeled content
                CustomListRowView(
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowTintColor: .blue,
                    rowContent: "HIKE"
                )
                CustomListRowView(
                    rowLabel: "Compatibility",
                    rowIcon: "info.circle",
                    rowTintColor: .red,
                    rowContent: "iOS, iPadOS"
                )
                CustomListRowView(
                    rowLabel: "Technology",
                    rowIcon: "swift",
                    rowTintColor: .orange,
                    rowContent: "Swift"
                )
                CustomListRowView(
                    rowLabel: "Version",
                    rowIcon: "gear",
                    rowTintColor: .purple,
                    rowContent: "1.0"
                )
                CustomListRowView(
                    rowLabel: "Developer",
                    rowIcon: "ellipsis.curlybraces",
                    rowTintColor: .mint,
                    rowContent: "Icaro Vieira"
                )
                CustomListRowView(
                    rowLabel: "Desginer",
                    rowIcon: "paintpalette",
                    rowTintColor: .pink,
                    rowContent: "Robert Petras"
                )
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowContent:nil, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
                
            }// Section
           
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
