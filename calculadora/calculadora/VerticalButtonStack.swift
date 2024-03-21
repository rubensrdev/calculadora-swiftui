//
//  VerticalButtonStack.swift
//  calculadora
//
//  Created by Ruben on 20/3/24.
//

import SwiftUI

struct VerticalButtonStack: View {
    
    let data: [KeyboardButton]
    let columns: [GridItem]
    let width: CGFloat
    
    init(data: [KeyboardButton], columns: [GridItem], width: CGFloat) {
        self.data = data
        self.columns = columns
        self.width = width
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(data, id: \.self) { model in
                Button(action: {}, label: {
                    if model.isDoubleWidth {
                        Rectangle()
                            .foregroundStyle(model.backgroundColor)
                            .overlay(
                                Text(model.title)
                                    .font(.largeTitle)
                                    .offset(x: width * 0.22 * 0.5)
                            )
                            .frame(width: width * 2 * 0.22, height: width * 0.22)
                        
                    } else {
                        Text(model.title)
                            .font(.largeTitle)
                            .frame(width: width * 0.22, height: width * 0.22)
                    }
                })
                .foregroundStyle(model.textColor)
                .background(model.backgroundColor)
                .cornerRadius(width * 0.25)
            }
        }
        .frame(width: width)
    }
}

#Preview {
    VerticalButtonStack(data: Matrix.firstSectionData, columns: Matrix.firstSectionGrid(390*0.25), width: 390)
    
}
