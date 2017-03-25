//
//  SuperHeroesDetailViewControllerTests.swift
//  KataScreenshot
//
//  Created by Pedro Cid on 25/3/17.
//  Copyright © 2017 Karumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroesDetailViewControllerTests: ScreenshotTest {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsAnySuperHero(){
        
        _ = givenThereIsSuperHeroe(name: "Pedro", description: "Description", avengers: false)
        
        let viewController = getSuperHeroDetailViewController(name: "Pedro")
        
        verify(viewController: viewController)
    
    }
    
    func testShowsAnySuperHeroeWithoutName(){
    
        _ = givenThereIsSuperHeroe(name: "", description: "Description", avengers: false)
        
        let viewController = getSuperHeroDetailViewController(name: "")
        
        verify(viewController: viewController)
        
    }
    func testShowsAnySuperHeroeWithoutDescription(){
        
        _ = givenThereIsSuperHeroe(name: "pedro", description: "", avengers: false)
        
        let viewController = getSuperHeroDetailViewController(name: "pedro")
        
        verify(viewController: viewController)
    }
    func testShowsAnySuperHeroeWithLongName(){
    
        _ = givenThereIsSuperHeroe(name: "jafsoihsalisafhlfisahfsaoihafslh", description: "Description", avengers: false)
        
        let viewController = getSuperHeroDetailViewController(name: "jafsoihsalisafhlfisahfsaoihafslh")
        
        verify(viewController: viewController)
    }
    func testShowsAnySuperHeroeWithLongDescription(){
    
        _ = givenThereIsSuperHeroe(name: "pedro", description: "lhsafoafshlafshalhaslhfalashfalsfhsfalkh", avengers: false)
        
        let viewController = getSuperHeroDetailViewController(name: "pedro")
        
        verify(viewController: viewController)
    
    }
    func testShowsAnAvenger(){
    
        _ = givenThereIsSuperHeroe(name: "pedro", description: "description", avengers: true)
        
        let viewController = getSuperHeroDetailViewController(name: "pedro")
        
        verify(viewController: viewController)
    }

    fileprivate func givenThereIsSuperHeroe(name: String, description: String, avengers: Bool = false) -> [SuperHero] {
        
        var superHeroes = [SuperHero]()
        let superHero = SuperHero(name: name,
            photo: URL(string: ""),
            isAvenger: avengers, description: description)
        
        superHeroes.append(superHero)
        
        repository.superHeroes = superHeroes
        return superHeroes
    }

    fileprivate func getSuperHeroDetailViewController(name: String) -> UIViewController {
        let superHeroesViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(name) as! SuperHeroDetailViewController
        
        superHeroesViewController.presenter = SuperHeroDetailPresenter(ui: superHeroesViewController, superHeroName: name, getSuperHeroByName: GetSuperHeroByName(repository: repository))
        
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroesViewController]
        
        return rootViewController
    }

}
