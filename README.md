# Prevent Mac Mouse from entering Windows App menubar when in Fullscreen mode

When using Windows App for remote desktop in fullscreen mode, whenever the mouse touches the top area Windows App drops out of fullscreen mode.

<img width="968" alt="image" src="https://github.com/user-attachments/assets/92dc5024-e20f-498c-b0b4-120da950f5c8" />

This is really annoying.

Run this script in a terminal to prevent the mouse from entering the area, which keeps Windows App in fullscreen mode.
I use Mac Command+Tab to switch out of Windows App.

Usage:

```shell
> swift fullscreen.swift
```

Prints mouse coodinates and prevents you from entering the upper bar.

<img width="739" alt="image" src="https://github.com/user-attachments/assets/34c65878-1b9f-4cfc-93dd-ebe1e52556c7" />
