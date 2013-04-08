# init of the canvas rendering context
# simple drawing to provide a background
class Canvas
  constructor: (domElement, imgSrc)->
    @context = domElement.getContext("2d")
    @el = domElement
    @img = new Image
    @img.src = imgSrc
    @img.onload = =>
      cv = new Canvas(domElement, @img)
      #adjust the canvas' size to the image
      cv.el.width = @img.width
      cv.el.height = @img.height
      @.draw()

  # draw some colored rectangles in the canvas...
  draw: ->
    @context.drawImage(@img ,0 ,0)

@Canvas = Canvas
