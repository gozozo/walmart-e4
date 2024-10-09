//
//  MapInteractor.swift
//  walmart-e4
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import CoreLocation
import MapKit

class MapInteractor:NSObject, MapInteractorProtocol {

    var presenter: MapPresenterProtocol?

    private let locationManager = CLLocationManager()

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func getCurrentLocation() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    private func searchForNearbyPlaces(location: CLLocation) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "restaurant"
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: presenter?.getRadius() ?? 1000, longitudinalMeters: presenter?.getRadius() ?? 1000)

        let search = MKLocalSearch(request: request)
        search.start { (response, error)  in
            guard let response = response else {
                self.presenter?.didFailWithError(error)
                return
            }

            self.presenter?.didReceivePlaces(response.mapItems)
        }
    }
}

extension MapInteractor: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            self.searchForNearbyPlaces(location: location)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        presenter?.didFailWithError(error)
        locationManager.stopUpdatingLocation()
    }
}
