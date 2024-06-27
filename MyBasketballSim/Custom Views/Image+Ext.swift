//
//  Image+Ext.swift
//  MyBasketballSim
//
//  Created by Mark Perryman on 6/27/24.
//

import SwiftUI

extension Image {
	
	func teamLogoModifier(frame: CGFloat? = nil) -> some View {
		self
			.resizable()
			.aspectRatio(contentMode: .fit)
			.frame(width: frame, height: frame)
	}
}
