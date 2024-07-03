//
//  ProgressSliderView.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 2.07.2024.
//

import SwiftUI

struct ProgressSliderView: UIViewRepresentable {
    
    @Binding var value: Double
    @Binding var maximumValue: Double
    @Binding var isUserInteractionEnabled: Bool
    @Binding var playableProgress: Double
    var updateValueHandler: (Double) -> Void
    
    @State private var touching = false
    
    init(value: Binding<Double>,
         maximumValue: Binding<Double>,
         isUserInteractionEnabled: Binding<Bool>,
         playableProgress: Binding<Double>,
         updateValueHandler: @escaping (Double) -> Void) {
        self._value = value
        self._maximumValue = maximumValue
        self._isUserInteractionEnabled = isUserInteractionEnabled
        self._playableProgress = playableProgress
        self.updateValueHandler = updateValueHandler
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIProgressSlider {
        let slider = UIProgressSlider()
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateValue(sender:)),
            for: .valueChanged)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.startTouch(sender:)),
            for: .touchDown)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.endTouch(sender:)),
            for: .touchUpInside)
        
        return slider
    }
    
    func updateUIView(_ uiView: UIProgressSlider, context: Context) {
        if !touching {
            uiView.value = Float(value)
        }
        uiView.maximumValue = Float(maximumValue)
        uiView.isUserInteractionEnabled = isUserInteractionEnabled
        uiView.playableProgress = Float(playableProgress)
        uiView.setNeedsDisplay()
    }
    
    class Coordinator: NSObject {
        var view: ProgressSliderView
        
        init(_ view: ProgressSliderView) {
            self.view = view
        }
        
        @objc
        func updateValue(sender: UIProgressSlider) {
            view.updateValueHandler(Double(sender.value))
        }
        
        @objc
        func startTouch(sender: UIProgressSlider) {
            view.touching = true
        }
        
        @objc
        func endTouch(sender: UIProgressSlider) {
            view.touching = false
        }
    }
}
