//
//  CastView.swift
//  MovieListing
//
//  Created by NATHIYA on 09/07/25.
//

import SwiftUI
struct CastCard: View {
   var cast: Cast
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            
            AsyncImage(url:URL(string: cast.primaryImage ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill) //
                    .frame(width: 70, height: 70)
                    .clipped() //
                    .cornerRadius(8)
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.3)
                    ProgressView()
                }
                .frame(height:70)
            }
            
            Text(cast.fullName)
                .font(.subheadline)
                .bold()
                .foregroundColor(.white)
            
            Text(cast.characters.first ?? "")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.darkGray).opacity(0.5))
        .cornerRadius(12)
    }
}
