/*--------------------------------------------------------------------------------------------------------------------------
    File: ContentView.swift
  Author: Kevin Messina
 Created: 12/31/23
Modified:
 
©2023-2024 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/

import SwiftUI

struct ContentView: View {
    @StateObject var dm: DataModel = DataModel.init()
    
    @State var primaryColor: Color = .red
    @State var secondaryColor: Color = .blue
    @State var tertiaryColor: Color = .green
    @State var count: Int = 0
    @State var isActive:Bool = false
    @State var symbolExpanded:Bool = true
    
    var body: some View {
        let isSolid = (dm.foregroundStyle == DataModel.foregroundTypes.solid.rawValue)
        let isPulse = (dm.effectSelection == DataModel.effectStyles.pulse.rawValue)
        let isVariable = (dm.effectSelection == DataModel.effectStyles.variable.rawValue)
        let isBounce = (dm.effectSelection == DataModel.effectStyles.bounce.rawValue)
        let isScaleUp = (dm.effectSelection == DataModel.effectStyles.scaleUp.rawValue)
        let isScaleDown = (dm.effectSelection == DataModel.effectStyles.scaleDown.rawValue)
        let isNone = (dm.effectSelection == DataModel.effectStyles.none.rawValue)
        let isMask = (dm.imgSelection == DataModel.imgStyles.mask.rawValue)
        
        return ZStack {
            Color.black.ignoresSafeArea(.all)
            
            VStack(spacing:30) {
                Text("SF Symbols Color Demo")
                    .font(.title)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                HStack(spacing: 30) {
                    VStack {
                        Image(systemName: dm.images[dm.imgSelection].name)
                            .resizable()
                            .font(.system(size: 144))
                            .frame(width:60, height:60)
                            .symbolRenderingMode(.monochrome)
                            .if(!isSolid, transform: { img in
                                img.foregroundStyle(
                                    .linearGradient(colors: [dm.primaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                                    .linearGradient(colors: [dm.secondaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                                    .linearGradient(colors: [dm.tertiaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing)
                                )
                            })
                            .if(isSolid, transform: { img in
                                img.foregroundStyle(
                                    dm.primaryColor.toColor(),
                                    dm.secondaryColor.toColor(),
                                    dm.tertiaryColor.toColor()
                                )
                            })
                        
                        Text("Rendering\nMonochrome")
                            .font(.caption)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .padding(.top,1)
                    }

                    VStack {
                        Image(systemName: dm.images[dm.imgSelection].name)
                            .resizable()
                            .font(.system(size: 144))
                            .frame(width:60, height:60)
                            .symbolRenderingMode(.hierarchical)
                            .if(!isSolid, transform: { img in
                                img.foregroundStyle(
                                    .linearGradient(colors: [dm.primaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                                    .linearGradient(colors: [dm.secondaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                                    .linearGradient(colors: [dm.tertiaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing)
                                )
                            })
                            .if(isSolid, transform: { img in
                                img.foregroundStyle(
                                    dm.primaryColor.toColor(),
                                    dm.secondaryColor.toColor(),
                                    dm.tertiaryColor.toColor()
                                )
                            })
                        
                        Text("Rendering\nHierarchical")
                            .font(.caption)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .padding(.top,1)
                    }

                    VStack {
                        Image(systemName: dm.images[dm.imgSelection].name)
                            .resizable()
                            .font(.system(size: 144))
                            .frame(width:60, height:60)
                            .symbolRenderingMode(.palette)
                            .if(!isSolid, transform: { img in
                                img.foregroundStyle(
                                    .linearGradient(colors: [dm.primaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                                    .linearGradient(colors: [dm.secondaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                                    .linearGradient(colors: [dm.tertiaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing)
                                )
                            })
                            .if(isSolid, transform: { img in
                                img.foregroundStyle(
                                    dm.primaryColor.toColor(),
                                    dm.secondaryColor.toColor(),
                                    dm.tertiaryColor.toColor()
                                )
                            })
                        
                        Text("Rendering\nPalette")
                            .font(.caption)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .padding(.top,1)
                    }

                    VStack {
                        Image(systemName: dm.images[dm.imgSelection].name)
                            .resizable()
                            .font(.system(size: 144))
                            .frame(width:60, height:60)
                            .symbolRenderingMode(.multicolor)
                            .if(!isSolid, transform: { img in
                                img.foregroundStyle(
                                    .linearGradient(colors: [dm.primaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                                    .linearGradient(colors: [dm.secondaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing),
                                    .linearGradient(colors: [dm.tertiaryColor.toColor(), .black], startPoint: .top, endPoint: .bottomTrailing)
                                )
                            })
                            .if(isSolid, transform: { img in
                                img.foregroundStyle(
                                    dm.primaryColor.toColor(),
                                    dm.secondaryColor.toColor(),
                                    dm.tertiaryColor.toColor()
                                )
                            })
                        
                        Text("Rendering\nMulticolor")
                            .font(.caption)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .padding(.top,1)
                    }
                }
                .if(isPulse, transform: { img in img.symbolEffect(.pulse, isActive: isActive) })
                .if(isVariable, transform: { img in img.symbolEffect(.variableColor, isActive: isActive) })
                .if(isBounce, transform: { img in img.symbolEffect(.bounce, value: count) })
                .if(isScaleUp, transform: { img in img.symbolEffect(.scale.up, isActive: isActive) })
                .if(isScaleDown, transform: { img in img.symbolEffect(.scale.down, isActive: isActive) })
                .if(dm.effectSelection == DataModel.effectStyles.variable.rawValue) { img in
                    img.symbolEffect(
                        dm.iterative
                            ? dm.reversed
                                ? dm.hideInactive
                                    ? .variableColor.iterative.reversing.hideInactiveLayers
                                    : .variableColor.iterative.reversing
                                : dm.hideInactive
                                    ? .variableColor.iterative.hideInactiveLayers
                                    : .variableColor.iterative
                            : dm.reversed
                                ? dm.hideInactive
                                    ? .variableColor.reversing.hideInactiveLayers
                                    : .variableColor.reversing
                                : dm.hideInactive
                                    ? .variableColor.hideInactiveLayers
                                    : .variableColor
                    )
                }
                
                ScrollView(.vertical) {
                    DisclosureGroup(
                        isExpanded: $symbolExpanded,
                        content: {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing:10) {
                                    Text("Image")
                                        .font(.callout)
                                    
                                    Spacer()
                                    
                                    Picker(selection: dm.$imgSelection, label: Text(""), content: {
                                        ForEach (dm.images, id: \.id) { image in
                                            Text(image.text).tag(image.id)
                                                .font(.title)
                                        }
                                    })
                                    .onChange(of: dm.imgSelection) { _,newValue in
                                        dm.effectSelection = DataModel.effectStyles.none.rawValue
                                        isActive = false
                                    }
                                    .accentColor(.white)
                                }
                                
                                HStack(spacing:10) {
                                    Text("Foreground Style")
                                        .font(.callout)
                                    
                                    Spacer()
                                    
                                    Picker(selection: $dm.foregroundStyle, label: Text(""), content: {
                                        ForEach (dm.foregroundStyles, id: \.id) { style in
                                            Text(style.text).tag(style.id)
                                                .font(.title)
                                        }
                                    })
                                }
                            }
                            .modifier(modifiers.secondarySettings())
                        },
                        label: { Text("SYMBOL").font(.headline) }
                    )
                    .modifier(modifiers.viewOutline())
                    .padding(.top,10)

                    DisclosureGroup {
                        VStack{
                            ColorPicker("Primary", selection: $primaryColor,supportsOpacity: true)
                                .onChange(of: primaryColor) { _, newColor in
                                    dm.primaryColor = newColor.toString()
                                    print(dm.primaryColor)
                                }
                            
                            ColorPicker("Secondary", selection: $secondaryColor,supportsOpacity: true)
                                .onChange(of: secondaryColor) { _, newColor in
                                    dm.secondaryColor = newColor.toString()
                                    print(dm.secondaryColor)
                                }
                            
                            ColorPicker("Tertiary", selection: $tertiaryColor,supportsOpacity: true)
                                .onChange(of: tertiaryColor) { _, newColor in
                                    dm.tertiaryColor = newColor.toString()
                                    print(dm.tertiaryColor)
                                }
                        }
                        .modifier(modifiers.secondarySettings())
                    } label: {
                        Text("COLORS")
                            .font(.headline)
                    }
                    .modifier(modifiers.viewOutline())

                    DisclosureGroup {
                        VStack(alignment: .leading, spacing:10) {
                            HStack(spacing:10) {
                                Text("Symbol Effect")
                                    .font(.callout)
                                
                                Spacer()
                                
                                Picker(selection: dm.$effectSelection, label: Text(""), content: {
                                    ForEach (dm.effects, id: \.id) { effect in
                                        if ( !(isMask && isVariable) ) {
                                            Text(effect.text)
                                                .tag(effect.id)
                                                .font(.title)
                                        }
                                    }
                                })
                                .accentColor(.white)
                            }
                            .modifier(modifiers.secondarySettings())
                            
                            HStack(spacing:10) {
                                Text("Animation Trigger")
                                    .font(.callout)
                                
                                Spacer()
                                
                                Button(action: {
                                    count += 1
                                    isActive.toggle()
                                }, label: {
                                    var text:String = ""
                                    if isScaleUp {
                                        text = isActive ?"Restore" : "Animate Up"
                                    }else if isScaleDown {
                                        text = isActive ?"Restore" : "Animate Down"
                                    }else if isBounce {
                                        text = "Animate"
                                    }else if isVariable || isPulse {
                                        text = isActive ?"Stop Animation" : "Animate"
                                    }
                                    
                                    return Text(text).frame(maxWidth: .infinity)
                                    
                                })
                                .bold()
                                .foregroundColor(.white)
                                .accentColor(.red)
                                .buttonStyle(.borderedProminent)
                                .disabled((isNone))
                            }
                            .modifier(modifiers.secondarySettings())
                            
                            VStack{
                                //                            if (dm.imgSelection != DataModel.imgStyles.mask.rawValue) {
                                toggleView(toggleItem: dm.$reversed, text: "Reversing Variable Coloring")
                                toggleView(toggleItem: dm.$iterative, text: "Iterative Variable Coloring")
                                toggleView(toggleItem: dm.$hideInactive, text: "Hide Inactive Layers")
                                //                            }
                            }
                        }
                    } label: {
                        Text("ANIMATION")
                            .font(.headline)
                    }
                    .modifier(modifiers.viewOutline())
                    .padding(.bottom,10)
                }
                .background(Color.yellow.opacity(0.1))
                .cornerRadius(15)
                
                Spacer()
            }
            .padding()
        }
        .onAppear(){
            primaryColor = dm.primaryColor.toColor()
            secondaryColor = dm.secondaryColor.toColor()
            tertiaryColor = dm.tertiaryColor.toColor()
        }
    }
    
    struct toggleView: View {
        @Binding var toggleItem: Bool
        var text: String
        
        var body: some View {
            HStack {
                Toggle("", isOn: $toggleItem)
                    .labelsHidden()
                    .padding(.leading,20)
                
                Text(text)
                    .italic()
                    .foregroundColor(.yellow)
                
                Spacer()
            }
            .padding(.top,10)
        }
    }
}

#Preview {
    ContentView()
}
