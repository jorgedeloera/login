Framer.Device = new Framer.DeviceView()
Framer.Device.setupContext()

bgLayer = new BackgroundLayer
	backgroundColor: "#59BCAE"

Layers =
    app: new Layer
        image: 'images/APP.png'
        width: 92
        height: 58
        x: Align.center
        y: 132
    user: new Layer
        image: 'images/Group 2.png'
        width: 290
        height: 48
        x: Align.center
        y: 238
    pass: new Layer
        image: 'images/Group 3.png'
        width: 290
        height: 48
        x: Align.center
        y: 302
    log: new Layer
        image: 'images/Group 4.png'
        width: 290
        height: 48
        x: Align.center
        y: 382
    load: new Layer
        image: 'images/Mask Group 1.png'
        width: 96
        height: 96
        x: Align.center
        y: Align.bottom(96)
    home: new Layer
        size: Screen.size
        backgroundColor: '#FFFFFF'
    welcome: new Layer
        image: 'images/Group 6.png'
        width: 290
        height: 138
        x: Align.center
        y: Align.center
    footer: new Layer
        image: 'images/footer.png'
        width: Screen.width
        height: 55
        y: Align.bottom(55)

Layers.app.opacity = 0
Layers.app.y = Layers.app.y - 50
Layers.load.scale = 0.5
Layers.home.visible = false
Layers.home.opacity = 0
Layers.welcome.visible = false
Layers.welcome.opacity = 0

for i in ['user', 'pass', 'log']
    Layers[i].y = Layers[i].y + 230
    Layers[i].opacity = 0

Layers.app.animate
    properties:
        opacity: 1
        y: Layers.app.y + 50
    delay: 0.4
    time: 0.8

for i in ['user', 'pass', 'log']
    Layers[i].animate
        properties:
            y: Layers[i].y - 230
            opacity: 1
        delay: Layers[i].y / 1000 + 0.5
        time: 0.9

Layers.log.on Events.Click, () ->
    Layers.app.animate
        properties:
            opacity: 0
        time: 0.5
    
    for i in ['user', 'pass', 'log']
        Layers[i].animate
            properties:
                y: Layers[i].y - 230
                opacity: 0
            delay: Layers[i].y / 1000
            time: 0.9

    Layers.load.animate
        properties:
            y: Align.center
            scale: 1
        delay: 0.4
        time: 0.9
    
    Layers.load.animate
        properties:
            rotation : 360
        repeat: 10
        curve: 'linear'
        time: 0.85