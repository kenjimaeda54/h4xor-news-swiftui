//
//  NewsManager.swift
//  H4XOR News
//
//  Created by kenjimaeda on 28/11/22.
//
import Foundation


//Desing Patern Observable esta disponivel apenas em classes
class NewsManager: ObservableObject {
	
	@Published var news = [Hits]()
	
	func fectchData() {
		if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
			let session = URLSession(configuration: .default)
			let task = session.dataTask(with: url) { data, response, error in
				if error == nil {
					do {
						
						if let safeData = data {
							let news = try JSONDecoder().decode(NewsModel.self, from: safeData)
							
							DispatchQueue.main.async {
								self.news = news.hits
							}
							
						}
						
					}catch{
						print(error)
					}
					
				}
				
			}
			task.resume()
			
		}
		
	}
	
	
}
