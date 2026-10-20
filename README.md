# Image Processing Using Swift

A beginner-friendly project that demonstrates the fundamentals of image
processing in Swift Playgrounds. It explores how to access individual
pixels, inspect RGB colour values, and create simple image filters by
modifying pixel data.

This project accompanies my medium article **[Image Processing Using Swift: A
Beginner's Guide to Image Manipulation in Swift
Playground](https://medium.com/code-like-a-girl/image-processing-using-swift-fa5cd5ffab98)**.

## Features

-   Load and display an image in Swift Playgrounds.
-   Convert a `UIImage` into an `RGBAImage` so individual pixels can be
    accessed and modified.
-   Calculate a pixel's array index from its `(x, y)` coordinates.
-   Change the colour of a selected pixel.
-   Calculate the image's average red, green, and blue channel values.
-   Apply a **red-boosting filter** to intensify pixels that are redder
    than the image average.
-   Apply a **red-attenuation filter** to reduce the intensity of pixels
    that are redder than the image average.
-   Compare the original image with the modified result.

## Requirements

-   Xcode with Swift Playgrounds support, or a compatible Swift
    Playground environment.
-   The `RGBAImage.swift` helper file.
-   The sample image `forest.png`.

The helper file and sample image are referenced in the accompanying
article and its linked GitHub resources.

## Getting Started

1.  Clone or download this repository.
2.  Open the Swift Playground project in a compatible environment.
3.  Add `RGBAImage.swift` to the Playground's **Sources** section.
4.  Add `forest.png` to the Playground's **Resources** section.
5.  Run the Playground and follow the examples to load the image and
    apply the pixel-processing operations.

> The exact setup steps may vary slightly depending on your Xcode and
> Swift Playgrounds version.

## How It Works

### 1. Convert the image to RGBA

The project converts the loaded image into an `RGBAImage`. This
representation makes the image's pixel data accessible for direct
manipulation.

``` swift
var myRGBA = RGBAImage(image: image!)!
```

Make sure the image loaded successfully before force-unwrapping it in
your own code.

### 2. Find a pixel by coordinates

Pixels are stored in a one-dimensional array. For an image whose rows
are stored consecutively, the index for a pixel at `(x, y)` is:

``` swift
let index = y * myRGBA.width + x
```

Use coordinates within the image bounds: `x` must be between `0` and
`width - 1`, and `y` between `0` and `height - 1`.

### 3. Modify a pixel's colour

Each pixel contains red, green, and blue channel values. For example,
the selected pixel can be changed to red:

``` swift
var pixel = myRGBA.pixels[index]
pixel.red = 255
pixel.green = 0
pixel.blue = 0
myRGBA.pixels[index] = pixel
```

### 4. Calculate average colour values

The project loops through the pixels, sums each RGB channel, and divides
each total by the number of pixels. These averages provide a baseline
for the filters.

### 5. Apply colour filters

The red-boosting filter increases the red-channel value for pixels whose
red value is above the image's average. The red-attenuation filter
reduces that difference instead. The calculated values are clamped to
the valid 8-bit channel range (`0...255`) before being assigned.

After processing, convert the modified RGBA image back to a `UIImage` to
display and compare it with the original.

## Learning Goals

By exploring this project, you can learn:

-   How digital images are represented as pixels.
-   How RGB colour channels work.
-   How to map two-dimensional pixel coordinates to an array index.
-   How to traverse and analyse image data.
-   How simple colour filters can be implemented with arithmetic and
    loops.

## Related Article

For the full walkthrough and explanations, read:

**[Image Processing Using Swift --- A Beginner's
Guide](https://medium.com/code-like-a-girl/image-processing-using-swift-fa5cd5ffab98)**

## Contributing

Feel free to fork the repository, experiment with the filter
calculations, or build additional effects such as green-channel
adjustments and other colour transformations. If you contribute, please
describe your changes and include before-and-after examples where
useful.

## License

No license is specified here. Check the repository for an existing
license before reusing or distributing the code.
