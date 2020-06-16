#include "BCORenderDebugListController.h"
#include "BCORenderDebugOption.h"

#import <dlfcn.h>
#import <Preferences/PSSpecifier.h>

@interface BCORenderDebugListController()

@property (nonatomic, strong, nullable) NSDictionary<NSString *, BCORenderDebugOption *> *debugOptionMap;

@end

@implementation BCORenderDebugListController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray<PSSpecifier *> *specifiers = [[NSMutableArray alloc] init];
    NSMutableDictionary<NSString *, BCORenderDebugOption *> *debugOptionMap = [[NSMutableDictionary alloc] init];

    for (BCORenderDebugOption *debugOption in BCORenderDebugOption.allOptions) {
        PSSpecifier* specifier = [PSSpecifier preferenceSpecifierNamed:debugOption.label
                                                        target:self
                                                           set:@selector(setPreferenceValue:forSpecifier:)
                                                           get:@selector(preferenceValueForSpecifier:)
                                                        detail:Nil
                                                          cell:PSSwitchCell
                                                          edit:Nil];
        [specifier setIdentifier:debugOption.identifier];
        [specifiers addObject:specifier];
        [debugOptionMap setObject:debugOption forKey:debugOption.identifier];
    }

    self.specifiers = specifiers;
    self.debugOptionMap = debugOptionMap;
}

- (id)preferenceValueForSpecifier:(PSSpecifier *)specifier {
    BCORenderDebugOption *debugOption = self.debugOptionMap[specifier.identifier];

    typedef void* (*option_func_type)();
    option_func_type CARenderServerGetDebugOption;
    void *quartzCore = dlopen("/System/Library/Frameworks/QuartzCore.framework/QuartzCore", RTLD_NOW);
    *(void**)(&CARenderServerGetDebugOption) = dlsym(quartzCore,"CARenderServerGetDebugOption");
    BOOL isEnabled = (BOOL)CARenderServerGetDebugOption(0, debugOption.value);
    return @(isEnabled);
}

- (void)setPreferenceValue:(id)value forSpecifier:(PSSpecifier *)specifier {
    BCORenderDebugOption *debugOption = self.debugOptionMap[specifier.identifier];

    typedef void* (*option_func_type)();
    option_func_type CARenderServerSetDebugOption;
    void *quartzCore = dlopen("/System/Library/Frameworks/QuartzCore.framework/QuartzCore", RTLD_NOW);
    *(void**)(&CARenderServerSetDebugOption) = dlsym(quartzCore,"CARenderServerSetDebugOption");
    CARenderServerSetDebugOption(0, debugOption.value, [value boolValue]);
}

/**
 Override `reloadSpecifiers` to no-op.

 Otherwise, when navigating back to Settings from elsewhere,
 the controller will try to load our specifiers
 from a source we don't own
 */
- (void)reloadSpecifiers {}

@end
