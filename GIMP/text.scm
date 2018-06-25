(define (script-fu-text-box inText inFont inFontSize inFontColor inBufferAmount)
  (let*
    (	; create a new image
	(theImageWidth 10)
	(theImageHeight 10)
	(theImage (car
		    (gimp-image-new
		      theImageWidth
		      theImageHeight
		      RGB
		    )
		  )
	)
	(theText)   ; a declaration for the text we create later

	(theBuffer)

	; create a new layer for the image
	(theLayer (car
		    (gimp-layer-new
		      theImage
		      theImageWidth
		      theImageHeight
		      RGB-IMAGE
		      "layer 1"
		      100
		      NORMAL
		    )
		  )
	)
    ) ; end of local variables

    (gimp-image-add-layer theImage theLayer 0)	; add layer to the image
    (gimp-context-set-background '(255 255 255))    ; bg-color
    (gimp-context-set-foreground inFontColor)	    ; fg-color
    (gimp-drawable-fill theLayer BACKGROUND-FILL)  

    (set! theText 
      (car
	(gimp-text-fontname
	  theImage theLayer
	  0 0
	  inText
	  0
	  TRUE
	  inFontSize PIXELS
	  "Sans")
      )
    )
    (set! theImageWidth (car (gimp-drawable-width theText) ) )
    (set! theImageHeight (car (gimp-drawable-height theText) ) )
    (set! theBuffer (* theImageHeight (/ inBufferAmount 100) ) )    ; set buffer size
    ; add twice buffer to Image height and width
    (set! theImageHeight (+ theImageHeight theBuffer theBuffer) )   
    (set! theImageWidth (+ theImageWidth theBuffer theBuffer) )

    (gimp-image-resize theImage theImageWidth theImageHeight 0 0)
    (gimp-layer-resize theLayer theImageWidth theImageHeight 0 0)
    (gimp-layer-set-offsets theText theBuffer theBuffer)    ; center the text within the image

    (gimp-display-new theImage)
    (gimp-image-clean-all theImage)	; clear the dirty flag
    (list theImage theLayer theText)
    (set! theResult (script-fu-text-box
    		  "Some Text"
    		  "Charter"
    		  "30"
    		  '(0 0 0)
    		  "35"
    		)
    )
    (gimp-image-flatten (car theResult))
  )
)

(script-fu-register
  "script-fu-text-box"	; func name
  "Text Box"		; menu label
  "Creates a simple text box, sized to fit around the user's choice of text, font, font size, and color."   ; description
  "Michael Terry"	; author
  "copyright 1997, Michael Terry; 2009, the GIMP Documentation Team"	; copyright notice
  "October 27, 1997"	; date 
  ""			; image type that the script works on
  SF-STRING "Text"  "Text Box"	; a string variable
  SF-FONT   "Font"  "Charter"	; a font variable
  SF-ADJUSTMENT	"Font size" '(50 1 1000 1 10 0 1)   ; a spin-button
  SF-COLOR  "Color" '(0 0 0)	; color variable
  SF-ADJUSTMENT "Buffer amount" '(35 0 100 1 10 1 0)	; a slider
)
(script-fu-menu-register "script-fu-text-box" "<Image>/File/Create/Text")
