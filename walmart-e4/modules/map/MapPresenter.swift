//
//  MapPresenter.swift
//  walmart-e4
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import MapKit
import CoreLocation

class MapPresenter: MapPresenterProtocol {
    
    weak var view: MapViewProtocol?
    var interactor: MapInteractorProtocol?
    var router: MapRouterProtocol?
    
    private let regionRadius: CLLocationDistance = 4000
    
    func locationManagerInit() {
        interactor?.requestLocationPermission()
        interactor?.getCurrentLocation()
    }
    
    func didReceivePlaces(_ places: [MKMapItem]) {
        for item in places {
            view?.addPointAnnotation(CLLocation(latitude: item.placemark.coordinate.latitude, longitude: item.placemark.coordinate.longitude), title: item.placemark.name ?? "")
        }
    }
    
    func didFailWithError(_ error: Error?) {
        view?.showError(message: error?.localizedDescription ?? "Unknown error")
    }
    
    func getRadius() -> CLLocationDistance {
        return regionRadius
    }
}
