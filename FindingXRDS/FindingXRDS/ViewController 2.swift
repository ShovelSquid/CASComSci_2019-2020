//
//  ViewController.swift
//  FindingXRDS
//
//  Created by Kaelen Cook on 3/23/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    let XRDSLatitude = 34.0240892
    let XRDSLongitude = -118.4747321
    
    let EiffelLatitude = 48.858370
    let EiffelLongitude = 2.294481
    
    let JerusalemLongitude = -82.996216
    let JerusalemLatitude = 40.367474
    
    var locationManager: CLLocationManager!
    var userLocation: CLLocationCoordinate2D?
    
    var c:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        // Do any additional setup after loading the view.
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: XRDSLatitude, longitude: XRDSLongitude))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        
    }

    @IBAction func ZoomOut(_ sender: Any) {
        let factor = 2.0
        zoom(factor)
    }
    
    @IBAction func ZoomIn(_ sender: Any) {
        let factor = 0.5
        zoom(factor)
    }
    
    @IBAction func findXRDS(_ sender: Any) {
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: XRDSLatitude, longitude: XRDSLongitude))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func findTower(_ sender: Any) {
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: EiffelLatitude, longitude: EiffelLongitude))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func findJerusalem(_ sender: Any) {
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: JerusalemLatitude, longitude: JerusalemLongitude))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    
    @IBAction func findMe(_ sender: Any) {
        findButton.setTitle("Finding...", for: .normal)
        c = 1
        locationManager.requestLocation()
    }
    
    
    
    
    func zoom(_ zoomFactor: Double) {
        let region = mapView.region
        let span = region.span
        let newLat = span.latitudeDelta * zoomFactor
        let newLon = span.longitudeDelta * zoomFactor
        let newSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLon)
        let newRegion = MKCoordinateRegion(center: region.center, span: newSpan)
        
        mapView.setRegion(newRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let xrdslocation = CLLocationCoordinate2D(latitude: XRDSLatitude, longitude: XRDSLongitude)
        let towerlocation = CLLocationCoordinate2D(latitude: EiffelLatitude, longitude: EiffelLongitude)
        let holylocation = CLLocationCoordinate2D(latitude: JerusalemLatitude, longitude: JerusalemLongitude)
        
        
        let xrdsPoint = MKMapPoint(xrdslocation)
        let towerPoint = MKMapPoint(towerlocation)
        let holyPoint = MKMapPoint(holylocation)
        

        
        if rect.contains(xrdsPoint) {
            print("xrds!")
            label.textColor! = UIColor.systemTeal
            label.text! = "Our School, Crossroads!"
            label.font = UIFont(name: "Copperplate", size: label.font.pointSize)
            return
        }
        
        if rect.contains(towerPoint) {
            print("lasagna!")
            label.textColor! = UIColor.systemRed
            label.text! = "Eiffel's Rocketship"
            label.font = UIFont(name: "Copperplate", size: label.font.pointSize)
            return
        }
        
        if rect.contains(holyPoint) {
            print("super lasanga!")
            label.textColor! = UIColor.systemGreen
            label.text! = "OHIO!!"
            label.font = UIFont(name: "Zapfino", size: label.font.pointSize)
            return
        }
        if userLocation != nil {
            let userPoint = MKMapPoint(userLocation!)
            if rect.contains(userPoint) {
                label.textColor! = UIColor.purple
                label.text! = "There you are!"
                label.font = UIFont(name: "Copperplate", size: label.font.pointSize)
                return
            }
            else {
                if c == 0 {
                    findButton.setTitle("Find Me", for: .normal)
                }
            }
        }
            
            print("lame")
            label.textColor! = UIColor.black
            label.text! = "Somewhere in the world."
            label.font = UIFont(name: "Copperplate", size: label.font.pointSize)
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        findButton.setTitle("Found!", for: .normal)
        c = 0
        let span = mapView.region.span
        let coords = locations[locations.count - 1].coordinate
        userLocation = coords
        let newRegion = MKCoordinateRegion(center: coords, span: span)
        mapView.setRegion(newRegion, animated: true)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    
}

