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
    @State var currentOption = 0
    let options: [Option] = [
        .init(title: "Home", imageName: "House"),
        .init(title: "About", imageName: "House"),
        .init(title: "Other", imageName: "House"),
        .init(title: "Stuff", imageName: "House"),
    ]
    
    var body: some View {
        NavigationView {
            ListView(
                options: options,
                currentSelection: $currentOption
            )
            
            switch currentOption {
            case 1:
                Text("Hello world")
            default:
                MainView()
                
            }
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}


struct MainView: View {
    let cols: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    let videosImages = Array(1...6).map { "sunflower\($0)" }
    
    var body: some View {
        VStack {
            Image("download")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            LazyVGrid(columns: cols) {
                ForEach(videosImages, id: \.self) { imageName in
                    VStack {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Video Title Goes Here")
                            .bold()
                    }
                }
            }
        }
    }
}

struct ListView: View {
    let options: [Option]
    @Binding var currentSelection: Int
    var body: some View {
        VStack {
            let current = options[currentSelection]
            ForEach(options, id: \.self) { option in
                HStack {
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    
                    Text(option.title)
                        .foregroundColor(current == option ?
                                         Color.blue : Color.white
                        )
                    Spacer()
                }
                .padding()
                .onTapGesture {
                    if currentSelection == 1 {
                        currentSelection = 0
                    } else {
                        self.currentSelection = 1
                    }
                }
                
                
            }
            
        }
    }
}



struct ContentView_Previews:PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
