//
//  LiveActivityView.swift
//  MyGameWidgetExtension
//
//  Created by Mark Perryman on 6/28/24.
//

import SwiftUI
import WidgetKit

struct LiveActivityView: View {
	let context: ActivityViewContext<MyGameAttributes>
	
    var body: some View {
		ZStack {
			Image(.activityBackground)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.overlay(
					ContainerRelativeShape()
						.fill(.black.opacity(0.3).gradient)
				)
			
			VStack(spacing: 12) {
				HStack {
					Image(context.attributes.homeTeam)
						.teamLogoModifier(frame: 60)
					
					Text("\(context.state.gameState.homeScore)")
						.font(.system(size: 40, weight: .bold))
						.foregroundStyle(.white.opacity(0.8))
					
					Spacer()
										
					Text("\(context.state.gameState.awayScore)")
						.font(.system(size: 40, weight: .bold))
						.foregroundStyle(.black.opacity(0.8))

					Image(context.attributes.awayTeam)
						.teamLogoModifier(frame: 60)
				}
				
				HStack {
					Image(context.state.gameState.scoringTeamName)
						.teamLogoModifier(frame: 20)
					Text("\(context.state.gameState.lastAction)")
						.font(.callout)
						.fontWeight(.semibold)
						.foregroundStyle(.white.opacity(0.8))
				}
			}
			.padding()
		}
    }
}

//#Preview {
//	LiveActivityView()
//		.previewContext(WidgetPreviewContext(family: .systemMedium))
//}
