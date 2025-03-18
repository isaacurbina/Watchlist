//
//  ContentView.swift
//  Watchlist
//
//  Created by Isaac Urbina on 3/15/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	
	// MARK: - Properties
	
	@Environment(\.modelContext) var modelContext
	@Query private var movies: [Movie]
	
    var body: some View {
		List {
			
		}
		.overlay {
			if movies.isEmpty {
				EmptyListView()
			}
		}
    }
}

#Preview {
    ContentView()
		.modelContainer(for: Movie.self, inMemory: true)
}
