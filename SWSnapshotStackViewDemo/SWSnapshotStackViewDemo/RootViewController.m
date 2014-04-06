////////////////////////////////////////////////////////////////////////////
/*!
 ** \file RootViewController.m
 ** \brief Root View Controller class implementation file
 ** \author Scott White (support@scottwhite.id.au, http://github.com/snwau)
 **
 ** The root (and only) view controller responsible for displaying and
 ** controlling a Snapshot Stack View and associated controls for 
 ** demonstrating its capabilities such as dynamic frame adjustment,
 ** support for all image aspects and the selectable display modes (single
 ** or stack).
 **
 ** Copyright (c) 2012 Scott White. All rights reserved.
 **
 ** Permission is hereby granted, free of charge, to any person obtaining a
 ** copy of this software and associated documentation files (the "Software"),
 ** to deal in the Software without restriction, including without limitation
 ** the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 ** and/or sell copies of the Software, and to permit persons to whom the 
 ** Software is furnished to do so, subject to the following conditions:
 **
 ** The above copyright notice and this permission notice shall be included 
 ** in all copies or substantial portions of the Software.
 **
 ** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 ** OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 ** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 ** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
 ** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 ** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 ** SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 **
 ** Open Source Initiative OSI - The MIT License, 
 ** see <http://www.opensource.org/licenses/MIT/>.
 **
 ** \see RootViewController.h
 */
// Documentation of the code is formatted for use with the documentation
// package Doxygen (see http://www.doxygen.org/).
//
// Project     : Snapshot Stack View Demonstration
// Platform    : iOS SDK 3.0+
//
////////////////////////////////////////////////////////////////////////////

#import "RootViewController.h"


// ********************************************************************** //
// ROOT VIEW CONTROLLER CLASS
// ********************************************************************** //

#pragma mark Root View Controller class

@implementation RootViewController

// ********************************************************************** //
// INSTANCE METHODS

#pragma mark Instance Methods

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}


// ********************************************************************** //

- (void)viewDidLoad
{
  [super viewDidLoad];
  
	// Do any additional setup after loading the view, typically from a nib.

  // Tested with the views contentMode set to redraw (forces call to drawRect:
  // on change of views frame) enabled and disabled.
  self.snapshotStackView.contentMode = UIViewContentModeRedraw;
  
  self.snapshotStackView.displayAsStack = self.displayStackSwitch.on;
  self.snapshotStackView.image = [UIImage imageNamed:@"350D_IMG_3157_20071030w.jpg"];
}

// ********************************************************************** //

/*
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
 */


// ********************************************************************** //

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


// ********************************************************************** //
// ACTION METHODS

#pragma mark Action Methods

- (IBAction)displayStackSwitchValueChanged:(id)sender
{
  self.snapshotStackView.displayAsStack = self.displayStackSwitch.on;
}


// ********************************************************************** //

- (IBAction)imageSelectionValueChanged:(id)sender
{
  switch (self.imageSelection.selectedSegmentIndex)
  {
    case 0:      
      self.snapshotStackView.image = [UIImage imageNamed:@"350D_IMG_3157_20071030w.jpg"];
      break;

    case 1:
      self.snapshotStackView.image = [UIImage imageNamed:@"IMG_5737_081229w7sq.jpg"];
      break;
     
    case 2:
      self.snapshotStackView.image = [UIImage imageNamed:@"IMG_2777_080216w6s.jpg"];
      break;
      
    default:
      self.snapshotStackView.image = nil;
  }
}


// ********************************************************************** //

- (IBAction)sizeSliderValueChanged:(id)sender
{
  CGFloat sizeDelta = self.sizeSlider.maximumValue - self.sizeSlider.value;

  CGRect newFrame = CGRectIntegral(CGRectMake(20 + (sizeDelta / 2.0),
											  20 + (sizeDelta / 2.0),
											  self.sizeSlider.value,
											  self.sizeSlider.value));
  self.snapshotStackView.frame = newFrame;
  
  self.imageFrameSize.text = [NSString stringWithFormat:@"(%.0f x %.0f)",
							  floor(self.sizeSlider.value),
							  floor(self.sizeSlider.value)];
}


// ********************************************************************** //

@end  // @RootViewController

// End of file