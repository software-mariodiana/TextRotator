//
//  ViewController.m
//  TextRotator
//
//  Created by Mario Diana on 12/27/16.
//  Copyright © 2016 Mario Diana. All rights reserved.
//

#import "ViewController.h"
#import "TextRotatorView.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tap:(id)sender
{
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    TextRotatorView *view = (TextRotatorView *)[self view];
    CGPoint location = [tap locationInView:view];
    [view setTextRectCenter:location];
}


- (IBAction)rotate:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    CGFloat degrees = floorf(slider.value);
    TextRotatorView *view = (TextRotatorView *)[self view];
    [view setAngle:degrees];
}


#pragma mark - UIGestureRecognizerDelegate methods

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)touch
{
    if ([[touch view] isEqual:[self view]]) {
        return YES;
    }
    
    // Only the main view itself should respond to touches.
    return NO;
}

@end
