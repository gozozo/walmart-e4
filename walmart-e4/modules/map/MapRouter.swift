//
//  MapRouter.swift
//  walmart-e4
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import UIKit

class MapRouter: MapRouterProtocol {
    
    /// Creates and returns a new instance of the Map module's view controller.
    /// 
    /// - Returns: A `UIViewController` instance representing the Map module.
    static func createModule() -> UIViewController {
        let view = MapViewController()
        let interactor = MapInteractor()
        let presenter = MapPresenter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = MapRouter()
        interactor.presenter = presenter
        
        return view
    }
}
