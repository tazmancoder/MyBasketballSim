//
//  MyGameLiveActivity.swift
//  MyGameWidget
//
//  Created by Mark Perryman on 6/28/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyGameLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyGameAttributes.self) { context in
            // Lock screen/banner UI goes here
			LiveActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
					HStack {
						Image(context.attributes.homeTeam)
							.teamLogoModifier(frame: 40)
						
						Text("\(context.state.gameState.homeScore)")
							.font(.title)
							.fontWeight(.semibold)
							.contentTransition(.numericText())
					}
                }
                DynamicIslandExpandedRegion(.trailing) {
					HStack {
						Text("\(context.state.gameState.awayScore)")
							.font(.title)
							.fontWeight(.semibold)
							.contentTransition(.numericText())

						Image(context.attributes.awayTeam)
							.teamLogoModifier(frame: 40)
					}
                }
                DynamicIslandExpandedRegion(.bottom) {
					HStack {
						Image(context.state.gameState.scoringTeamName)
							.teamLogoModifier(frame: 20)
						Text("\(context.state.gameState.lastAction)")
					}
                }
//				DynamicIslandExpandedRegion(.center) {
//					Text("5:24 3Q.")
//					// more content
//				}
            } compactLeading: {
				HStack {
					Image(context.attributes.homeTeam)
						.teamLogoModifier()
					
					Text("\(context.state.gameState.homeScore)")
						.fontWeight(.semibold)
						.contentTransition(.numericText())
				}
            } compactTrailing: {
				HStack {
					Text("\(context.state.gameState.awayScore)")
						.fontWeight(.semibold)
						.contentTransition(.numericText())

					Image(context.attributes.awayTeam)
						.teamLogoModifier()
				}
            } minimal: {
				Image(context.state.gameState.winningTeamName)
					.teamLogoModifier()
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MyGameAttributes {
    fileprivate static var preview: MyGameAttributes {
		MyGameAttributes(homeTeam: "warriors", awayTeam: "bulls")
    }
}

extension MyGameAttributes.ContentState {
    fileprivate static var smiley: MyGameAttributes.ContentState {
        MyGameAttributes.ContentState(gameState: GameState(homeScore: 12, awayScore: 12, scoringTeamName: "My Team", lastAction: "My Team Scored"))
     }
     
     fileprivate static var starEyes: MyGameAttributes.ContentState {
         MyGameAttributes.ContentState(gameState: GameState(homeScore: 12, awayScore: 12, scoringTeamName: "My Team", lastAction: "My Team Scored"))
     }
}

#Preview("Notification", as: .content, using: MyGameAttributes.preview) {
   MyGameLiveActivity()
} contentStates: {
	MyGameAttributes.ContentState(gameState: GameState(homeScore: 34, awayScore: 44, scoringTeamName: "bulls", lastAction: "Made a 3 pointer"))
}
