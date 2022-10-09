//
//  NoteListView.swift
//  NoteDictate Watch App
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import SwiftUI

struct NoteListView: View {
  @AppStorage("lineCount") var lineCount = 1
  
  let notes: [Note]
  let onDeleteNote: (IndexSet) -> Void
  
  var body: some View {
    List {      
      ForEach(notes.indices, id: \.self) { index in
        NavigationLink {
          DetailScreen(note: notes[index], index: index, noteCount: notes.count)
        } label: {
          Text(notes[index].text)
            .lineLimit(lineCount)
        }
      }
      .onDelete(perform: onDeleteNote)
      
      Stepper(value: $lineCount, in: 1...4) {
        Text("Lines: \(lineCount)")
          .font(.body)
      }
    }
  }
}

struct NoteListView_Previews: PreviewProvider {
  static var previews: some View {
    NoteListView(notes: Note.Preview.samples, onDeleteNote: { _ in })
  }
}
