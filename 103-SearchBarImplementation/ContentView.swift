//
//  ContentView.swift
//  103-SearchBarImplementation
//
//  Created by Diego Salazar Arp on 27-08-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    
    let names = ["Diego", "Matías", "José", "Angelica", "Javiera"]
    
    var body: some View {
        List {
            
            SearchBar(text: $searchTerm)
            
            ForEach(self.names.filter {
                self.searchTerm.isEmpty ? true :
                    $0.localizedStandardContains(self.searchTerm)
            }, id: \.self) { names in
                Text(names)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
