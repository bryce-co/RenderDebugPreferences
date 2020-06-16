#import "BCORenderDebugOption.h"

@implementation BCORenderDebugOption

- (nonnull instancetype)initWithLabel:(nonnull NSString *)label
                   identifier:(nonnull NSString *)identifier
                        value:(NSInteger)value {
    if (self = [super init]) {
        _label = label;
        _identifier = identifier;
        _value = value;
    }

    return self;
}

+ (nonnull NSArray<BCORenderDebugOption *> *)allOptions {
    return @[
        [[BCORenderDebugOption alloc] initWithLabel:@"Color Blended Layers"
                                         identifier:@"colorBlendedLayers"
                                              value:0x2],
        [[BCORenderDebugOption alloc] initWithLabel:@"Color Hits Green and Misses Red"
                                         identifier:@"colorCached"
                                              value:0x13],
        [[BCORenderDebugOption alloc] initWithLabel:@"Color Copied Images"
                                         identifier:@"colorCopiedImages"
                                              value:0x1],
        [[BCORenderDebugOption alloc] initWithLabel:@"Color Layer Formats"
                                         identifier:@"colorFormat"
                                              value:0x14],
        [[BCORenderDebugOption alloc] initWithLabel:@"Color Immediately"
                                         identifier:@"colorImmediately"
                                              value:0x3],
        [[BCORenderDebugOption alloc] initWithLabel:@"Color Misaligned Images"
                                         identifier:@"colorMisalignedImages"
                                              value:0xe],
        [[BCORenderDebugOption alloc] initWithLabel:@"Color Offscreen-Rendered Yellow"
                                         identifier:@"colorOffscreenRenderedYellow"
                                              value:0x11],
        [[BCORenderDebugOption alloc] initWithLabel:@"Color Compositing Fast-Path Blue"
                                         identifier:@"colorOpenGLFastPathBlue"
                                              value:0x12],
        [[BCORenderDebugOption alloc] initWithLabel:@"Flash Updated Regions"
                                         identifier:@"flashUpdatedRegions"
                                              value:0x0]
    ];
}

@end
