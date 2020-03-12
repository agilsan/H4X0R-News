//
//  ContentView.swift
//  H4X0R News
//
//  Created by Antonio Gil Sánchez on 11/03/2020.
//  Copyright © 2020 Antonio Gil Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fecthData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
