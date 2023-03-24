//
//  Words.swift
//  Speedtyper
//
//  Created by Philip Andersson on 2023-03-21.
//

import Foundation

class Words {
    
    // 5 letter words
    private let wordPool = [
                    // 5 letters
                    "rödak","sköld","mjukt","svart","glatt",
                    "tysta","färsk","stort","vitts","snabb",
                    "högda","mygga","mjölk","dynga","blick",
                    "skopa","glida","flöde","klara","märka",
                    // 8 letters
                    "adjektiv","avlöning","bataljon","barhuvad","dräpande",
                    "dödsfall","explicit","filmjölk","formalin","garnison",
                    "giljotin","halmstrå","hierarki","idealism","kaprifol",
                    // 12 letters
                    "jordgubbarna","apokalyptisk","barnpassning","brottsbalken","civilförsvar",
                    "bärgningsbil","flygvärdinna","fordonsskatt","gastronomisk","halsbrytande",
                    "husrannsakan","hällristning","inkonsekvent","konfronteras","landshövding",
                    // 17 letters
                    "samhällsvetenskap","ekonomisktillväxt","politisktpåverkan","statsvetenskaplig","rättsvetenskaplig",
                    "naturvetenskaplig","musikvetenskaplig","vetenskapsakademi","företagsekonomisk","kulturgeografiska",
                    "biblioteksarkivar","fruntimmersveckan","barnavårdscentral","anställningsskydd","alkoholpoliklinik",
                    // 20 letters
                    "sjukhusförvaltningen","sjukvårdsplaneringen","miljövårdsinsatserna","bostadsrättslägenhet","existensberättigande",
                    "konsumentsekreterare","hemspråksundervising","arbetslivserfarenhet","kabinettssekreterare","meningsskiljaktighet"]

    
    func getRandomWord(ofLength length: Int) -> String? {
        // filterd array of desired length from passed array
        let wordsOfDesiredLength = wordPool.filter { $0.count == length }
        // nil check new array
        guard !wordsOfDesiredLength.isEmpty else { return nil }
        // creates a random index from new array length
        let randomIndex = Int.random(in: 0..<wordsOfDesiredLength.count)
        // returns a random word from new array
        print(wordsOfDesiredLength[randomIndex])
        return String(wordsOfDesiredLength[randomIndex])
        
    }
    
}
