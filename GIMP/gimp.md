# Concepts
* layer (shape)
* channel (color: red, green, blue, alpha)
* selection (a grayscale channel)
* path (Bezier paths)
* text
* filter
* drawable
    |-- layers
    |-- channels
    |-- layer masks
    |-- selection


Note:
> Paths do not alter the appearance of the image pixel data unless they are **stroked**.


## Tools
* selection tools
    1. regular shape
	> rectangle
	> ellipse
    2. Lasso
    3. Magic 
* paint tools
    1. pencil
    2. paintbrush
    3. airbrush
* text tool
* path tools
* blend tool (gradient tool)
* transform tools
    1. rotate
    2. scale
    3. perspective
**tool option**

## Layer mode
* normal    E = M
* Dissolve  
* Multiply  E = M * I / 255
* Divide    E = 256 * I/(M+1) 
* Screen    E = 255 - (255 - M) * (255-I) / 255
* Overlay   E = I/255 * (I+(2 * M)/255 * (255-I))
* Dodge	    E = 256 * I / (255 - M + 1)
* Burn	    E = 255 - (256 * (255-I))/(M+1)
* Hard light
* Soft light
* Grain extract	E = I - M + 128
* Grain merge	E = I + M - 128
* Difference	E = |I - M|
* Addition  E = min((M+I), 255)
* Subtract  E = max((I-M), 0)
* Darken only	E = min(M, I)
* Light only	E = max(M, I)
* Hue
* Saturation
* Color
* Value
