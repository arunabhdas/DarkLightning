//
//  JMUSBDeviceTests.m
//  DarkLightning
//
//  Created by Jens Meder on 15/11/15.
//  Copyright © 2015 Jens Meder. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "JMUSBDevice.h"

static NSString* const JMUSBDeviceDictionaryKeyProperties 		= @"Properties";

static NSString* const JMUSBDeviceDictionaryKeyDeviceID 		= @"DeviceID";

SPEC_BEGIN(JMUSBMuxDeviceTests)

describe(@"JMUSBDevice",
^{
	context(@"when initializing",
	^{
		it(@"should return nil if no plist dictionary has been passed",
		^{
			JMUSBDevice* device = [[JMUSBDevice alloc]initWithPList:nil];
			
			[[device should] beNil];
		});
		
		it(@"should return nil if plist dictionary does not contain a device id",
		   ^{
			   JMUSBDevice* device = [[JMUSBDevice alloc]initWithPList:@{}];
			   
			   [[device should] beNil];
		   });
		
		it(@"should return a device if the plist dictionary is valid",
		   ^{
			   JMUSBDevice* device = [[JMUSBDevice alloc]initWithPList:@{JMUSBDeviceDictionaryKeyProperties:@{JMUSBDeviceDictionaryKeyDeviceID:@1}}];
			   
			   [[device shouldNot] beNil];
		   });
	});
});

SPEC_END
