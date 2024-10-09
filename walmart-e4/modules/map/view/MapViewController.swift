//
//  MapViewController.swift
//  walmart-e4
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MapViewProtocol {
    
    var presenter: MapPresenterProtocol?
    
    @IBOutlet private weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.locationManagerInit()
    }
    
    func addPointAnnotation(_ location: CLLocation, title: String) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: presenter?.getRadius() ?? 1000, longitudinalMeters: presenter?.getRadius() ?? 1000)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = title
        mapView.addAnnotation(annotation)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
