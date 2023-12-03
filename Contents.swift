
//: Playground - noun: a place where people can play

import UIKit

let originalImage = UIImage(named: "forest.png")
var myRGBA = RGBAImage(image: originalImage!)!

//1 Practice Process the image!
// get the index at coordinate (8,7) and change the pixel at that index to red
var myRGBA = RGBAImage(image: originalImage!)!

let x=8;
let y=7;

let index = y * myRGBA.width + x
var pixel=myRGBA.pixels[index]

pixel.red
pixel.green
pixel.blue
pixel.red=255
pixel.green=0
pixel.blue=0

myRGBA.pixels[index] = pixel
let newImage = myRGBA.toUIImage()
Display original and modified images
originalImage
newImage

// find the average intensities of the entire image

var totalRed=0
var totalGreen=0
var totalBlue=0

for y in 0..<myRGBA.height{
    for x in 0..<myRGBA.width{
        
        let index = y * myRGBA.width + x
        var pixel=myRGBA.pixels[index]
        
        totalRed += Int(pixel.red)
        totalGreen += Int(pixel.green)
        totalBlue += Int(pixel.blue)
    }
}

let count = myRGBA.width * myRGBA.height
let avgRed = totalRed/count
let avgGreen = totalGreen/count
let avgBlue = totalBlue/count


// apply a red boosting filter

for y in 0..<myRGBA.height{
    for x in 0..<myRGBA.width{
        let index = y * myRGBA.width + x
        var pixel=myRGBA.pixels[index]
        let redDiff = Int(pixel.red) - avgRed

        if(redDiff>0){
            pixel.red = UInt8(max(0,min(255, avgRed + redDiff*5)))
            myRGBA.pixels[index] = pixel
        }
    }
}

let modifiedImage = myRGBA.toUIImage()

// visualize the original and modified image
originalImage

modifiedImage

