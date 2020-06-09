//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Xiaochun Shen on 2020/6/9.
//  Copyright © 2020 SXC. All rights reserved.
//

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
            Rectangle().foregroundColor(.yellow)
                .edgesIgnoringSafeArea([.horizontal, .bottom])
            
        }
    }
    private let defaultEmojiSize: CGFloat = 40
}


