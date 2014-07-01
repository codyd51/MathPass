#import <Preferences/Preferences.h>

@interface MathPassListController: PSListController {
}
@end

@implementation MathPassListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"MathPass" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
