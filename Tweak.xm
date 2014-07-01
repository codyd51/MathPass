#import <UIKit/UIKit.h>

#define kSettingsPath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.phillipt.mathpass.plist"]

@interface SBDeviceLockController : UIViewController

- (NSString *)getCurrentPasscode;

@end

NSMutableDictionary *prefs = nil;
BOOL enabled = nil;
int difficulty = nil;
NSString *timer = nil;
id firstNum = nil;
id secondNum = nil;
NSMutableArray *numbersArray = nil;
UILabel *label = nil;
NSString *firstNumString = nil;
NSString *secondNumString = nil;
int newPassValue = nil;
NSString *newPass = nil;
NSString *padPass = @"00";
NSString *firstLabelString = nil;
NSString *secondLabelString = nil;
BOOL unlockOnce = FALSE;
NSTimer *timer1 = [[NSTimer alloc] init];

%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {

	%orig;
	unlockOnce = TRUE;

}

%end

%hook SBDeviceLockController

- (BOOL)attemptDeviceUnlockWithPassword:(NSString *)passcode appRequested:(BOOL)requested {

	if (![[prefs objectForKey:@"enabled"] boolValue]) {

        return %orig;

    }

    if ([passcode isEqual:padPass]) {

		return TRUE;

	}

	return %orig;

}

%end

