//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Xiaochun Shen on 2020/6/9.
//  Copyright © 2020 SXC. All rights reserved.
//  View

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack {
            ScrollView(.horizontal){
                HStack {
                    ForEach(EmojiArtDocument.palette.map {String($0)}, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: self.defaultEmojiSize))
                    }
                }
            }
            .padding(.horizontal)
            Color.white.overlay(
                Group {
                    if self.document.backgroundImage != nil {
                        Image(uiImage: self.document.backgroundImage!)
                    }
                }
            )
                .edgesIgnoringSafeArea([.horizontal, .bottom])
                .onDrop(of: ["public.image"], isTargeted: nil) { providers, location in
                    return self.drop(providers: providers)
                    
            }
        }
    }
    
    private func drop(providers: [NSItemProvider]) -> Bool {
        let found = providers.loadFirstObject(ofType: URL.self) { url in
            print("dropped \(url)")
            self.document.setBackgroundURL(url)
            
        }
        
        return found
    }
    
    private let defaultEmojiSize: CGFloat = 40
}


