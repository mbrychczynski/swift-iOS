//
//  UserView.swift
//  Friendface
//
//  Created by Mateusz Brychczynski on 04/05/2023.
//

import SwiftUI

struct UserView: View {
    let user: CachedUser
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image(systemName: "person.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.gray, .gray)
                            .font(.system(size: 100))
                            .imageScale(.large)
                            .fontWeight(.bold)
                        VStack(alignment: .center) {
                            Text(user.wrappedName)
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Age: \(user.age)")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
                        
                    VStack {
                        Text("Registered: \(user.wrappedRegistered.formatted(date: .abbreviated, time: .omitted))")
                        HStack {
                            Circle()
                                .fill(user.isActive ? .green : .red)
                                .frame(width: 20)
                            if user.isActive {
                                Text("Online")
                            } else {
                                Text("Offline")
                            }
                        }
                    }
                        .frame(maxWidth: .infinity)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                Section {
                    Label("\(user.wrappedAddress)", systemImage: "house")
                    Label("\(user.wrappedCompany)", systemImage: "building")
                    Label("\(user.wrappedEmail)", systemImage: "at")
                } header: {
                    Text("Contact details")
                }
                .listRowSeparator(.hidden)
                
                
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(user.friendsArray) { friend in
                                Label(friend.wrappedName, systemImage: "person.circle")
                                    .padding(3)
                                    .padding(.horizontal, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .strokeBorder(.gray, lineWidth: 1)
                                    )
                            }
                        }
                    }
                    
                } header: {
                    Text("Friends")
                }
                .listRowSeparator(.hidden)
                
                Section {
                    Text(user.wrappedAbout)
                        .padding(.vertical)
                } header: {
                    Text("About")
                }
                
                Section {
                    NavigationLink {
                        TagView(user: user)
                    } label: {
                        Label("\(user.wrappedTags.count) \(user.wrappedTags.count > 1 ? "tags" : "tag")", systemImage: "tag")
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView(user: User.example)
//    }
//}
