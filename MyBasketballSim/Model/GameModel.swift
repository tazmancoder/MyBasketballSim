//
//  GameModel.swift
//  MyBasketballSim
//
//  Created by Mark Perryman on 6/27/24.
//

import Foundation
import ActivityKit
import Observation

@Observable
class GameModel: GameSimulatorDelegate {
	
	var gameState = GameState(homeScore: 0,
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
		let activityContent = ActivityContent(state: currentGameState, staleDate: nil)
		
		do {
			liveActivity = try Activity.request(attributes: attributes, content: activityContent)
		} catch {
			print("ERROR: \(error.localizedDescription)")
		}
	}
	
	func didUpdate(gameState: GameState) {
		self.gameState = gameState
		let currentGameState = MyGameAttributes.ContentState(gameState: gameState)
		let activityContent = ActivityContent(state: currentGameState, staleDate: nil)

		Task {
			await liveActivity?.update(activityContent)
		}
	}
	
	func didCompleteGame() {
		Task {
			let finalContent = MyGameAttributes.ContentState(gameState: simulator.endGame())
			await liveActivity?.end(ActivityContent(state: finalContent, staleDate: nil), dismissalPolicy: .default)
		}
	}
	
	
	// Live Activity code goes here
}



