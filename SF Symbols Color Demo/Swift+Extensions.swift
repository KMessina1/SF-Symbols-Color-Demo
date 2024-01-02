/*--------------------------------------------------------------------------------------------------------------------------
    File: Swift+Extensions.swift
  Author: Kevin Messina
 Created: 1/1/24
Modified:
 
©2024 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI

protocol ImageModifier {
    associatedtype Body : View
    
    func body(image: Image) -> Self.Body
}

extension Image {
    func modifier<M>(_ modifier: M) -> some View where M: ImageModifier {
        modifier.body(image: self)
    }
}

extension Color {
    func toString() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        let _ = UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return "\(red),\(green),\(blue),\(alpha)"
    }
}

extension String {
    func toColor() -> Color {
        if !self.isEmpty {
            let rgbArray = self.components(separatedBy: ",")
            if let red = Double (rgbArray[0]),
               let green = Double (rgbArray[1]),
               let blue = Double(rgbArray[2]),
               let alpha = Double (rgbArray[3])
            {
                return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
            }
        }
        
        return .black
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension Image {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

