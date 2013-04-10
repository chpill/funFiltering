# init of the app, fetch the image, draw the canvas

app = {}
window.app = app

# TODO, dynamically load an image
initCv = ->
  #src = 'assets/images/funkadelic20-20clinton.jpg'
  src = 'assets/images/mountain.jpg'
  #src = 'assets/images/cat.jpg'
  #src = 'assets/images/smoke.jpg'
  #src = 'assets/images/sunset.jpg'
  #src = 'assets/images/leaf.jpg'
  canvas = document.getElementById("cv")
  app.cv = new Canvas(canvas, src)

window.onload = ->
  initCv()
  # initializing event handlers for the buttons
  # of the interface

  document.getElementById("reload").onclick = ->
    app.cv.draw()

  document.getElementById("grayscale").onclick = ->
    filters.testGrayscale(app.cv)

  document.getElementById("invert").onclick = ->
    filters.testInvert(app.cv)

  document.getElementById("redFilter").onclick = ->
    filters.testRedFilter(app.cv)

  document.getElementById("greenFilter").onclick = ->
    filters.testGreenFilter(app.cv)


  document.getElementById("sepia").onclick = ->
    depth = parseInt(document.getElementById("sepiaDepthValue").value)
    filters.testSepia(app.cv, {depth: depth})

  document.getElementById("contrast").onclick = ->
    contrast = parseInt(document.getElementById("contrastValue").value)
    filters.testContrast(app.cv, {contrast: contrast})
