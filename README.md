# zoom_pinch_overlay
<img src="https://forthebadge.com/images/badges/built-with-love.svg" height="28px" />&nbsp;&nbsp;<img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge" height="28px" />&nbsp;&nbsp;<a href="https://pub.dev/packages/google_nav_bar"><img src="https://img.shields.io/pub/v/google_nav_bar.svg?style=for-the-badge" height="28px" /></a>

An instagram style pinch and zoom widget for all platform completely written in pure dart!

![](https://media.giphy.com/media/gNSbI6IlqtZASEFkN4/giphy.gif)

All other "zoom_pinch" package doesnt didnt work for me because it doesnt appear on top of all other widgets which 
was an issue to one of my projects. This package solves that problem by introducing a OverlayEntry so that it appears on top
of all other widgets.

Credit to [@billylev](https://github.com/billylev) for creating this package.

## Getting Started

Just wrap your widget that you want to be able to zoom in a `ZoomOverlay`

This is the values used in the video.


<br><br/>

```
ZoomOverlay(
    minScale: 1, // So 1 here means you cant zoom out.
    maxScale: 1.7, // 1.7x zoom is the largest
    twoTouchOnly: true,
    child: Image.memory(
         imageData,
         fit: BoxFit.fitWidth,
    ),
),
```
<br><br/>
## Documentations

|parameter  |documentation  |
|---------|---------|
|`minScale`|specifies the minimum multiplier it can scale outwards.|
|`maxScale`|specifies the maximum multiplier the user can zoom inwards.|
|`twoTouchOnly`|specifies wither the zoom is enabled only with two fingers on the screen. Defaults to `false`.|
|`child`| A widget to make zoomable.|

<br><br/>

## Medium blog post

Read the accompanying article [here](https://billyleverington.medium.com/building-instagrams-pinch-zoom-and-drag-a-photo-in-flutter-110f29a79bb7) for more info about this package.