%hook SBUIPasscodeLockViewWithKeypad

    - (id)statusTitleView {

                label = MSHookIvar<UILabel *>(self, "_statusTitleView");

                if ([[firstNum stringValue] isEqual:@"1"]) {firstLabelString = @"One";}
                else if ([[firstNum stringValue] isEqual:@"2"]) {firstLabelString = @"Two";}
                else if ([[firstNum stringValue] isEqual:@"3"]) {firstLabelString = @"Three";}
                else if ([[firstNum stringValue] isEqual:@"4"]) {firstLabelString = @"Four";}
                else if ([[firstNum stringValue] isEqual:@"5"]) {firstLabelString = @"Five";}
                else if ([[firstNum stringValue] isEqual:@"6"]) {firstLabelString = @"Six";}
                else if ([[firstNum stringValue] isEqual:@"7"]) {firstLabelString = @"Seven";}
                else if ([[firstNum stringValue] isEqual:@"8"]) {firstLabelString = @"Eight";}
                else if ([[firstNum stringValue] isEqual:@"9"]) {firstLabelString = @"Nine";}
                else if ([[firstNum stringValue] isEqual:@"10"]) {firstLabelString = @"Ten";}
                else if ([[firstNum stringValue] isEqual:@"11"]) {firstLabelString = @"Eleven";}
                else if ([[firstNum stringValue] isEqual:@"12"]) {firstLabelString = @"Twelve";}
                else if ([[firstNum stringValue] isEqual:@"13"]) {firstLabelString = @"Thirteen";}
                else if ([[firstNum stringValue] isEqual:@"14"]) {firstLabelString = @"Fourteen";}
                else if ([[firstNum stringValue] isEqual:@"15"]) {firstLabelString = @"Fifteen";}
                else if ([[firstNum stringValue] isEqual:@"16"]) {firstLabelString = @"Sixteen";}
                else if ([[firstNum stringValue] isEqual:@"17"]) {firstLabelString = @"Seventeen";}
                else if ([[firstNum stringValue] isEqual:@"18"]) {firstLabelString = @"Eighteen";}
                else if ([[firstNum stringValue] isEqual:@"19"]) {firstLabelString = @"Nineteen";}
                else if ([[firstNum stringValue] isEqual:@"20"]) {firstLabelString = @"Twenty";}
                else if ([[firstNum stringValue] isEqual:@"21"]) {firstLabelString = @"Twenty one";}
                else if ([[firstNum stringValue] isEqual:@"22"]) {firstLabelString = @"Twenty two";}
                else if ([[firstNum stringValue] isEqual:@"23"]) {firstLabelString = @"Twenty three";}
                else if ([[firstNum stringValue] isEqual:@"24"]) {firstLabelString = @"Twenty four";}
                else if ([[firstNum stringValue] isEqual:@"25"]) {firstLabelString = @"Twenty five";}
                else if ([[firstNum stringValue] isEqual:@"26"]) {firstLabelString = @"Twenty six";}
                else if ([[firstNum stringValue] isEqual:@"27"]) {firstLabelString = @"Twenty seven";}
                else if ([[firstNum stringValue] isEqual:@"28"]) {firstLabelString = @"Twenty eight";}
                else if ([[firstNum stringValue] isEqual:@"29"]) {firstLabelString = @"Twenty nine";}
                else if ([[firstNum stringValue] isEqual:@"30"]) {firstLabelString = @"Thirty";}
                else if ([[firstNum stringValue] isEqual:@"31"]) {firstLabelString = @"Thirty one";}
                else if ([[firstNum stringValue] isEqual:@"32"]) {firstLabelString = @"Thirty two";}
                else if ([[firstNum stringValue] isEqual:@"33"]) {firstLabelString = @"Thirty three";}
                else if ([[firstNum stringValue] isEqual:@"34"]) {firstLabelString = @"Thirty four";}
                else if ([[firstNum stringValue] isEqual:@"35"]) {firstLabelString = @"Thirty five";}
                else if ([[firstNum stringValue] isEqual:@"36"]) {firstLabelString = @"Thirty six";}
                else if ([[firstNum stringValue] isEqual:@"37"]) {firstLabelString = @"Thirty seven";}
                else if ([[firstNum stringValue] isEqual:@"38"]) {firstLabelString = @"Thirty eight";}
                else if ([[firstNum stringValue] isEqual:@"39"]) {firstLabelString = @"Thirty nine";}
                else if ([[firstNum stringValue] isEqual:@"40"]) {firstLabelString = @"Forty";}
                else if ([[firstNum stringValue] isEqual:@"41"]) {firstLabelString = @"Forty one";}
                else if ([[firstNum stringValue] isEqual:@"42"]) {firstLabelString = @"Forty two";}
                else if ([[firstNum stringValue] isEqual:@"43"]) {firstLabelString = @"Forty three";}
                else if ([[firstNum stringValue] isEqual:@"44"]) {firstLabelString = @"Forty four";}
                else if ([[firstNum stringValue] isEqual:@"45"]) {firstLabelString = @"Forty five";}
                else if ([[firstNum stringValue] isEqual:@"46"]) {firstLabelString = @"Forty six";}
                else if ([[firstNum stringValue] isEqual:@"47"]) {firstLabelString = @"Forty seven";}
                else if ([[firstNum stringValue] isEqual:@"48"]) {firstLabelString = @"Forty eight";}
                else if ([[firstNum stringValue] isEqual:@"49"]) {firstLabelString = @"Forty nine";}
                else if ([[firstNum stringValue] isEqual:@"50"]) {firstLabelString = @"Fifty";}
                else if ([[firstNum stringValue] isEqual:@"51"]) {firstLabelString = @"Fifty one";}
                else if ([[firstNum stringValue] isEqual:@"52"]) {firstLabelString = @"Fifty two";}
                else if ([[firstNum stringValue] isEqual:@"53"]) {firstLabelString = @"Fifty three";}
                else if ([[firstNum stringValue] isEqual:@"54"]) {firstLabelString = @"Fifty four";}
                else if ([[firstNum stringValue] isEqual:@"55"]) {firstLabelString = @"Fifty five";}
                else if ([[firstNum stringValue] isEqual:@"56"]) {firstLabelString = @"Fifty six";}
                else if ([[firstNum stringValue] isEqual:@"57"]) {firstLabelString = @"Fifty seven";}
                else if ([[firstNum stringValue] isEqual:@"58"]) {firstLabelString = @"Fifty eight";}
                else if ([[firstNum stringValue] isEqual:@"59"]) {firstLabelString = @"Fifty nine";}
                else if ([[firstNum stringValue] isEqual:@"60"]) {firstLabelString = @"Sixty";}
                else if ([[firstNum stringValue] isEqual:@"61"]) {firstLabelString = @"Sixty one";}
                else if ([[firstNum stringValue] isEqual:@"62"]) {firstLabelString = @"Sixty two";}
                else if ([[firstNum stringValue] isEqual:@"63"]) {firstLabelString = @"Sixty three";}
                else if ([[firstNum stringValue] isEqual:@"64"]) {firstLabelString = @"Sixty four";}
                else if ([[firstNum stringValue] isEqual:@"65"]) {firstLabelString = @"Sixty five";}
                else if ([[firstNum stringValue] isEqual:@"66"]) {firstLabelString = @"Sixty six";}
                else if ([[firstNum stringValue] isEqual:@"67"]) {firstLabelString = @"Sixty seven";}
                else if ([[firstNum stringValue] isEqual:@"68"]) {firstLabelString = @"Sixty eight";}
                else if ([[firstNum stringValue] isEqual:@"69"]) {firstLabelString = @"Sixty nine";}
                else if ([[firstNum stringValue] isEqual:@"70"]) {firstLabelString = @"Seventy";}
                else if ([[firstNum stringValue] isEqual:@"71"]) {firstLabelString = @"Seventy one";}
                else if ([[firstNum stringValue] isEqual:@"72"]) {firstLabelString = @"Seventy two";}
                else if ([[firstNum stringValue] isEqual:@"73"]) {firstLabelString = @"Seventy three";}
                else if ([[firstNum stringValue] isEqual:@"74"]) {firstLabelString = @"Seventy four";}
                else if ([[firstNum stringValue] isEqual:@"75"]) {firstLabelString = @"Seventy five";}
                else if ([[firstNum stringValue] isEqual:@"76"]) {firstLabelString = @"Seventy six";}
                else if ([[firstNum stringValue] isEqual:@"77"]) {firstLabelString = @"Seventy seven";}
                else if ([[firstNum stringValue] isEqual:@"78"]) {firstLabelString = @"Seventy eight";}
                else if ([[firstNum stringValue] isEqual:@"79"]) {firstLabelString = @"Seventy nine";}
                else if ([[firstNum stringValue] isEqual:@"80"]) {firstLabelString = @"Eighty";}
                else if ([[firstNum stringValue] isEqual:@"81"]) {firstLabelString = @"Eighty one";}
                else if ([[firstNum stringValue] isEqual:@"82"]) {firstLabelString = @"Eighty two";}
                else if ([[firstNum stringValue] isEqual:@"83"]) {firstLabelString = @"Eighty three";}
                else if ([[firstNum stringValue] isEqual:@"84"]) {firstLabelString = @"Eighty four";}
                else if ([[firstNum stringValue] isEqual:@"85"]) {firstLabelString = @"Eighty five";}
                else if ([[firstNum stringValue] isEqual:@"86"]) {firstLabelString = @"Eighty six";}
                else if ([[firstNum stringValue] isEqual:@"87"]) {firstLabelString = @"Eighty seven";}
                else if ([[firstNum stringValue] isEqual:@"88"]) {firstLabelString = @"Eighty eight";}
                else if ([[firstNum stringValue] isEqual:@"89"]) {firstLabelString = @"Eighty nine";}
                else if ([[firstNum stringValue] isEqual:@"90"]) {firstLabelString = @"Ninety";}
                else if ([[firstNum stringValue] isEqual:@"91"]) {firstLabelString = @"Ninety one";}
                else if ([[firstNum stringValue] isEqual:@"92"]) {firstLabelString = @"Ninety two";}
                else if ([[firstNum stringValue] isEqual:@"93"]) {firstLabelString = @"Ninety three";}
                else if ([[firstNum stringValue] isEqual:@"94"]) {firstLabelString = @"Ninety four";}
                else if ([[firstNum stringValue] isEqual:@"95"]) {firstLabelString = @"Ninety five";}
                else if ([[firstNum stringValue] isEqual:@"96"]) {firstLabelString = @"Ninety six";}
                else if ([[firstNum stringValue] isEqual:@"97"]) {firstLabelString = @"Ninety seven";}
                else if ([[firstNum stringValue] isEqual:@"98"]) {firstLabelString = @"Ninety eight";}
                else if ([[firstNum stringValue] isEqual:@"99"]) {firstLabelString = @"Ninety nine";}
                else {firstLabelString = @"Error";}

                if ([[secondNum stringValue] isEqual:@"1"]) {secondLabelString = @"one";}
                else if ([[secondNum stringValue] isEqual:@"2"]) {secondLabelString = @"two";}
                else if ([[secondNum stringValue] isEqual:@"3"]) {secondLabelString = @"three";}
                else if ([[secondNum stringValue] isEqual:@"4"]) {secondLabelString = @"four";}
                else if ([[secondNum stringValue] isEqual:@"5"]) {secondLabelString = @"five";}
                else if ([[secondNum stringValue] isEqual:@"6"]) {secondLabelString = @"six";}
                else if ([[secondNum stringValue] isEqual:@"7"]) {secondLabelString = @"seven";}
                else if ([[secondNum stringValue] isEqual:@"8"]) {secondLabelString = @"eight";}
                else if ([[secondNum stringValue] isEqual:@"9"]) {secondLabelString = @"nine";}
                else if ([[secondNum stringValue] isEqual:@"10"]) {secondLabelString = @"ten";}
                else if ([[secondNum stringValue] isEqual:@"11"]) {secondLabelString = @"eleven";}
                else if ([[secondNum stringValue] isEqual:@"12"]) {secondLabelString = @"twelve";}
                else if ([[secondNum stringValue] isEqual:@"13"]) {secondLabelString = @"thirteen";}
                else if ([[secondNum stringValue] isEqual:@"14"]) {secondLabelString = @"fourteen";}
                else if ([[secondNum stringValue] isEqual:@"15"]) {secondLabelString = @"fifteen";}
                else if ([[secondNum stringValue] isEqual:@"16"]) {secondLabelString = @"sixteen";}
                else if ([[secondNum stringValue] isEqual:@"17"]) {secondLabelString = @"seventeen";}
                else if ([[secondNum stringValue] isEqual:@"18"]) {secondLabelString = @"eighteen";}
                else if ([[secondNum stringValue] isEqual:@"19"]) {secondLabelString = @"nineteen";}
                else if ([[secondNum stringValue] isEqual:@"20"]) {secondLabelString = @"twenty";}
                else if ([[secondNum stringValue] isEqual:@"21"]) {secondLabelString = @"twenty one";}
                else if ([[secondNum stringValue] isEqual:@"22"]) {secondLabelString = @"twenty two";}
                else if ([[secondNum stringValue] isEqual:@"23"]) {secondLabelString = @"twenty three";}
                else if ([[secondNum stringValue] isEqual:@"24"]) {secondLabelString = @"twenty four";}
                else if ([[secondNum stringValue] isEqual:@"25"]) {secondLabelString = @"twenty five";}
                else if ([[secondNum stringValue] isEqual:@"26"]) {secondLabelString = @"twenty six";}
                else if ([[secondNum stringValue] isEqual:@"27"]) {secondLabelString = @"twenty seven";}
                else if ([[secondNum stringValue] isEqual:@"28"]) {secondLabelString = @"twenty eight";}
                else if ([[secondNum stringValue] isEqual:@"29"]) {secondLabelString = @"twenty nine";}
                else if ([[secondNum stringValue] isEqual:@"30"]) {secondLabelString = @"thirty";}
                else if ([[secondNum stringValue] isEqual:@"31"]) {secondLabelString = @"thirty one";}
                else if ([[secondNum stringValue] isEqual:@"32"]) {secondLabelString = @"thirty two";}
                else if ([[secondNum stringValue] isEqual:@"33"]) {secondLabelString = @"thirty three";}
                else if ([[secondNum stringValue] isEqual:@"34"]) {secondLabelString = @"thirty four";}
                else if ([[secondNum stringValue] isEqual:@"35"]) {secondLabelString = @"thirty five";}
                else if ([[secondNum stringValue] isEqual:@"36"]) {secondLabelString = @"thirty six";}
                else if ([[secondNum stringValue] isEqual:@"37"]) {secondLabelString = @"thirty seven";}
                else if ([[secondNum stringValue] isEqual:@"38"]) {secondLabelString = @"thirty eight";}
                else if ([[secondNum stringValue] isEqual:@"39"]) {secondLabelString = @"thirty nine";}
                else if ([[secondNum stringValue] isEqual:@"40"]) {secondLabelString = @"forty";}
                else if ([[secondNum stringValue] isEqual:@"41"]) {secondLabelString = @"forty one";}
                else if ([[secondNum stringValue] isEqual:@"42"]) {secondLabelString = @"forty two";}
                else if ([[secondNum stringValue] isEqual:@"43"]) {secondLabelString = @"forty three";}
                else if ([[secondNum stringValue] isEqual:@"44"]) {secondLabelString = @"forty four";}
                else if ([[secondNum stringValue] isEqual:@"45"]) {secondLabelString = @"forty five";}
                else if ([[secondNum stringValue] isEqual:@"46"]) {secondLabelString = @"forty six";}
                else if ([[secondNum stringValue] isEqual:@"47"]) {secondLabelString = @"forty seven";}
                else if ([[secondNum stringValue] isEqual:@"48"]) {secondLabelString = @"forty eight";}
                else if ([[secondNum stringValue] isEqual:@"49"]) {secondLabelString = @"forty nine";}
                else if ([[secondNum stringValue] isEqual:@"50"]) {secondLabelString = @"fifty";}
                else if ([[secondNum stringValue] isEqual:@"51"]) {secondLabelString = @"fifty one";}
                else if ([[secondNum stringValue] isEqual:@"52"]) {secondLabelString = @"fifty two";}
                else if ([[secondNum stringValue] isEqual:@"53"]) {secondLabelString = @"fifty three";}
                else if ([[secondNum stringValue] isEqual:@"54"]) {secondLabelString = @"fifty four";}
                else if ([[secondNum stringValue] isEqual:@"55"]) {secondLabelString = @"fifty five";}
                else if ([[secondNum stringValue] isEqual:@"56"]) {secondLabelString = @"fifty six";}
                else if ([[secondNum stringValue] isEqual:@"57"]) {secondLabelString = @"fifty seven";}
                else if ([[secondNum stringValue] isEqual:@"58"]) {secondLabelString = @"fifty eight";}
                else if ([[secondNum stringValue] isEqual:@"59"]) {secondLabelString = @"fifty nine";}
                else if ([[secondNum stringValue] isEqual:@"60"]) {secondLabelString = @"sixty";}
                else if ([[secondNum stringValue] isEqual:@"61"]) {secondLabelString = @"sixty one";}
                else if ([[secondNum stringValue] isEqual:@"62"]) {secondLabelString = @"sixty two";}
                else if ([[secondNum stringValue] isEqual:@"63"]) {secondLabelString = @"sixty three";}
                else if ([[secondNum stringValue] isEqual:@"64"]) {secondLabelString = @"sixty four";}
                else if ([[secondNum stringValue] isEqual:@"65"]) {secondLabelString = @"sixty five";}
                else if ([[secondNum stringValue] isEqual:@"66"]) {secondLabelString = @"sixty six";}
                else if ([[secondNum stringValue] isEqual:@"67"]) {secondLabelString = @"sixty seven";}
                else if ([[secondNum stringValue] isEqual:@"68"]) {secondLabelString = @"sixty eight";}
                else if ([[secondNum stringValue] isEqual:@"69"]) {secondLabelString = @"sixty nine";}
                else if ([[secondNum stringValue] isEqual:@"70"]) {secondLabelString = @"seventy";}
                else if ([[secondNum stringValue] isEqual:@"71"]) {secondLabelString = @"seventy one";}
                else if ([[secondNum stringValue] isEqual:@"72"]) {secondLabelString = @"seventy two";}
                else if ([[secondNum stringValue] isEqual:@"73"]) {secondLabelString = @"seventy three";}
                else if ([[secondNum stringValue] isEqual:@"74"]) {secondLabelString = @"seventy four";}
                else if ([[secondNum stringValue] isEqual:@"75"]) {secondLabelString = @"seventy five";}
                else if ([[secondNum stringValue] isEqual:@"76"]) {secondLabelString = @"seventy six";}
                else if ([[secondNum stringValue] isEqual:@"77"]) {secondLabelString = @"seventy seven";}
                else if ([[secondNum stringValue] isEqual:@"78"]) {secondLabelString = @"seventy eight";}
                else if ([[secondNum stringValue] isEqual:@"79"]) {secondLabelString = @"seventy nine";}
                else if ([[secondNum stringValue] isEqual:@"80"]) {secondLabelString = @"eighty";}
                else if ([[secondNum stringValue] isEqual:@"81"]) {secondLabelString = @"eighty one";}
                else if ([[secondNum stringValue] isEqual:@"82"]) {secondLabelString = @"eighty two";}
                else if ([[secondNum stringValue] isEqual:@"83"]) {secondLabelString = @"eighty three";}
                else if ([[secondNum stringValue] isEqual:@"84"]) {secondLabelString = @"eighty four";}
                else if ([[secondNum stringValue] isEqual:@"85"]) {secondLabelString = @"eighty five";}
                else if ([[secondNum stringValue] isEqual:@"86"]) {secondLabelString = @"eighty six";}
                else if ([[secondNum stringValue] isEqual:@"87"]) {secondLabelString = @"eighty seven";}
                else if ([[secondNum stringValue] isEqual:@"88"]) {secondLabelString = @"eighty eight";}
                else if ([[secondNum stringValue] isEqual:@"89"]) {secondLabelString = @"eighty nine";}
                else if ([[secondNum stringValue] isEqual:@"90"]) {secondLabelString = @"ninety";}
                else if ([[secondNum stringValue] isEqual:@"91"]) {secondLabelString = @"ninety one";}
                else if ([[secondNum stringValue] isEqual:@"92"]) {secondLabelString = @"ninety two";}
                else if ([[secondNum stringValue] isEqual:@"93"]) {secondLabelString = @"ninety three";}
                else if ([[secondNum stringValue] isEqual:@"94"]) {secondLabelString = @"ninety four";}
                else if ([[secondNum stringValue] isEqual:@"95"]) {secondLabelString = @"ninety five";}
                else if ([[secondNum stringValue] isEqual:@"96"]) {secondLabelString = @"ninety six";}
                else if ([[secondNum stringValue] isEqual:@"97"]) {secondLabelString = @"ninety seven";}
                else if ([[secondNum stringValue] isEqual:@"98"]) {secondLabelString = @"ninety eight";}
                else if ([[secondNum stringValue] isEqual:@"99"]) {secondLabelString = @"ninety nine";}
                else {secondLabelString = @"Error";}

                if ([[prefs objectForKey:@"enabled"] boolValue]) {
                    if (unlockOnce) {
                	   label.text = [NSString stringWithFormat:@"For security reasons, unlock once after respring."];
                	   return label;
                    }

                    label.text = [NSString stringWithFormat:@"%@ times %@ is?", firstLabelString, secondLabelString];
                    return label;

                }

                else {

                    return %orig;

                }
            
            return %orig;
        }

