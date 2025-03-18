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
	@State private var isSheetPresented: Bool = false
	
    var body: some View {
		List {
			ForEach(movies) { movie in
				HStack {
					Text(movie.title)
					Spacer()
					Text(movie.genre.name)
				}
				.swipeActions {
					Button(role: .destructive) {
						modelContext.delete(movie)
					} label : {
						Label("Delete", systemImage: "trash")
					}
				}
			}
		}
		.overlay {
			if movies.isEmpty {
				EmptyListView()
			}
		}
		.safeAreaInset(edge: .bottom, alignment: .center) {
			Button {
				isSheetPresented.toggle()
			} label: {
				ButtonImageView(symbolName: "plus.circle.fill")
				
			}
		}
		.sheet(isPresented: $isSheetPresented) {
			NewMovieFormView()
		}
    }
}

#Preview("Sample Data") {
	ContentView()
		.modelContainer(for: Movie.self, inMemory: true)
}

#Preview("Empty List") {
    ContentView()
		.modelContainer(for: Movie.self, inMemory: true)
}
