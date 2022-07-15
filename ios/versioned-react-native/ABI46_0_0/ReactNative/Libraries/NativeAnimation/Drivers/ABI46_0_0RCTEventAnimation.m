/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <ABI46_0_0React/ABI46_0_0RCTEventAnimation.h>

@implementation ABI46_0_0RCTEventAnimation
{
  NSArray<NSString *> *_eventPath;
}

- (instancetype)initWithEventPath:(NSArray<NSString *> *)eventPath
                        valueNode:(ABI46_0_0RCTValueAnimatedNode *)valueNode
{
  if ((self = [super init])) {
    _eventPath = eventPath;
    _valueNode = valueNode;
  }
  return self;
}

- (void)updateWithEvent:(id<ABI46_0_0RCTEvent>)event
{
  NSArray *args = event.arguments;
  // Supported events args are in the following order: viewTag, eventName, eventData.
  id currentValue = args[2];
  for (NSString *key in _eventPath) {
    currentValue = [currentValue valueForKey:key];
  }

  _valueNode.value = ((NSNumber *)currentValue).doubleValue;
  [_valueNode setNeedsUpdate];
}

@end
