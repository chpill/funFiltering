## Fun with filters

Experimenting with the capabilities of the canvas in term of image rendering and filtering

# Dependencies

* Coffeescript

# Install

Just clone the repo and compile the ".coffee" files
```shell
coffee -c assets/js/*.coffee
```

# Run

Because of CORS, you won't be able to get the pixels from the canvas
if you try to access the app with file://
Use whatever server you are confortable with. I personnaly go with:
```shell
python -m SimpleHTTPServer
```

# TODO

* tests...
* add some CSS and make an UI that doesn't make you want to rip out your eyeballs
