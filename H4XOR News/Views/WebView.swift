//
//  WebView.swift
//  H4XOR News
//
//  Created by kenjimaeda on 28/11/22.
//

import Foundation
import SwiftUI
import WebKit

//não existe implementacao nativa para web view então estamos criando nossa a partir do Webkit


struct WebView: UIViewRepresentable {
	
	let url: String?
	
	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
		guard let safeUrl = url else {return}
		
		if let url = URL(string: safeUrl) {
			let request = URLRequest(url: url)
			uiView.load(request)
		}
		
	}

}
