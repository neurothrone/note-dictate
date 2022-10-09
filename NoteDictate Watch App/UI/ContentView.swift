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
        .onAppear(perform: load)
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
    
    save()
  }
  
  private func delete(at offsets: IndexSet) {
    guard let index = offsets.first else { return }
    
    _ = withAnimation(.easeInOut) {
      notes.remove(at: index)
    }
    
    save()
  }
  
  private func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths.first!
  }
  
  private func save() {
    do {
      let data = try JSONEncoder().encode(notes)
      let url = getDocumentsDirectory().appending(path: "notes")
      try data.write(to: url)
    } catch {
      print("❌ -> Failed to save notes")
    }
  }
  
  private func load() {
    DispatchQueue.main.async {
      
      do {
        let url = getDocumentsDirectory().appending(path: "notes")
        let data = try Data(contentsOf: url)
        notes = try JSONDecoder().decode([Note].self, from: data)
      } catch {
        // Do nothing: no previous data found
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
