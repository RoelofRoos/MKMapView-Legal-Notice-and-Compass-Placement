//
//  MapViewController.swift
//
//  This source file is part of the MapViewSubviewPlacement example.
//  The example shows how the postions of the legal notice
//  and the compass on a MKMapView can be changed.
//
//
//  Licensed under MIT License
//
//  Copyright (c) 2016 Roelof Roos. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import UIKit
import MapKit


// The basic map view controller, for use within a UINavagationController instance, with a 'full view' MKMapView and support for a lower toolbar with a segmented button with segements for 'Map' and 'Satellite'
class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    // Change the map appearance to 'standard' or 'hybrid'
    @IBAction func indexChanged(segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        default:
            break;
        }
    }
    
    // Create a toolbar items so a segmented button appears with segements for 'Map' and 'Satellite'
    func lowerToolbarItems() -> Array<UIBarButtonItem> {
        let mapSatelliteSegmentedControl = UISegmentedControl(items: ["Map", "Satellite"])
        mapSatelliteSegmentedControl.frame = CGRectMake(0.0, 0.0, 280.0, 28.0)
        mapSatelliteSegmentedControl.selectedSegmentIndex = 0
        mapSatelliteSegmentedControl.addTarget(self, action: #selector(MapViewController.indexChanged(_:)), forControlEvents: .ValueChanged)
        
        let segmentedControlButtonItem = UIBarButtonItem(customView: mapSatelliteSegmentedControl)
        let flexibleSpaceButtonItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        return [flexibleSpaceButtonItem, segmentedControlButtonItem, flexibleSpaceButtonItem]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if navigationController?.toolbar != nil {
            setToolbarItems(lowerToolbarItems(), animated: false)
        }
    }
}
