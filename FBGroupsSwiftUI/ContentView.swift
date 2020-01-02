//
//  ContentView.swift
//  FBGroupsSwiftUI
//
//  Created by Joel Júnior on 02/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import SwiftUI

struct Post {
    let id: Int
    let username, text, imageName, postImageName: String
}

struct Group {
    let id: Int
    let name, imageName: String
}

struct ContentView: View {
    
    let groups: [Group] = [
        .init(id: 0, name: "Electronic", imageName: "electronic"),
        .init(id: 1, name: "Heavy Metal", imageName: "metal"),
        .init(id: 2, name: "Gospel", imageName: "gospel"),
        .init(id: 3, name: "Singer-songwriter", imageName: "singer"),
        .init(id: 4, name: "Rap", imageName: "rap")
    ]
    
    let posts: [Post] = [
        .init(id: 0, username: "Thom Yorke", text: "Just as you take my hand, just as you write my number down, just as the drinks arive, just as they play your favourite song", imageName: "thom", postImageName: "radiohead"),
        .init(id: 1, username: "Chris Martin", text: "Birds go flying at the speed of sound, to show how it all began", imageName: "chris_martin", postImageName: "coldplay"),
        .init(id: 2, username: "Justin Vernon", text: "DOWN ALONG THE CREEK I REMEMBER SOMETHING HER THE HERON HURRIED AWAY WHEN FIRST I BREACHED THAT LAST SUNDAY", imageName: "justin", postImageName: "bon_iver")]
    
    var body: some View {
        NavigationView {
            List {
                VStack (alignment: .leading) {
                    Text("Trending").font(.headline)
                    ScrollView (.horizontal) {
                        HStack {
                            // group rows
                            ForEach(groups, id: \.id) { group in
                                GroupView(group: group)
                            }
                        }
                    }.frame(height: 150)
                }.padding(4)
                
                // post rows
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }.navigationBarTitle(Text("Groups"))
        }
    }
}

struct PostView: View {
    var post: Post
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Image(post.imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .clipped()
                VStack (alignment: .leading, spacing: 4) {
                    Text(post.username).font(.headline)
                    Text("Posted 8 hrs ago").font(.subheadline)
                }.padding(.leading, 8)
            }.padding(.leading, 16).padding(.top, 16)
            Text(post.text)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)
            
            Image(post.postImageName).resizable()
                .scaledToFill()
                .clipped()
                .padding(0)
            
        }.listRowInsets(EdgeInsets())
        
    }
}

struct GroupView: View {
    
    var group: Group
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(group.imageName)
                .resizable()
                .scaledToFill()
                .cornerRadius(5)
                .frame(width: 100, height: 100)
                .clipped()
            Text(group.name)
                .lineLimit(nil)
                .padding(0)
        }.frame(width: 110, height: 180).padding(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
