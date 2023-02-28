//
//  ContentView.swift
//  FilmKitabiSwiftUI
//
//  Created by Mac on 22.12.2022.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        
    }
    
    var body: some View {
        NavigationView{
            
            VStack{
                HStack{
                    Spacer()
                    TextField("Aranacak Film", text: $aranacakFilm, onEditingChanged: {_ in},  onCommit: {
                        self.filmListeViewModel
                            .filmAramasiYap(filmIsmi:
                                                aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Image(systemName: "magnifyingglass")
                        .frame(alignment: .trailing)
                    Spacer()
                }
                
                
                
                
                List(filmListeViewModel.filmler, id: \.imdbID) {
                    film in
                    NavigationLink(destination: DetayView(imdbId: film.imdbID),
                                   label: {
                        HStack{
                            OzelImage(url: film.poster)
                                .frame(width: 100, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            //   .padding()
                            
                            VStack(alignment: .leading){
                                Text(film.title)
                                    .font(.title3)
                                
                                
                                Text(film.year)
                                    .foregroundColor(.blue)
                            }.padding()
                        }
                    })
                    
                }.navigationTitle(Text("Film kitabi"))
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
