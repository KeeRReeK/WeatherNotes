//
//  Font+Extension.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 26.02.2026.
//

import SwiftUI

extension Font {
    static func patuaOne(size: CGFloat) -> Font {
        return .custom("PatuaOne-Regular", size: size)
    }
}

extension View {
    func patuaOne(_ size: CGFloat) -> some View {
        self.font(.patuaOne(size: size))
    }
}
