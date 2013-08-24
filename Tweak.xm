#import <UIKit/UIKit.h>
#import <substrate.h>

@interface SBIconView : UIView
@end

@interface SBAppSwitcherBarView : UIView
- (id)displayIdentifiers;
- (id)visibleIconViewForDisplayIdentifier:(id)arg1;
@end

static float duration = 0.3f;
static float delayInterval = 0.2f;

static BOOL staggered = YES;

%hook SBAppSwitcherBarView

- (void)viewWillAppear {
	%orig;

	if (staggered)
	{
		int firstVisible = MSHookIvar<int>(self, "_firstVisibleIconIndex");
		int lastVisible = MSHookIvar<int>(self, "_lastVisibleIconIndex");

		float delay = 0.0f;
		for (int i = firstVisible; i <= lastVisible; i++)
		{
			NSString *identifier = [[self displayIdentifiers] objectAtIndex:i];
			SBIconView *iconView = [self visibleIconViewForDisplayIdentifier:identifier];

			CGRect oldRect = iconView.frame;
			CGRect newRect = oldRect;
			newRect.origin.y -= self.frame.size.height;
			iconView.frame = newRect;

			[UIView beginAnimations:nil context:NULL];
			[UIView setAnimationDuration:duration];
			[UIView setAnimationDelay:delay];
			iconView.frame = oldRect;
			[UIView commitAnimations];

			delay += delayInterval;
		}
	}
	else
	{
		UIView *_contentView = MSHookIvar<UIView *>(self, "_scrollView");
		_contentView.alpha = 0;
		CGRect _originalFrame = _contentView.frame;
		_contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, _contentView.frame.origin.y - _contentView.frame.size.height);

		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.5];
		_contentView.frame = _originalFrame;
		[UIView commitAnimations];

		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.8];
		_contentView.alpha = 1;
		[UIView commitAnimations];
	}
}

%end