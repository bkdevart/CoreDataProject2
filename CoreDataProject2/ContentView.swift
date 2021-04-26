//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Brandon Knox on 4/25/21.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    
    var body: some View {
        List(ships, id: \.self) { ship in
            Text(ship.name ?? "Unknown name")
        }
        
        Button("Add Examples") {
            let ship1 = Ship(context: self.moc)
            ship1.name = "Enterprise"
            ship1.universe = "Star Trek"
            
            let ship2 = Ship(context: self.moc)
            ship2.name = "Defiant"
            ship2.universe = "Star Trek"
            
            let ship3 = Ship(context: self.moc)
            ship3.name = "Millenium Falcon"
            ship3.universe = "Star Wars"
            
            let ship4 = Ship(context: self.moc)
            ship4.name = "Executor"
            ship4.universe = "Star Wars"
            
            try? self.moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
