//
//  UIView+Borders.m
//
//  Created by Ismail Bozkurt on 19/07/2015.
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Ismail Bozkurt
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, IBEdge) {
    IBEdgeTop,
    IBEdgeLeft,
    IBEdgeRight,
    IBEdgeBottom
};

@interface UIView (IBBorders)

/**
 @abstract adds 1 px margin to edges.
 @param edge edge of the view.
 @param headMargin head margin of the border.
 @param tailMargin tail margin of the border.
 @param borderColor border view color
 */
- (void)ib_addBorderToEdge:(IBEdge)edge
                headMargin:(CGFloat)headMargin
                tailMargin:(CGFloat)tailMargin
               borderColor:(UIColor *)borderColor;

/**
 @abstract removes all border views.
 */
- (void)ib_removeBorders;

@end

@interface UIView (IBCustomConstraints)

/**
 @abstract adds height constraint to the view.
 @param height constraint height
 @return created constaint
 */
- (NSLayoutConstraint *)ib_addHeightConstraint:(CGFloat)height;

/**
 @abstract adds width constraint to the view.
 @param width constraint width
 @return created constaint
 */
- (NSLayoutConstraint *)ib_addWidthConstraint:(CGFloat)width;

/**
 @abstract adds lead constraint to the view and it's superview.
 @param width constraint width
 @return created constaint
 @warning Be sure to add self view as subview before calling this method.
 */
- (NSLayoutConstraint *)ib_addLeadConstraintToSuperViewWithMargin:(CGFloat)margin;

/**
 @abstract adds trailing constraint to the view and it's superview.
 @param width constraint width
 @return created constaint
 @warning Be sure to add self view as subview before calling this method.
 */
- (NSLayoutConstraint *)ib_addTrailingConstraintToSuperViewWithMargin:(CGFloat)margin;

/**
 @abstract adds top constraint to the view and it's superview.
 @param width constraint width
 @return created constaint
 @warning Be sure to add self view as subview before calling this method.
 */
- (NSLayoutConstraint *)ib_addTopConstraintToSuperViewWithMargin:(CGFloat)margin;

/**
 @abstract adds bottom constraint to the view and it's superview.
 @param width constraint width
 @return created constaint
 @warning Be sure to add self view as subview before calling this method.
 */
- (NSLayoutConstraint *)ib_addBottomConstraintToSuperViewWithMargin:(CGFloat)margin;

@end
