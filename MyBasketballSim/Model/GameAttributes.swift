//
//  GameAttributes.swift
//  MyBasketballSim
//
//  Created by Mark Perryman on 6/28/24.
//

import Foundation
import ActivityKit

struct MyGameAttributes: ActivityAttributes {
	public struct ContentState: Codable, Hashable {
		// Dynamic stateful properties about your activity go here!
		var gameState: GameState
	}
	
	// Fixed non-changing properties about your activity go here!
	var homeTeam: String
	var awayTeam: String
}
