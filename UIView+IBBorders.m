//
//  UIView+IBBorders.m
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

#import "UIView+IBBorders.h"

inline static CGFloat OnePixelAsCGFloat()
{
    return 1.f / [UIScreen mainScreen].scale;
}

@interface IBBorderView : UIView

@end

@implementation IBBorderView

@end


@implementation UIView (IBBorders)

- (void)ib_addBorderToEdge:(IBEdge)edge
                headMargin:(CGFloat)headMargin
                tailMargin:(CGFloat)tailMargin
               borderColor:(UIColor *)borderColor
{
    IBBorderView *borderView = [[IBBorderView alloc] initWithFrame:CGRectMake(0.f, 0.f, 1.f, 1.f)];
    [borderView setBackgroundColor:borderColor];
    [self addSubview:borderView];
    
    //constraints
    [borderView setTranslatesAutoresizingMaskIntoConstraints:NO];
    switch (edge) {
        case IBEdgeTop:
        {
            [borderView ib_addHeightConstraint:OnePixelAsCGFloat()];
            [borderView ib_addTopConstraintToSuperViewWithMargin:0.f];
            [borderView ib_addLeadConstraintToSuperViewWithMargin:headMargin];
            [borderView ib_addTrailingConstraintToSuperViewWithMargin:-tailMargin];
            
            break;
        }
        case IBEdgeLeft:
        {
            [borderView ib_addWidthConstraint:OnePixelAsCGFloat()];
            [borderView ib_addTopConstraintToSuperViewWithMargin:headMargin];
            [borderView ib_addLeadConstraintToSuperViewWithMargin:0.f];
            [borderView ib_addBottomConstraintToSuperViewWithMargin:-tailMargin];
            
            break;
        }
        case IBEdgeRight:
        {
            [borderView ib_addWidthConstraint:OnePixelAsCGFloat()];
            [borderView ib_addTopConstraintToSuperViewWithMargin:headMargin];
            [borderView ib_addTrailingConstraintToSuperViewWithMargin:0.f];
            [borderView ib_addBottomConstraintToSuperViewWithMargin:-tailMargin];
            
            break;
        }
        case IBEdgeBottom:
        {
            [borderView ib_addHeightConstraint:OnePixelAsCGFloat()];
            [borderView ib_addLeadConstraintToSuperViewWithMargin:headMargin];
            [borderView ib_addTrailingConstraintToSuperViewWithMargin:-tailMargin];
            [borderView ib_addBottomConstraintToSuperViewWithMargin:0.f];
            
            break;
        }
        default: {
            break;
        }
    }
}

- (void)ib_removeBorders
{
    for (UIView *borderView in self.subviews)
    {
        if ([borderView isKindOfClass:[IBBorderView class]])
        {
            [borderView removeFromSuperview];
        }
    }
}

@end

@implementation UIView (IBCustomConstraints)

- (NSLayoutConstraint *)ib_addHeightConstraint:(CGFloat)height
{
    NSLayoutConstraint *heightConstraint =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.f
                                  constant:height];
    [self addConstraint:heightConstraint];
    return heightConstraint;
}

- (NSLayoutConstraint *)ib_addWidthConstraint:(CGFloat)width
{
    NSLayoutConstraint *widthConstraint =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.f
                                  constant:width];
    [self addConstraint:widthConstraint];
    return widthConstraint;
}

- (NSLayoutConstraint *)ib_addLeadConstraintToSuperViewWithMargin:(CGFloat)margin
{
    NSLayoutConstraint *leadConstraint =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.f
                                  constant:margin];
    [self.superview addConstraint:leadConstraint];
    return leadConstraint;
}

- (NSLayoutConstraint *)ib_addTrailingConstraintToSuperViewWithMargin:(CGFloat)margin
{
    NSLayoutConstraint *trailingConstraint =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1.f
                                  constant:margin];
    [self.superview addConstraint:trailingConstraint];
    return trailingConstraint;
}

- (NSLayoutConstraint *)ib_addTopConstraintToSuperViewWithMargin:(CGFloat)margin
{
    NSLayoutConstraint *topConstraint =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.f
                                  constant:margin];
    [self.superview addConstraint:topConstraint];
    return topConstraint;
}

- (NSLayoutConstraint *)ib_addBottomConstraintToSuperViewWithMargin:(CGFloat)margin
{
    NSLayoutConstraint *trailingConstraint =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.f
                                  constant:margin];
    [self.superview addConstraint:trailingConstraint];
    return trailingConstraint;
}

@end
