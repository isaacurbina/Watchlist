//
//  NewMovieFormView.swift
//  Watchlist
//
//  Created by Isaac Urbina on 3/17/25.
//

import SwiftUI

struct NewMovieFormView: View {
	
	// MARK: - properties
	
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss
	
	@State private var title: String = ""
	@State private var selectedGenre: Genre = .kids
	
	
	// MARK: - functions
	private func addNewMovie() {
		let newMovie = Movie(title: title, genre: selectedGenre)
		modelContext.insert(newMovie)
		title = ""
		selectedGenre = .kids
	}
	
	
	// MARK: - views
	
    var body: some View {
		Form {
			List {
				
				
				// MARK: - header
				Text("What to Watch")
					.font(.largeTitle.weight(.black))
					.foregroundStyle(.blue.gradient)
					.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
					.padding(.vertical)
				
				
				// MARK: - title
				TextField("Movie Title", text: $title)
					.textFieldStyle(.roundedBorder)
					.font(.largeTitle.weight(.light))
				
				// MARK: - genre
				Picker("Genre", selection: $selectedGenre) {
					ForEach(Genre.allCases) { genre in
						Text(genre.name)
							.tag(genre)
					}
				}
				
				
				// MARK: - save button
				Button {
					if title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
						print("Input is invalid")
						return
						
					} else {
						print("Valid input: \(title) - \(selectedGenre)")
						addNewMovie()
						dismiss()
					}
					
				} label: {
					Text("Save")
						.font(.title2.weight(.medium))
						.frame(maxWidth: .infinity)
				}
				.buttonStyle(.borderedProminent)
				.controlSize(.extraLarge)
				.buttonBorderShape(.roundedRectangle)
				.disabled(title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
				
				
				// MARK: - cancel button
				Button {
					dismiss()
					
				} label: {
					Text("Close")
						.frame(maxWidth: .infinity)
				}
			}
			.listRowSeparator(.hidden)
		}
    }
}

#Preview {
    NewMovieFormView()
}
