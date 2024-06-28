//
//  MyGameLiveActivity.swift
//  MyGameWidget
//
//  Created by Mark Perryman on 6/28/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyGameAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
		var gameState: GameState
    }

    // Fixed non-changing properties about your activity go here!
	var homeTeam: String
	var awayTeam: String
}

struct MyGameLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyGameAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
				Text("HomeScore: \(context.state.gameState.homeScore)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("HomeScore: \(context.state.gameState.homeScore)")
                    // more content
                }
				DynamicIslandExpandedRegion(.center) {
					Text("HomeScore: \(context.state.gameState.homeScore)")
					// more content
				}
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("HomeScore: \(context.state.gameState.homeScore)")
            } minimal: {
                Text("HomeScore: \(context.state.gameState.homeScore)")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MyGameAttributes {
    fileprivate static var preview: MyGameAttributes {
		MyGameAttributes(homeTeam: "", awayTeam: "")
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
    MyGameAttributes.ContentState.smiley
    MyGameAttributes.ContentState.starEyes
}
