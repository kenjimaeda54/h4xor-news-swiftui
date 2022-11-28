//
//  ContentView.swift
//  H4XOR News
//
//  Created by kenjimaeda on 26/11/22.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject var newsManager = NewsManager()
	
	var body: some View {
		//aqui não usa o table view
		NavigationStack {
			
			
			List(newsManager.news) { post in
				NavigationLink(destination: NewsDetails(url: post.url)) {
					
					HStack {
						Text(String(post.points))
						Text(post.title)
					}
					
				}
				
				
			}
			//tome cuidade com hearquia
			//isto precisa estar dentro do navigationStack
			.navigationTitle("H4XOR NEWS")
			.toolbarBackground(Color.cyan, for: .navigationBar)
			.toolbarBackground(.visible, for: .navigationBar)
			//remover padding da list
			.listStyle(PlainListStyle())
			
		}
		
		//metodo parecido com didLoad do UIKIT
		.onAppear {
			newsManager.fectchData()
		}
		
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct Posts: Identifiable {
	let id: String
	let title: String
}


let posts = [
	Posts(id: "2", title: "ola mundo"),
	Posts(id: "5", title: "muito doido"),
	Posts(id: "7", title: "louco")
	
]



