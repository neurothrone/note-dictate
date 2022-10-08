//
//  NoteListView.swift
//  NoteDictate Watch App
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import SwiftUI

struct NoteListView: View {
  let notes: [Note]
  let onDeleteNote: (IndexSet) -> Void
  

  
  var body: some View {
    List {      
      ForEach(notes.indices, id: \.self) { index in
        NavigationLink {
          DetailScreen(note: notes[index], index: index, noteCount: notes.count)
        } label: {
          Text(notes[index].text)
            .lineLimit(1)
        }
      }
      .onDelete(perform: onDeleteNote)
    }
  }
}

struct NoteListView_Previews: PreviewProvider {
  static var previews: some View {
    NoteListView(notes: Note.Preview.samples, onDeleteNote: { _ in })
  }
}
