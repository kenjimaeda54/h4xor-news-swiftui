# HackerNews 
Pequena aplicação com requisição em swifui, consumindo api [hacker news](https://github.com/kenjimaeda54/h4xor-news-swiftui.git)



## Feature
- Para lidar com requisições e gerenciamentos de estados em swifui usamos principio Observer
- Protoclos  não  são recomendados em swifui para este caso de uso
- Observer e implmenetnado apenas em classes, a variável que você deseja ser oberservada adiciona Published e a classe criada e  ObservableObject
- Repara que a variável observada esta com Published
- Outro fator interessante que não usamos mais table view ,mas list, para usarmos este componente precisa  de um id que atenda o protocolo Identifiable

```swift
//NewsManager
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

//quem iplementa
@ObservedObject var newsManager = NewsManager()


List(newsManager.news) { post in
				NavigationLink(destination: NewsDetails(url: post.url)) {
					
					HStack {
						Text(String(post.points))
						Text(post.title)
					}
					
				}
				


```

##
- Navegação entre telas agora ocorre de uma maneira mais próxima dos frameworks híbridos, literalmente instanciamos a classe 
- Repara que o componente navigationLink chama o destion e implementamos como se fosse uma classe comum
- As propriedades passada via construtor são respeitadas também

```swift
	NavigationLink(destination: NewsDetails(url: post.url)) {
					
					HStack {
						Text(String(post.points))
						Text(post.title)
					}

}
```



