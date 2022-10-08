//
//  ContentView.swift
//  NoteDictate Watch App
//
//  Created by Zaid Neurothrone on 2022-10-07.
//

import SwiftUI

struct ContentView: View {
  @State private var text = ""
  @State private var notes: [Note] = []
  
  @State private var isCreditsScreenPresented = false
  
  var body: some View {
    NavigationStack {
      content
        .navigationTitle("NoteDictate")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $isCreditsScreenPresented) {
          CreditsScreen()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
  }
  
  var content: some View {
    VStack {
      HStack {
        TextField("Add new note", text: $text)
          .autocorrectionDisabled(true)
        
        Button(action: addNote) {
          Label("Add Note", systemImage: "plus")
            .labelStyle(.iconOnly)
            .padding()
        }
        .buttonStyle(.borderedProminent)
        .fixedSize()
        .tint(.green)
        .disabled(text.isEmpty)
      }
      
      if notes.isEmpty {
        Text("No notes yet...")
          .font(.title3)
          .padding(.vertical, 10)
      } else {
        NoteListView(notes: notes, onDeleteNote: delete)
      }
      
      Button {
        isCreditsScreenPresented.toggle()
      } label: {
        Text("Credits")
          .font(.footnote)
      }
      .fixedSize()
      .buttonStyle(.borderedProminent)
      .tint(.purple)
    }
  }
}

extension ContentView {
  private func addNote() {
    let note = Note(text: text)
    
    withAnimation(.easeInOut) {
      notes.append(note)
    }
    
    text = ""
  }
  
  private func delete(at offsets: IndexSet) {
    guard let index = offsets.first else { return }
    
    withAnimation(.easeInOut) {
      notes.remove(at: index)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
