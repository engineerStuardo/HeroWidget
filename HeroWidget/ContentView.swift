//
//  ContentView.swift
//  HeroWidget
//
//  Created by Italo Stuardo on 17/5/23.
//

import SwiftUI
import WidgetKit

let superHeroArray = [superman, batman, ironman]

struct ContentView: View {
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.italostuardo.HeroWidget"))
    var heroData: Data = Data()
    
    var body: some View {
        VStack {
            ForEach(superHeroArray) { array in
                HeroView(hero: array).onTapGesture {
                    saveToDefaults(hero: array)
                }
            }
        }
    }
    
    func saveToDefaults(hero: Superhero) {
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData
            print(hero.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetHero")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
