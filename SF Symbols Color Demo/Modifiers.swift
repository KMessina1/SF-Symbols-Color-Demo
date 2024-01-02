/*--------------------------------------------------------------------------------------------------------------------------
    File: Modifiers.swift
  Author: Kevin Messina
 Created: 1/1/24
Modified:
 
©2024 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI

struct modifiers {
    struct viewOutline: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(.white)
                .padding(.all,10)
                .background(Color.white.opacity(0.1))
                .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(.white.opacity(0.4), lineWidth: 5))
                .padding(.horizontal,10)
                .padding(.bottom,10)
        }
    }
    
    struct secondarySettings: ViewModifier {
        func body(content: Content) -> some View {
            content
                .accentColor(.white)
                .foregroundColor(.yellow)
                .italic()
                .padding(.leading,20)
        }
    }
    
    struct solidColors: ViewModifier {
        var dm:DataModel
        
        func body(content: Content) -> some View {
            content
                .foregroundStyle(
                    dm.primaryColor.toColor(),
                    dm.secondaryColor.toColor(),
                    dm.tertiaryColor.toColor()
                )
        }
    }

    struct linearColors: ViewModifier {
        var dm:DataModel
        
        func body(content: Content) -> some View {
            content
                .foregroundStyle(
                    .linearGradient(colors: [dm.primaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                    .linearGradient(colors: [dm.secondaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                    .linearGradient(colors: [dm.tertiaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing)
                )
        }
    }
}
