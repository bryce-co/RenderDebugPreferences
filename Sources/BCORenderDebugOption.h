@interface BCORenderDebugOption: NSObject

/**
 Contains all known render debug options.
 */
@property (nonatomic, strong, nonnull, readonly, class) NSArray<BCORenderDebugOption *> *allOptions;

/**
  A user-facing string that represents this render debug option.
 */
@property (nonatomic, strong, nonnull, readonly) NSString *label;

/**
  A unique identifier that represents this render debug option.
 */
@property (nonatomic, strong, nonnull, readonly) NSString *identifier;

/**
  The value associated with this option that can be used with
  `CARenderServerGetDebugOption` / `CARenderServerSetDebugOption`.
 */
@property (nonatomic, readonly) NSInteger value;

- (nonnull instancetype)init NS_UNAVAILABLE;

@end
