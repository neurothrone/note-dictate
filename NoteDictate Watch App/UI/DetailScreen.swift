//
//  DetailScreen.swift
//  NoteDictate Watch App
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import SwiftUI

struct DetailScreen: View {
  let note: Note
  let index: Int
  let noteCount: Int
  
  var body: some View {
    Text(note.text)
      .navigationTitle("Note \(index + 1 / noteCount)")
  }
}

struct DetailScreen_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      DetailScreen(note: .init(text: "Preview Note"), index: 1, noteCount: 5)
    }
  }
}
