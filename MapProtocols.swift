//
//  MapProtocols.swift
//  walmart-e4
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import UIKit
import CoreLocation
import MapKit

// MARK: - Interactor Protocols
protocol MapInteractorProtocol {

    var presenter: MapPresenterProtocol? { get set }

    func requestLocationPermission()
    func getCurrentLocation()
}

// MARK: - Presenter Protocols
protocol MapPresenterProtocol: AnyObject {

    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorProtocol? { get set }
    var router: MapRouterProtocol? { get set }

    func locationManagerInit()
    func didReceivePlaces(_ places: [MKMapItem])
    func didFailWithError(_ error: Error?)
    func getRadius() -> CLLocationDistance

}

// MARK: - View Protocols
protocol MapViewProtocol: AnyObject {
    var presenter: MapPresenterProtocol? { get set }

    func addPointAnnotation(_ location: CLLocation, title: String)
    func showError(message: String)
}

// MARK: - Router Protocols
protocol MapRouterProtocol{

    /// Creates and returns a new instance of the module's main view controller.
    ///
    /// - Returns: A `UIViewController` instance representing the main view of the module.
    static func createModule() -> UIViewController

}

