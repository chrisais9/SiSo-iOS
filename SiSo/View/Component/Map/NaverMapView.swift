//
//  SwiftMapView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/29.
//

import SwiftUI
import UIKit
import NMapsMap
import CoreLocation

class LocationService : NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    var completionHandler: ((CLLocationCoordinate2D) -> (Void))?
    
    override init() {
        super.init()
        //CLLocationManager의 delegate 설정
        manager.delegate = self
        //manager.desiredAccuracy = kCLLocationAccuracyBest
        //위치 정보 승인 요청
        manager.requestWhenInUseAuthorization()
    }
    
    var isLocationServiceEnabled: Bool {
        CLLocationManager.locationServicesEnabled()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    //위치 정보 요청 - 정보 요청이 성공하면 실행될 completionHandler를 등록
    func requestLocation(completion: @escaping ((CLLocationCoordinate2D?) -> (Void))) {
        completionHandler = completion
        manager.requestLocation()
        completion(manager.location?.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

struct NaverMapView: UIViewRepresentable {
    @ObservedObject var viewModel = MapSceneViewModel()
    
    var locationService: LocationService = LocationService()
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        
        let view = NMFNaverMapView()
        
        view.showZoomControls = false
        view.showScaleBar = false
        view.showLocationButton = true
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        if locationService.isLocationServiceEnabled {
            locationService.requestLocation { location in
                guard let location = location else { return }
                
                
                let range = NMFCircleOverlay()
                range.center = NMGLatLng(from: location)
                range.radius = 1000
                range.fillColor = UIColor.black.withAlphaComponent(0.3)
                range.outlineWidth = 1
                range.outlineColor = UIColor.gray
                range.mapView = view.mapView
                
                
                let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.latitude, lng: location.longitude))
//                cameraUpdate.animation = .easeIn
                view.mapView.moveCamera(cameraUpdate)
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        
    }
}

class MapSceneViewModel: ObservableObject {
    
}