%end

%hook SBLockScreenViewController

- (void)prepareForUIUnlock {

	unlockOnce = FALSE;

	//GET PREFS
    if ([[prefs objectForKey:@"difficulty"] intValue] == 1) {

        numbersArray = [[NSMutableArray alloc] initWithCapacity:12];
        for ( int i = 1; i <= 12; i ++ )
            [numbersArray addObject:[NSNumber numberWithInt:i]];

    }

    else if ([[prefs objectForKey:@"difficulty"] intValue] == 2) {

        numbersArray = [[NSMutableArray alloc] initWithCapacity:50];
        for ( int i = 1; i <= 50; i ++ )
            [numbersArray addObject:[NSNumber numberWithInt:i]];

    }

    else if ([[prefs objectForKey:@"difficulty"] intValue] == 3) {

        numbersArray = [[NSMutableArray alloc] initWithCapacity:99];
        for ( int i = 1; i <= 99; i ++ )
            [numbersArray addObject:[NSNumber numberWithInt:i]];

    }

    //numbersArray = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12];

	firstNum = numbersArray[arc4random_uniform([numbersArray count])];
	secondNum = numbersArray[arc4random_uniform([numbersArray count])];
    NSLog(@"%@, %@", firstNum, secondNum);

	firstNumString = [firstNum stringValue];
	secondNumString = [secondNum stringValue];
    NSLog(@"%@, %@", firstNumString, secondNumString);

	newPassValue = [firstNum intValue] * [secondNum intValue];
	newPass = [NSString stringWithFormat:@"%d", newPassValue];
    NSLog(@"%d", newPassValue);
	//padPass = [NSString stringWithFormat:@"00%@", newPass];

	if ([newPass length] == 1) {

		padPass = [NSString stringWithFormat:@"000%@", newPass];

	}

	else if ([newPass length] == 2) {

		padPass = [NSString stringWithFormat:@"00%@", newPass];

	}

	else if ([newPass length] == 3) {

		padPass = [NSString stringWithFormat:@"0%@", newPass];

	}

    else if ([newPass length] == 4) {

        padPass = [NSString stringWithFormat:@"%@", newPass];

    }

	%orig;

}

-(void)lockScreenView:(id)view didScrollToPage:(int)page {

    %orig;

    //timer1 = [NSTimer scheduledTimerWithTimeInterval:2.0 target:[LWHelper sharedInstance] selector:@selector(endTimer) userInfo:nil repeats:NO];

}

%end
/*
-(void)endTimer {

    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Test" message:@"Testing" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];

    [alert1 show];

}
*/
void loadPreferences() {

    prefs = [NSMutableDictionary dictionaryWithContentsOfFile:kSettingsPath];

    NSLog(@"%@", [prefs description]);

}

%ctor {
    // Initialization stuff
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    (CFNotificationCallback)loadPreferences,
                                    CFSTR("com.phillipt.mathpass/preferencechanged"),
                                    NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);
    
    loadPreferences();

}