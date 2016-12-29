#TextRotator#

Demonstration of drawing and rotating an NSString in iOS.

##Description##

This is a simple project which demonstrates how to both draw an NSString, and then rotate that string. The project uses [Core Graphics.](https://developer.apple.com/reference/coregraphics)

Rotating a string (or any CGRect) is simple to do, but it can be difficult to find good sample code. Much of the sample code out there illustrates complicated examples. By contrast, what's done here is straightforward.

###Rotation###

The key to rotation is as follows:

* Grab the current context
* Save the state
* Perform a series of transforms
* Apply the transforms
* Draw
* Restore the saved state

The code is most easily done in the `drawRect:` method of UIView:

    - (void)drawRect:(CGRect)rect
    {
        // Do what you need to do to setup your NSString (see project)...
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        
        CGAffineTransform transform = CGAffineTransformMakeTranslation(center.x, center.y);
        transform = CGAffineTransformRotate(transform, ([self angle] * M_PI) / 180.0f);
        transform = CGAffineTransformTranslate(transform, -center.x, -center.y);
        
        CGContextConcatCTM(context, transform);
        
        [text drawInRect:textRect withAttributes:attributes];
            
        CGContextRestoreGState(context);
    }

###The application###

The app displays *"Hello, World!"* in the center of the view. Move the slider to rotate the string 180 degrees in either direction. Tap the screen to change the placement of the string. Shake the phone to reset the view to its initial state.

Enjoy!