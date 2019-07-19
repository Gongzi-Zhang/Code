# Pad
* A pad is contained in a canvas; a pad may contain other pads 
  (unlimited pad hierarchy)
* a pad is a linked list of primitives of any type 
  (grphics, histograms, detectors, tracks, etc)
* adding a new element into a pad is in general performed by the 
  Draw member function of the object classes. For example, in case
  of a histogram, the Draw() operation only stores a reference to 
  the histogram, not a graphical representation of this hist. 
  When the mouse is used to change (say the bin content), the bin
  content of the original histogram is changed.
* The effective drawing is performed when the canvas receives a 
  signal to be painted. This signal is generally sent when typing 
  <CR> in the **command input** or when a graphical operation has
  been performed on one of the pads of this canvas. When a 
  Canvas/Pad is repainted, the member function Patin for all objects
  in the Pad linked list is invoked.


pad: list of primitives
