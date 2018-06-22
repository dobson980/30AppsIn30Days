//
//  ViewController.swift
//  RandomizeText
//
//  Created by Tom Dobson on 6/21/18.
//  Copyright © 2018 Dobson Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func randomFontButtonPressed(_ sender: Any) {
        getRandomFont(fontFamily: getRandomFontFamily())
    }
    
    
    func getRandomFontFamily() -> String {
        let fontFamilyNames = UIFont.familyNames
        let fontFamilyNamesCount = fontFamilyNames.count
        let randomFontFamilyName = fontFamilyNames[Int(arc4random_uniform(UInt32(fontFamilyNamesCount)))]
        
        //print(randomFontFamilyName)
        return randomFontFamilyName
    }
    
    func getRandomFont(fontFamily: String){
        let availableFonts = UIFont.fontNames(forFamilyName: fontFamily)
        let availableFontCount = availableFonts.count
        if (availableFontCount > 0) {
            let randomFontName = availableFonts[Int(arc4random_uniform(UInt32(availableFontCount)))]
            print(randomFontName)
        } else {
            print("Empty Font Family :(")
            getRandomFont(fontFamily: getRandomFontFamily())
        }
    }


}

