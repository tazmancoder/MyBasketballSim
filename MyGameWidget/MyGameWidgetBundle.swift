//
//  MyGameWidgetBundle.swift
//  MyGameWidget
//
//  Created by Mark Perryman on 6/28/24.
//

import WidgetKit
import SwiftUI

@main
struct MyGameWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyGameWidget()
        MyGameLiveActivity()
    }
}
