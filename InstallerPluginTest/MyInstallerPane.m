//
//  MyInstallerPane.m
//

#import "MyInstallerPane.h"
#import "../InstallerPane+VHInstallerPaneMissingMethodAdditions.h"

@implementation MyInstallerPane

- (void)queryPackagePath
{
    [self willChangeValueForKey:@"packageURL"];
    [self willChangeValueForKey:@"packagePath"];
    [self didChangeValueForKey:@"packagePath"];
    [self didChangeValueForKey:@"packageURL"];
}
- (NSString *)title
{
    return [[NSBundle bundleForClass:[self class]] localizedStringForKey:@"PaneTitle" value:nil table:nil];
}

- (void)willEnterPane:(InstallerSectionDirection)dir
{
    NSLog(@"****** ---%@", self.packagePath);
}

- (void)didEnterPane:(InstallerSectionDirection)dir
{
    NSLog(@"****** +++%@", self.packagePath);
    [self queryPackagePath];
}

@end
