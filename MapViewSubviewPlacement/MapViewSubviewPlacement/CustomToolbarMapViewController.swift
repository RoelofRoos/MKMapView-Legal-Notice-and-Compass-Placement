//
//  CustomToolbarMapViewController.swift
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


// Custom map view controller with custom layout guides
final class CustomToolbarMapViewController: MapViewController {
    @IBOutlet weak var lowerToolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lowerToolbar.setItems(lowerToolbarItems(), animated: false)
    }

    override var bottomLayoutGuide: UILayoutSupport {
        return LayoutGuide(length: 44.0)
    }
    
    override var topLayoutGuide: UILayoutSupport {
        return LayoutGuide(length: 64.0)
    }
}
