//
//  DetayView.swift
//  FilmKitabiSwiftUI
//
//  Created by Mac on 23.12.2022.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                Text(filmDetayViewModel.filmDetayi?.title ?? "Film adı gösterilecek")
                    .font(.largeTitle)
                    .foregroundColor(.indigo)
                
                OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.45, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: .blue, radius: 10)
                    .padding()
                
                
                Text("Year: \(filmDetayViewModel.filmDetayi?.year ?? "..")")
                    .padding()
                    .font(.title)
                    .border(Color.black, width: 1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Text(filmDetayViewModel.filmDetayi?.plot ?? "Yükleniyor..")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.black, width: 1)
                HStack{
                    Text("Awards: \(filmDetayViewModel.filmDetayi?.awards ?? "..")")
                        .padding()
                        .foregroundColor(.red)
                    Spacer()
                }
                HStack{
                    Text("Director: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen gösterilecek")")
                        .font(.title2)
                        .frame(alignment: .leading)
                        .padding()
                    Spacer()
                }
                
                
            }.onAppear(perform: {
                self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
            })
            .padding()
        }
        
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "Test")
    }
}
