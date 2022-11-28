//
//  NewsDetails.swift
//  H4XOR News
//
//  Created by kenjimaeda on 28/11/22.
//

import SwiftUI

struct NewsDetails: View {
	  
	let url: String?
	
    var body: some View {
        WebView(url: url)
    }
}

struct NewsDetails_Previews: PreviewProvider {
    static var previews: some View {
			NewsDetails(url:"https://google.com")
    }
}
