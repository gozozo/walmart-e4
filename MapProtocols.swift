//
//  MapProtocols.swift
//  walmart-e4
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import UIKit

// MARK: - Interactor Protocols
protocol MapInteractorProtocol {

    var presenter: MapPresenterProtocol? { get set }
}

// MARK: - Presenter Protocols
protocol MapPresenterProtocol: AnyObject {

    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorProtocol? { get set }
    var router: MapRouterProtocol? { get set }

}

// MARK: - View Protocols
protocol MapViewProtocol: AnyObject {
    var presenter: MapPresenterProtocol? { get set }
}

// MARK: - Router Protocols
protocol MapRouterProtocol{

    /// Creates and returns a new instance of the module's main view controller.
    ///
    /// - Returns: A `UIViewController` instance representing the main view of the module.
    static func createModule() -> UIViewController

}

