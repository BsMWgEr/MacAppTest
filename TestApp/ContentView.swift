//
//  ContentView.swift
//  TestApp
//
//  Created by q on 1/20/22.
//

import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
}

struct ContentView: View {
    let options: [Option] = [
        .init(title: "Home", imageName: "House"),
        .init(title: "Home", imageName: "House"),
        .init(title: "Home", imageName: "House"),
        .init(title: "Home", imageName: "House"),
    ]
    
    var body: some View {
        NavigationView {
            ListView(options: options)
            
            MainView()
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}


struct MainView: View {
    var body: some View {
        Text("List")
    }
}

struct ListView: View {
    let options: [Option]
    
    var body: some View {
        VStack {
            ForEach(options, id: \.self) {
                option in HStack {
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    
                    Text(option.title)
                    
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
    }
}


struct ContentView_Previews:PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
