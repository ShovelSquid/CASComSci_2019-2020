//
//  ViewController.swift
//  FindingXRDS
//
//  Created by Kaelen Cook on 3/23/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let XRDSLatitude = 34.0240892
    let XRDSLongitude = -118.4747321
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let xrdsPoint = MKMapPoint(xrdslocation)
        
        if rect.contains(xrdsPoint) {
            print("Crossroads!")
        }
        else {
            print("no crossroads")
        }
    }
    
}

