# Inspired by "canvas image filtering - HTML5Rocks"

filters = {}
@filters = filters

# This function requires an initialized canvas, with a content rendered
filters.getPixels = (canvas) ->
  img = canvas.img
  canvas.context.getImageData(0, 0, img.width, img.height)

# args will hold additional parameters when needed
filters.filterImage = (filter, canvas, args) ->
  pixels = this.getPixels(canvas)
  filter(pixels, args)
  pixels

# definition of different filters
filters.contrast = (pixels, args) ->
  d = pixels.data
  contrast = args.contrast
  for r, i in d by 4
    #
    average = Math.round( (r + d[i+1] + d[i+2])/3 )
    if average > 127
      r += r/average*contrast
      d[i+1] += d[i+1]/average*contrast
      d[i+2] += d[i+2]/average*contrast
    else
      r -= r/average*contrast
      d[i+1] -= d[i+1]/average*contrast
      d[i+2] -= d[i+2]/average*contrast
    #
  pixels

filters.invert = (pixels) ->
  d = pixels.data
  for r, i in d by 4
    #
    r = -r
    d[i+1] =255 - d[i+1]
    d[i+2] = 255 - d[i+2]
    #
  pixels

filters.sepia = (pixels, args) ->
  d = pixels.data
  depth = args.depth
  for r, i in d by 4
    # r = d[i]
    g = d[i+1]
    b = d[i+2]
    v = (0.2126*r + 0.7152*g + 0.0722*b)
    d[i] = d[i+1] = d[i+2] = v
    # adding the depth to make it sepia
    d[i] = r + depth*2
    d[i+1] = g + depth
    #
  pixels

filters.grayscale = (pixels) ->
  d = pixels.data
  for r, i in d by 4
    # r = d[i]
    g = d[i+1]
    b = d[i+2]
    v = (0.2126*r + 0.7152*g + 0.0722*b)
    d[i] = d[i+1] = d[i+2] = v
    #
  pixels

# experiment with colorspace transformation
filters.redFilter = (pixels) ->
  d = pixels.data
  for r, i in d by 4
    # r = d[i]
    g = d[i+1]
    b = d[i+2]
    if r<50 or g>50 or b>50
      v = (0.2126*r + 0.7152*g + 0.0722*b)
      d[i] = d[i+1] = d[i+2] = v
    #
  pixels



# Test functions
# Call a filter, apply the result on the canvas
# needs the canvas as argument
filters.testGrayscale = (canvas) ->
  idata = filters.filterImage(filters.grayscale, canvas)
  canvas.context.putImageData(idata,0,0)

filters.testInvert = (canvas) ->
  idata = filters.filterImage(filters.invert, canvas)
  canvas.context.putImageData(idata,0,0)

filters.testSepia = (canvas, args) ->
  idata = filters.filterImage(filters.sepia, canvas, args)
  canvas.context.putImageData(idata,0,0)

filters.testContrast = (canvas, args) ->
  idata = filters.filterImage(filters.contrast, canvas, args)
  canvas.context.putImageData(idata,0,0)

filters.testRedFilter = (canvas) ->
  idata = filters.filterImage(filters.redFilter, canvas)
  canvas.context.putImageData(idata,0,0)
