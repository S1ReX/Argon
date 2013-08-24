static UIView *_contentView;
static CGRect _originalFrame;

%hook SBAppSwitcherBarView

- (void)viewWillAppear {
	%orig;

	_contentView = MSHookIvar<UIView *>(self, "_scrollView");
	_contentView.alpha = 0;
	_originalFrame = _contentView.frame;
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

%end