# Prevent Mac Mouse from triggering Windows App menubar when in Fullscreen mode

When using Windows App for remote desktop in fullscreen mode, whenever the mouse touches the top of the screen Windows App drops out of fullscreen mode.

<img width="968" alt="image" src="https://github.com/user-attachments/assets/92dc5024-e20f-498c-b0b4-120da950f5c8" />

Annoying!

Keep this script running in a terminal to prevent the mouse from entering the area in Windows App.

Use Mac Command+Tab to switch out of Windows App.

Usage:

```shell
> swift fullscreen.swift
```

Prints mouse coodinates and prevents you from entering the upper bar.

<img width="770" alt="image" src="https://github.com/user-attachments/assets/7f739930-347c-4f66-9083-c397729a8ef0" />

I'm not sure if the 60px restiction with the 65px bump on the top will work for all resolutions but it works well on a Macbook 15". 
Tweak the numbers as desired for your setup.

You might have to add Terminal to your MacOS accessibilty settings (I'm using Alacrity but it's the same)

<img width="522" alt="image" src="https://github.com/user-attachments/assets/83a06f8e-ea23-45c3-bda3-153650cf9008" />
