////////////////////////////////////////////////////////////////////////////
/*!
 ** \file SWSnapshotStackView.h
 ** \brief Snapshot Stack Image View class definition file
 ** \author Scott White (support@scottwhite.id.au, http://github.com/snwau)
 **
 ** Snapshot Stack View provides an easy means of decorating your UIImage's
 ** of any aspect ratio with a rendered matte frame and associated drop 
 ** shadow. It also may render your image to look as though it is the top 
 ** photograph (or snapshot) within a stack of shots.
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
 ** MIT License, see <http://www.opensource.org/licenses/MIT/>.
 **
 ** \see SNWSnapshotStackView.m
 */
// Documentation of the code is formatted for use with the documentation
// package Doxygen (see http://www.doxygen.org/).
//
// Project     : iOS Common Components
// Component   : GUI/Views
// Platform    : iOS SDK 3.1+
//
////////////////////////////////////////////////////////////////////////////

@import UIKit;


// ********************************************************************** //
// TYPE DEFINITIONS
// ********************************************************************** //

//! Snapshot Position data structure
/*!
  Defines the centre position and angle of rotation about the centre of
  a snapshot.  Multiple snapshots at slightly varying positions then form
  a stack.
  
  Structure stores pre-calculated positions (which in future may be
  randomised upon initialisation of the view if configured to do so),
  which also allows the pre-calculation of the bounding rectangles of
  the snapshots in their specified positions (rotated and off-centre).
*/
typedef struct
{
  //! Centre point of rectangle (currently unused)
  //! Had thoughts of randomising and offsetting the centre points of
  //! underlying snapshots in the stack within a small radius of the views
  //! centre for make their placement look a little more adhoc and hence
  //! more natural. May update to make this functionality optional in the
  //! future.
  //CGPoint centre;
  
  //! Angle of rotation about the centre point, positive angle clockwise,
  //! negative angle counter-clockwise, specified in degrees.
  CGFloat angleRotation;
  
  //! Calculated size of bounding rectangle after rotation, as width and
  //! height protude outside the non-rotated base rectangle.  The bounding
  //! rectangle size is used to determine the required scaling to fit the
  //! snapshot within the views frame.
  CGSize boundingRectSize;
}
SnapshotPosition_t;


// ********************************************************************** //
// SNAPSHOT STACK VIEW CLASS
// ********************************************************************** //

#pragma mark Snapshot Stack View class

//! Snapshot Stack Image View
@interface SWSnapshotStackView : UIView 


// ********************************************************************** //
// PROPERTIES

#pragma mark Properties

//! Display as a stack of multiple snapshots
/*!
    Display a stack of snapshots (YES) with the image provided within the
    image property as the top most snapshot, othwerwise display image as
    a single snapshot (NO).
 */
@property (nonatomic, assign) BOOL displayAsStack;

//! Image to display within the snapshot stack view
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeWidth;
@property (nonatomic, assign) CGRect imageFrame;


// ********************************************************************** //

@end  // @SWSnapshotStackView

// ********************************************************************** //

// End of File
