//
//  InstallerPane+VHInstallerPaneMissingMethodAdditions.m
//

#import "InstallerPane+VHInstallerPaneMissingMethodAdditions.h"

@protocol InstallerRemotePluginHostViewController
- (void)getDistributionPath:(void (^)(NSString *))arg1;
@end

@interface InstallerPane (PluginCompatibility)
- (id)__hostViewController;
@end

@implementation InstallerPane (VHInstallerPaneMissingMethodAdditions)

- (NSString *)packagePath
{
    @synchronized (self)
    {
        static NSString *packagePath = nil;
        if (!packagePath.length)
        {
            if ([self respondsToSelector:@selector(__hostViewController)])
            {
                id hvc = [self __hostViewController];
                if ([hvc respondsToSelector:@selector(getDistributionPath:)])
                {
                    __block id _self = self;
                    [hvc getDistributionPath:^(NSString *path) {
                        [_self willChangeValueForKey:@"packageURL"];
                        [_self willChangeValueForKey:@"packagePath"];
                        packagePath = path;
                        [_self didChangeValueForKey:@"packagePath"];
                        [_self didChangeValueForKey:@"packageURL"];
                    }];
                }
            }
            else
            {
                packagePath = self.contentView.window.representedFilename;
            }
        }
        return packagePath;
    }
}
- (NSURL *)packageURL
{
    NSString *packagePath = self.packagePath;
    if (packagePath.length)
        return [NSURL fileURLWithPath:packagePath];
    return nil;
}
@end
