/*--------------------------------------------------------------------------------------------------------------------------
    File: DataModel.swift
  Author: Kevin Messina
 Created: 1/1/24
Modified:
 
©2024 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/

import SwiftUI


class DataModel: ObservableObject {
    @AppStorage("imgSelection") var imgSelection: Int = 0
    @AppStorage("effectSelection") var effectSelection: Int = 0
    @AppStorage("foregroundStyle") var foregroundStyle: Int = 0
    @AppStorage("reversed") var reversed: Bool = false
    @AppStorage("iterative") var iterative: Bool = false
    @AppStorage("hideInactive") var hideInactive: Bool = false
    @AppStorage("primaryColor") var primaryColor: String = Color.red.toString()
    @AppStorage("secondaryColor") var secondaryColor: String = Color.blue.toString()
    @AppStorage("tertiaryColor") var tertiaryColor: String = Color.green.toString()

    
    enum foregroundTypes:Int { case solid,linearGradient }
    enum imgStyles:Int { case mask,rainbow,cloud,antenna,peeps }
    enum effectStyles:Int { case none,pulse,variable,bounce,scaleUp,scaleDown }
    enum effectDirection:Int { case forward,reverse }
    
    struct Items {
        let id:Int
        let text:String
        let name:String
    }
    
    let images:[Items] = [
        Items.init(id: 0,text: "Theater Masks",name:"theatermasks"),
        Items.init(id: 1,text: "Rainbow",name:"rainbow"),
        Items.init(id: 2,text: "Cloud w/Rainbow",name:"cloud.rainbow.half.fill"),
        Items.init(id: 3,text: "Antenna",name:"antenna.radiowaves.left.and.right"),
        Items.init(id: 4,text: "3 People",name:"person.3.sequence.fill")
    ]
    
    let effects:[Items] = [
        Items.init(id: 0,text: "None",name:""),
        Items.init(id: 1,text: "Pulse",name:".pulse"),
        Items.init(id: 2,text: "Variable Color",name:".variableColor"),
        Items.init(id: 3,text: "Bounce",name:".bounce"),
        Items.init(id: 4,text: "Scale Up",name:".scaleUp"),
        Items.init(id: 5,text: "Scale Down",name:".scaleDown")
    ]
    
    let foregroundStyles:[Items] = [
        Items.init(id: 0,text: "Primary Solid",name:""),
        Items.init(id: 1,text: "Linear Gradient",name:"")
    ]
}

