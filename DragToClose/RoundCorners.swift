//
//  RoundCorners.swift
//  DragToClose
//
//  Created by Raphael Cerqueira on 06/07/21.
//

import SwiftUI

struct RoundCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
