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

    /// Requests the necessary permissions from the user to access their location.
    func requestLocationPermission()

    /// Retrieves the current location of the user.
    func getCurrentLocation()

    /// Searches for nearby places based on the given location.
    ///
    /// - Parameter location: The current location used to search for nearby places.
    func searchForNearbyPlaces(location: CLLocation)
}

// MARK: - Presenter Protocols
protocol MapPresenterProtocol: AnyObject {

    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorProtocol? { get set }
    var router: MapRouterProtocol? { get set }

    /// Initializes the location manager.
    ///
    /// This method sets up the location manager with the necessary configurations
    /// to start receiving location updates. It should be called before any location
    /// services are used within the application.
    func locationManagerInit()

    /// Notifies that the current location has been retrieved.
    /// - Parameter location: The current location as a `CLLocation` object.
    func didRetrieveCurrentLocation(_ location: CLLocation)

    /// Notifies that the places have been received.
    /// - Parameter places: An array of `MKMapItem` objects representing the received places.
    func didReceivePlaces(_ places: [MKMapItem])

    /// Called when an error occurs during a process.
    /// - Parameter error: The error that occurred, or nil if no specific error information is available.
    func didFailWithError(_ error: Error?)

    /// Retrieves the radius as a CLLocationDistance.
    ///
    /// - Returns: The radius as a CLLocationDistance.
    func getRadius() -> CLLocationDistance

}

// MARK: - View Protocols
protocol MapViewProtocol: AnyObject {
    var presenter: MapPresenterProtocol? { get set }

    /// Adds a point annotation to the map at the specified location with a given title.
    ///
    /// - Parameters:
    ///   - location: The `CLLocation` object representing the geographical location where the annotation should be added.
    ///   - title: A `String` representing the title of the annotation.
    func addPointAnnotation(_ location: CLLocation, title: String)

    /// Displays an error message to the user.
    /// /// - Parameter message: A string containing the error message to be shown.
    func showError(message: String)
}

// MARK: - Router Protocols
protocol MapRouterProtocol {

    /// Creates and returns a new instance of the module's main view controller.
    ///
    /// - Returns: A `UIViewController` instance representing the main view of the module.
    static func createModule() -> UIViewController

}

