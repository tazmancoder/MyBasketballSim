//
//  LiveActivityView.swift
//  MyGameWidgetExtension
//
//  Created by Mark Perryman on 6/28/24.
//

import SwiftUI
import WidgetKit

struct LiveActivityView: View {
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
					Image(.warriors)
						.teamLogoModifier(frame: 60)
					
					Text("124")
						.font(.system(size: 40, weight: .bold))
						.foregroundStyle(.white.opacity(0.8))
					
					Spacer()
										
					Text("124")
						.font(.system(size: 40, weight: .bold))
						.foregroundStyle(.black.opacity(0.8))

					Image(.bulls)
						.teamLogoModifier(frame: 60)
				}
				
				HStack {
					Image(.warriors)
						.teamLogoModifier(frame: 20)
					Text("S. Courie drains a 3")
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
