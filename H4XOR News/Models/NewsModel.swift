//
//  NewsModel.swift
//  H4XOR News
//
//  Created by kenjimaeda on 28/11/22.
//

import Foundation

struct NewsModel: Codable {
	let hits: [Hits]
	
}

struct Hits: Codable,Identifiable {
	var id: String {
		return objectID;
	}
	
	let title: String;
	let url: String?;
	let points: Int;
	let objectID: String
	
}
