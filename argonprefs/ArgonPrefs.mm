#import <Preferences/Preferences.h>

@interface ArgonPrefsListController: PSListController {
}
@end

@implementation ArgonPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ArgonPrefs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
