//
//  SwiftMapView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/29.
//

import SwiftUI
import UIKit
import NMapsMap

struct NaverMapView: UIViewRepresentable {
    @ObservedObject var viewModel = MapSceneViewModel()
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.showScaleBar = false
        view.showLocationButton = true
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        return view
    }
    
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}
}

class MapSceneViewModel: ObservableObject {
    
}
