//
//  GameModel.swift
//  MyBasketballSim
//
//  Created by Mark Perryman on 6/27/24.
//

import Foundation
import ActivityKit

final class GameModel: ObservableObject, GameSimulatorDelegate {
	
	@Published var gameState = GameState(homeScore: 0,
										 awayScore: 0,
										 scoringTeamName: "",
										 lastAction: "")
	
	var liveActivity: Activity<MyGameAttributes>? = nil
	let simulator = GameSimulator()
	
	init() {
		simulator.delegate = self
	}
	
	func startLiveActivity() {
		let attributes = MyGameAttributes(homeTeam: "warriors", awayTeam: "bulls")
		let currentGameState = MyGameAttributes.ContentState(gameState: gameState)
		
		do {
			liveActivity = try Activity.request(attributes: attributes, contentState: currentGameState)
		} catch {
			print("ERROR: \(error.localizedDescription)")
		}
	}
	
	func didUpdate(gameState: GameState) {
		self.gameState = gameState
		
		Task {
			await liveActivity?.update(using: .init(gameState: gameState))
		}
	}
	
	func didCompleteGame() {
		Task {
			await liveActivity?.end(using: .init(gameState: simulator.endGame()))
		}
	}
	
	
	// Live Activity code goes here
}



