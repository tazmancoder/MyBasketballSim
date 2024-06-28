//
//  GameState.swift
//  MyBasketballSim
//
//  Created by Mark Perryman on 6/27/24.
//

import Foundation

struct GameState: Codable, Hashable {
	let homeScore: Int
	let awayScore: Int
	let scoringTeamName: String
	let lastAction: String
	
	var winningTeamName: String {
		homeScore > awayScore ? "warriors" : "bulls"
	}
}
