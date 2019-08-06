//
//  InstallerPane+InstallerPaneMissingMethodAdditions.h
//

#import <Foundation/Foundation.h>
#import <InstallerPlugins/InstallerPlugins.h>

NS_ASSUME_NONNULL_BEGIN

@interface InstallerPane (VHInstallerPaneMissingMethodAdditions)
- (NSString *)packagePath;
- (NSURL *)packageURL;
@end

NS_ASSUME_NONNULL_END
