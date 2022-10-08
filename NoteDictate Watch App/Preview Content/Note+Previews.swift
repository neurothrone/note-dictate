//
//  Note+Previews.swift
//  NoteDictate Watch App
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import Foundation

extension Note {
  enum Preview {
    static var sample: Note {
      .init(text: "Preview Note")
    }
    
    static var samples: [Note] {
      [
        .init(text: "Preview Note 1"),
        .init(text: "Preview Note 2"),
        .init(text: "Preview Note 3")
      ]
    }
  }
}
