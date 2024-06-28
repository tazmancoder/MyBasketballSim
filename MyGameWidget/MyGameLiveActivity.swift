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
			LiveActivityView()
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
					HStack {
						Image(.warriors)
							.teamLogoModifier(frame: 40)
						
						Text("100")
							.font(.title)
							.fontWeight(.semibold)
					}
                }
                DynamicIslandExpandedRegion(.trailing) {
					HStack {
						Text("88")
							.font(.title)
							.fontWeight(.semibold)

						Image(.bulls)
							.teamLogoModifier(frame: 40)
					}
                }
                DynamicIslandExpandedRegion(.bottom) {
					HStack {
						Image(.warriors)
							.teamLogoModifier(frame: 20)
						Text("S. Courier drains a 3")
					}
                }
				DynamicIslandExpandedRegion(.center) {
					Text("5:24 3Q.")
					// more content
				}
            } compactLeading: {
				Image(.warriors)
					.teamLogoModifier()
				
				Text("100")
					.fontWeight(.semibold)
            } compactTrailing: {
				Text("88")
					.fontWeight(.semibold)

				Image(.bulls)
					.teamLogoModifier()
            } minimal: {
				Image(.bulls)
					.teamLogoModifier()
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
	MyGameAttributes.ContentState(gameState: GameState(homeScore: 34, awayScore: 44, scoringTeamName: "Bulls", lastAction: "Made a 3 pointer"))
}
