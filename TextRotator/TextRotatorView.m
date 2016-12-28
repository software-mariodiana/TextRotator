//
//  TextRotatorView.m
//  TextRotator
//
//  Created by Mario Diana on 12/27/16.
//  Copyright © 2016 Mario Diana. All rights reserved.
//

#import "TextRotatorView.h"

@implementation TextRotatorView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2;
    center.y = bounds.origin.y + bounds.size.height / 2;
    
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
    
    [text drawInRect:textRect withAttributes:attributes];
}

@end
