//
//  MapViewController.swift
//  partyApp
//
//  Created by Yi on 16/12/3.
//  Copyright © 2016年 Yi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    var party: Party?
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let address = party?.address
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address!, completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if ((error) != nil){
                self.createAlert(title: "WARNING!", message: "Unsuccessful mapView because of incorrect address input!")
            }
            if let placemark = placemarks?[0]{
                let coordinates: CLLocationCoordinate2D = placemark.location!.coordinate
                let location = CLLocationCoordinate2DMake(coordinates.latitude, coordinates.longitude)
                
                let span = MKCoordinateSpanMake(0.2, 0.2)
                let region = MKCoordinateRegionMake(location, span)
                self.map.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = location
                annotation.title = self.party?.info
                annotation.subtitle = self.party?.address
                self.map.addAnnotation(annotation)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }

    func createAlert(title:String, message: String){
        let alert = UIAlertController(title:title, message:message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"OK",style:UIAlertActionStyle.default, handler:{(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
            self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
