/* Code Injection Example
More CSCI examples can be found here: http://iosgods.com/forum/48-coding-center/
*/
#include "writeData.h"

%ctor {
writeData(0xOFFSET, 0xHACKEDHEX);
writeData(0x15BE04, 0x78708AE5);
}





/* Normal Tweak Example
Visit this thread for more information: http://iosgods.com/topic/831-tutorial-how-to-hack-using-mobile-substrate-method-hooking/
*/


%hook Coins
- (int)have {
return 999999; //Return any amount
}
%end





/* MSHook Tweak Example
Read this thread for more help: http://iosgods.com/topic/4295-tutorial-how-to-hack-with-mshook-new-way/
*/

int getMoney()
{
return 9999;
}

%ctor{
MSHookFunction(((void*)MSFindSymbol(NULL, "__ZN10Characters5Money8GetValueEv")),(void*)getMoney, NULL);
}





/* Popup with a link 

Varieties of a UIAlertView Popup can be found here: http://iosgods.com/topic/13988-varieties-of-uialertview-types-to-use-in-your-tweaks-patchers/

*/


%hook AppDelegate // Change this with your Application's Delegate. AppController, UnityAppController, GameDelegate etc.

- (BOOL)application:(id)fp8 didFinishLaunchingWithOptions:(id)fp12 { // Popup only once at each launch of the app.
UIAlertView *igcredits = [[UIAlertView alloc] initWithTitle:@"@@PROJECTNAME@@ Cheats" 
                                                  message:@"\n@@PROJECTNAME@@ Cheats by @@USER@@ for iOSGods.com"
                                                 delegate:self 
										cancelButtonTitle:@"Thanks" 
										otherButtonTitles:@"Visit Us", nil]; 
[igcredits show];
[igcredits release]; 
return %orig();
}
 
%new
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
 
NSString *button = [alertView buttonTitleAtIndex:buttonIndex];
 
	if([button isEqualToString:@"Visit Us"])
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://iosgods.com/"]];                                                                                
	}
}
%end