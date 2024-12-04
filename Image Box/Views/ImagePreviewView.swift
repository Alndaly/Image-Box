//
//  ImagePreviewView.swift
//  Image Box
//
//  Created by Kinda on 2024/11/29.
//

import SwiftUI

struct ImagePreviewView: View {
    @Binding var isPresented: Bool
    let image: UIImage

    @State private var scale: CGFloat = 1.0 // 缩放比例

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // 背景色

            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .scaleEffect(scale) // 缩放效果
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = value.magnitude // 动态更新缩放比例
                        }
                        .onEnded { _ in
                            if scale < 1.0 { scale = 1.0 } // 最小缩放比例限制
                        }
                )
                .onTapGesture {
                    isPresented = false // 点击关闭预览
                }

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false // 点击关闭预览
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}
