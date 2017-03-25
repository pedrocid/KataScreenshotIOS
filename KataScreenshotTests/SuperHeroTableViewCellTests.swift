//
//  SuperHeroTableViewCellTests.swift
//  KataScreenshot
//
//  Created by Sergio Gutiérrez on 09/01/17.
//  Copyright © 2017 Karumi. All rights reserved.
//

import UIKit
import XCTest
@testable import KataScreenshot

class SuperHeroTableViewCellTests: ScreenshotTest {

    func testShowsAnySuperHero(){
        
        let superHero = givenASuperHero(name: "Pedro", description: "Master", avenger: false)
        
        let cell = givenASuperHeroTableViewCell()
        
        cell.configure(forItem: superHero)
        
        verify(view: cell)
        
    }
    func testShowsAvengerSuperHero(){
    
        let superHero = givenASuperHero(name: "Pedro", description: "Master", avenger: true)
        
        let cell = givenASuperHeroTableViewCell()
        
        cell.configure(forItem: superHero)
        
        verify(view: cell)

        
    }
    func testShowsSuperHeroLongName(){
        
        let superHero = givenASuperHero(name: "PedroPedroPedroPedroPedroPedroPedroPedroPedroPedroPedroPedro", description: "Master", avenger: true)
        
        let cell = givenASuperHeroTableViewCell()
        
        cell.configure(forItem: superHero)
        
        verify(view: cell)

    }
    
    private func givenASuperHero(name: String, description: String, avenger: Bool) -> SuperHero{
    
        return SuperHero(name: name, photo: nil, isAvenger: avenger, description: description)
    }
    
    private func givenASuperHeroTableViewCell() -> SuperHeroTableViewCell {
        return UINib(nibName: "SuperHeroTableViewCell", bundle: Bundle.main).instantiate(withOwner: self, options: nil)[0] as! SuperHeroTableViewCell
    }
}
