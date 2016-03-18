//
//  NFPlaceholderTextView.m
//  NFPlaceholderTextView
//
//  Created by jiangpengcheng on 18/3/16.
//  Copyright © 2016年 ninefivefly. All rights reserved.
//

#import "NFPlaceholderTextView.h"

@implementation NFPlaceholderTextView

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)dealloc {
    _placeHolder = nil;
    _placeHolderTextColor = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - Setters
- (void)setPlaceHolder:(NSString *)placeHolder {
    
    if([placeHolder isEqualToString:_placeHolder]) {
        return;
    }
    
    _placeHolder = placeHolder;
    [self setNeedsDisplay];
}

- (void)setPlaceHolderTextColor:(UIColor *)placeHolderTextColor {
    
    if([placeHolderTextColor isEqual:_placeHolderTextColor]) {
        return;
    }
    
    _placeHolderTextColor = placeHolderTextColor;
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    
    [super setText:text];
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    
    [super setFont:font];
    [self setNeedsDisplay];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    [super setTextAlignment:textAlignment];
    [self setNeedsDisplay];
}

#pragma mark - Life cycle

- (void)setup {
    // add notification.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didReceiveTextDidChangeNotification:) name:UITextViewTextDidChangeNotification object:nil];
    
    // set placehoder text color.
    _placeHolderTextColor = [UIColor lightGrayColor];
}

- (void)didReceiveTextDidChangeNotification:(NSNotification *)notification {
    [self setNeedsDisplay];
}


#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    if([self.text length] == 0 && self.placeHolder) {
        //show placeholder text.
        NSMutableDictionary* attributes = [[NSMutableDictionary alloc]init];
        [attributes setObject:self.font ? self.font : [UIFont systemFontOfSize:15] forKey:NSFontAttributeName];
        [attributes setObject:self.placeHolderTextColor ? self.placeHolderTextColor : [UIColor lightGrayColor] forKey:NSForegroundColorAttributeName];
        [self.placeHolder drawAtPoint:CGPointMake(10, 7) withAttributes:attributes];
    }
}

@end
