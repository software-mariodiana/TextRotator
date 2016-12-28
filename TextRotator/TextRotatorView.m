//
//  TextRotatorView.m
//  TextRotator
//
//  Created by Mario Diana on 12/27/16.
//  Copyright © 2016 Mario Diana. All rights reserved.
//

#import "TextRotatorView.h"

@interface TextRotatorView ()
{
    BOOL _initialDraw;
}

@end

@implementation TextRotatorView

@synthesize textRectCenter = _textRectCenter;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _angle = 0.0f;
        _textRectCenter = CGPointMake(-1, -1);
        _initialDraw = YES;
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGPoint center = [self textRectCenter];
    
    NSString *text = @"Hello, World!";
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    NSDictionary *attributes = @{NSFontAttributeName: font};
    
    // Documentation: This method returns fractional sizes; to use a returned size to size
    // views, you must raise its value to the nearest higher integer using the ceil function.
    CGSize size = [text sizeWithAttributes:attributes];
    size = CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    CGRect textRect = [text boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attributes
                                         context:nil];
    
    textRect.origin.x = center.x - (textRect.size.width / 2.0);
    textRect.origin.y = center.y - (textRect.size.height / 2.0);
    
    [[UIColor blackColor] setFill];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(center.x, center.y);
    transform = CGAffineTransformRotate(transform, ([self angle] * M_PI) / 180.0f);
    transform = CGAffineTransformTranslate(transform, -center.x, -center.y);
    
    CGContextConcatCTM(context, transform);
    
    [text drawInRect:textRect withAttributes:attributes];
        
    CGContextRestoreGState(context);
}


- (void)setAngle:(CGFloat)angle
{
    _angle = angle;
    [self setNeedsDisplay];
}


- (CGPoint)textRectCenter
{
    if (_initialDraw) {
        CGRect bounds = [self bounds];
        
        CGPoint center;
        center.x = bounds.origin.x + bounds.size.width / 2;
        center.y = bounds.origin.y + bounds.size.height / 2;
        
        _textRectCenter = center;
        _initialDraw = NO;
    }
    
    return _textRectCenter;
}


- (void)setTextRectCenter:(CGPoint)textRectCenter
{
    _textRectCenter = textRectCenter;
    [self setNeedsDisplay];
}

@end
