// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Message.pb.h"
// @@protoc_insertion_point(imports)

@implementation MessageRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [MessageRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = registry;
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface Message ()
@property MessageMessageType type;
@property (strong) MessageInfo* info;
@property MessageResponse response;
@property (strong) MessageSemOptions* semOption;
@property (strong) MessageCheckBlock* checkBlock;
@end

@implementation Message

- (BOOL) hasType {
  return !!hasType_;
}
- (void) setHasType:(BOOL) value_ {
  hasType_ = !!value_;
}
@synthesize type;
- (BOOL) hasInfo {
  return !!hasInfo_;
}
- (void) setHasInfo:(BOOL) value_ {
  hasInfo_ = !!value_;
}
@synthesize info;
- (BOOL) hasResponse {
  return !!hasResponse_;
}
- (void) setHasResponse:(BOOL) value_ {
  hasResponse_ = !!value_;
}
@synthesize response;
- (BOOL) hasSemOption {
  return !!hasSemOption_;
}
- (void) setHasSemOption:(BOOL) value_ {
  hasSemOption_ = !!value_;
}
@synthesize semOption;
- (BOOL) hasCheckBlock {
  return !!hasCheckBlock_;
}
- (void) setHasCheckBlock:(BOOL) value_ {
  hasCheckBlock_ = !!value_;
}
@synthesize checkBlock;
- (instancetype) init {
  if ((self = [super init])) {
    self.type = MessageMessageTypeHb;
    self.info = [MessageInfo defaultInstance];
    self.response = MessageResponseOk;
    self.semOption = [MessageSemOptions defaultInstance];
    self.checkBlock = [MessageCheckBlock defaultInstance];
  }
  return self;
}
static Message* defaultMessageInstance = nil;
+ (void) initialize {
  if (self == [Message class]) {
    defaultMessageInstance = [[Message alloc] init];
  }
}
+ (instancetype) defaultInstance {
  return defaultMessageInstance;
}
- (instancetype) defaultInstance {
  return defaultMessageInstance;
}
- (BOOL) isInitialized {
  if (!self.hasType) {
    return NO;
  }
  if (!self.hasInfo) {
    return NO;
  }
  if (!self.info.isInitialized) {
    return NO;
  }
  if (self.hasSemOption) {
    if (!self.semOption.isInitialized) {
      return NO;
    }
  }
  if (self.hasCheckBlock) {
    if (!self.checkBlock.isInitialized) {
      return NO;
    }
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasType) {
    [output writeEnum:1 value:self.type];
  }
  if (self.hasInfo) {
    [output writeMessage:2 value:self.info];
  }
  if (self.hasResponse) {
    [output writeEnum:3 value:self.response];
  }
  if (self.hasSemOption) {
    [output writeMessage:4 value:self.semOption];
  }
  if (self.hasCheckBlock) {
    [output writeMessage:5 value:self.checkBlock];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (SInt32) serializedSize {
  __block SInt32 size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasType) {
    size_ += computeEnumSize(1, self.type);
  }
  if (self.hasInfo) {
    size_ += computeMessageSize(2, self.info);
  }
  if (self.hasResponse) {
    size_ += computeEnumSize(3, self.response);
  }
  if (self.hasSemOption) {
    size_ += computeMessageSize(4, self.semOption);
  }
  if (self.hasCheckBlock) {
    size_ += computeMessageSize(5, self.checkBlock);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (Message*) parseFromData:(NSData*) data {
  return (Message*)[[[Message builder] mergeFromData:data] build];
}
+ (Message*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Message*)[[[Message builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (Message*) parseFromInputStream:(NSInputStream*) input {
  return (Message*)[[[Message builder] mergeFromInputStream:input] build];
}
+ (Message*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Message*)[[[Message builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Message*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (Message*)[[[Message builder] mergeFromCodedInputStream:input] build];
}
+ (Message*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Message*)[[[Message builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MessageBuilder*) builder {
  return [[MessageBuilder alloc] init];
}
+ (MessageBuilder*) builderWithPrototype:(Message*) prototype {
  return [[Message builder] mergeFrom:prototype];
}
- (MessageBuilder*) builder {
  return [Message builder];
}
- (MessageBuilder*) toBuilder {
  return [Message builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasType) {
    [output appendFormat:@"%@%@: %@\n", indent, @"type", [NSNumber numberWithInteger:self.type]];
  }
  if (self.hasInfo) {
    [output appendFormat:@"%@%@ {\n", indent, @"info"];
    [self.info writeDescriptionTo:output
                         withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  if (self.hasResponse) {
    [output appendFormat:@"%@%@: %@\n", indent, @"response", [NSNumber numberWithInteger:self.response]];
  }
  if (self.hasSemOption) {
    [output appendFormat:@"%@%@ {\n", indent, @"semOption"];
    [self.semOption writeDescriptionTo:output
                         withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  if (self.hasCheckBlock) {
    [output appendFormat:@"%@%@ {\n", indent, @"checkBlock"];
    [self.checkBlock writeDescriptionTo:output
                         withIndent:[NSString stringWithFormat:@"%@  ", indent]];
    [output appendFormat:@"%@}\n", indent];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[Message class]]) {
    return NO;
  }
  Message *otherMessage = other;
  return
      self.hasType == otherMessage.hasType &&
      (!self.hasType || self.type == otherMessage.type) &&
      self.hasInfo == otherMessage.hasInfo &&
      (!self.hasInfo || [self.info isEqual:otherMessage.info]) &&
      self.hasResponse == otherMessage.hasResponse &&
      (!self.hasResponse || self.response == otherMessage.response) &&
      self.hasSemOption == otherMessage.hasSemOption &&
      (!self.hasSemOption || [self.semOption isEqual:otherMessage.semOption]) &&
      self.hasCheckBlock == otherMessage.hasCheckBlock &&
      (!self.hasCheckBlock || [self.checkBlock isEqual:otherMessage.checkBlock]) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  __block NSUInteger hashCode = 7;
  if (self.hasType) {
    hashCode = hashCode * 31 + self.type;
  }
  if (self.hasInfo) {
    hashCode = hashCode * 31 + [self.info hash];
  }
  if (self.hasResponse) {
    hashCode = hashCode * 31 + self.response;
  }
  if (self.hasSemOption) {
    hashCode = hashCode * 31 + [self.semOption hash];
  }
  if (self.hasCheckBlock) {
    hashCode = hashCode * 31 + [self.checkBlock hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

BOOL MessageMessageTypeIsValidValue(MessageMessageType value) {
  switch (value) {
    case MessageMessageTypeHb:
    case MessageMessageTypeSemCreate:
    case MessageMessageTypeSemDestroy:
    case MessageMessageTypeSemP:
    case MessageMessageTypeSemV:
    case MessageMessageTypeSemCheck:
    case MessageMessageTypeCheckBlock:
      return YES;
    default:
      return NO;
  }
}
BOOL MessageResponseIsValidValue(MessageResponse value) {
  switch (value) {
    case MessageResponseOk:
    case MessageResponseNo:
    case MessageResponseError:
      return YES;
    default:
      return NO;
  }
}
@interface MessageInfo ()
@property SInt32 ipIndex;
@end

@implementation MessageInfo

- (BOOL) hasIpIndex {
  return !!hasIpIndex_;
}
- (void) setHasIpIndex:(BOOL) value_ {
  hasIpIndex_ = !!value_;
}
@synthesize ipIndex;
- (instancetype) init {
  if ((self = [super init])) {
    self.ipIndex = 0;
  }
  return self;
}
static MessageInfo* defaultMessageInfoInstance = nil;
+ (void) initialize {
  if (self == [MessageInfo class]) {
    defaultMessageInfoInstance = [[MessageInfo alloc] init];
  }
}
+ (instancetype) defaultInstance {
  return defaultMessageInfoInstance;
}
- (instancetype) defaultInstance {
  return defaultMessageInfoInstance;
}
- (BOOL) isInitialized {
  if (!self.hasIpIndex) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasIpIndex) {
    [output writeInt32:1 value:self.ipIndex];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (SInt32) serializedSize {
  __block SInt32 size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasIpIndex) {
    size_ += computeInt32Size(1, self.ipIndex);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (MessageInfo*) parseFromData:(NSData*) data {
  return (MessageInfo*)[[[MessageInfo builder] mergeFromData:data] build];
}
+ (MessageInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageInfo*)[[[MessageInfo builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (MessageInfo*) parseFromInputStream:(NSInputStream*) input {
  return (MessageInfo*)[[[MessageInfo builder] mergeFromInputStream:input] build];
}
+ (MessageInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageInfo*)[[[MessageInfo builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MessageInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (MessageInfo*)[[[MessageInfo builder] mergeFromCodedInputStream:input] build];
}
+ (MessageInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageInfo*)[[[MessageInfo builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MessageInfoBuilder*) builder {
  return [[MessageInfoBuilder alloc] init];
}
+ (MessageInfoBuilder*) builderWithPrototype:(MessageInfo*) prototype {
  return [[MessageInfo builder] mergeFrom:prototype];
}
- (MessageInfoBuilder*) builder {
  return [MessageInfo builder];
}
- (MessageInfoBuilder*) toBuilder {
  return [MessageInfo builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasIpIndex) {
    [output appendFormat:@"%@%@: %@\n", indent, @"ipIndex", [NSNumber numberWithInteger:self.ipIndex]];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[MessageInfo class]]) {
    return NO;
  }
  MessageInfo *otherMessage = other;
  return
      self.hasIpIndex == otherMessage.hasIpIndex &&
      (!self.hasIpIndex || self.ipIndex == otherMessage.ipIndex) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  __block NSUInteger hashCode = 7;
  if (self.hasIpIndex) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInteger:self.ipIndex] hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface MessageInfoBuilder()
@property (strong) MessageInfo* resultInfo;
@end

@implementation MessageInfoBuilder
@synthesize resultInfo;
- (instancetype) init {
  if ((self = [super init])) {
    self.resultInfo = [[MessageInfo alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return resultInfo;
}
- (MessageInfoBuilder*) clear {
  self.resultInfo = [[MessageInfo alloc] init];
  return self;
}
- (MessageInfoBuilder*) clone {
  return [MessageInfo builderWithPrototype:resultInfo];
}
- (MessageInfo*) defaultInstance {
  return [MessageInfo defaultInstance];
}
- (MessageInfo*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (MessageInfo*) buildPartial {
  MessageInfo* returnMe = resultInfo;
  self.resultInfo = nil;
  return returnMe;
}
- (MessageInfoBuilder*) mergeFrom:(MessageInfo*) other {
  if (other == [MessageInfo defaultInstance]) {
    return self;
  }
  if (other.hasIpIndex) {
    [self setIpIndex:other.ipIndex];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (MessageInfoBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (MessageInfoBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSetBuilder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    SInt32 tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        [self setIpIndex:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasIpIndex {
  return resultInfo.hasIpIndex;
}
- (SInt32) ipIndex {
  return resultInfo.ipIndex;
}
- (MessageInfoBuilder*) setIpIndex:(SInt32) value {
  resultInfo.hasIpIndex = YES;
  resultInfo.ipIndex = value;
  return self;
}
- (MessageInfoBuilder*) clearIpIndex {
  resultInfo.hasIpIndex = NO;
  resultInfo.ipIndex = 0;
  return self;
}
@end

@interface MessageSemOptions ()
@property (strong) NSString* name;
@property SInt32 value;
@end

@implementation MessageSemOptions

- (BOOL) hasName {
  return !!hasName_;
}
- (void) setHasName:(BOOL) value_ {
  hasName_ = !!value_;
}
@synthesize name;
- (BOOL) hasValue {
  return !!hasValue_;
}
- (void) setHasValue:(BOOL) value_ {
  hasValue_ = !!value_;
}
@synthesize value;
- (instancetype) init {
  if ((self = [super init])) {
    self.name = @"";
    self.value = 0;
  }
  return self;
}
static MessageSemOptions* defaultMessageSemOptionsInstance = nil;
+ (void) initialize {
  if (self == [MessageSemOptions class]) {
    defaultMessageSemOptionsInstance = [[MessageSemOptions alloc] init];
  }
}
+ (instancetype) defaultInstance {
  return defaultMessageSemOptionsInstance;
}
- (instancetype) defaultInstance {
  return defaultMessageSemOptionsInstance;
}
- (BOOL) isInitialized {
  if (!self.hasName) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasName) {
    [output writeString:1 value:self.name];
  }
  if (self.hasValue) {
    [output writeInt32:2 value:self.value];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (SInt32) serializedSize {
  __block SInt32 size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasName) {
    size_ += computeStringSize(1, self.name);
  }
  if (self.hasValue) {
    size_ += computeInt32Size(2, self.value);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (MessageSemOptions*) parseFromData:(NSData*) data {
  return (MessageSemOptions*)[[[MessageSemOptions builder] mergeFromData:data] build];
}
+ (MessageSemOptions*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageSemOptions*)[[[MessageSemOptions builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (MessageSemOptions*) parseFromInputStream:(NSInputStream*) input {
  return (MessageSemOptions*)[[[MessageSemOptions builder] mergeFromInputStream:input] build];
}
+ (MessageSemOptions*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageSemOptions*)[[[MessageSemOptions builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MessageSemOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (MessageSemOptions*)[[[MessageSemOptions builder] mergeFromCodedInputStream:input] build];
}
+ (MessageSemOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageSemOptions*)[[[MessageSemOptions builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MessageSemOptionsBuilder*) builder {
  return [[MessageSemOptionsBuilder alloc] init];
}
+ (MessageSemOptionsBuilder*) builderWithPrototype:(MessageSemOptions*) prototype {
  return [[MessageSemOptions builder] mergeFrom:prototype];
}
- (MessageSemOptionsBuilder*) builder {
  return [MessageSemOptions builder];
}
- (MessageSemOptionsBuilder*) toBuilder {
  return [MessageSemOptions builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasName) {
    [output appendFormat:@"%@%@: %@\n", indent, @"name", self.name];
  }
  if (self.hasValue) {
    [output appendFormat:@"%@%@: %@\n", indent, @"value", [NSNumber numberWithInteger:self.value]];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[MessageSemOptions class]]) {
    return NO;
  }
  MessageSemOptions *otherMessage = other;
  return
      self.hasName == otherMessage.hasName &&
      (!self.hasName || [self.name isEqual:otherMessage.name]) &&
      self.hasValue == otherMessage.hasValue &&
      (!self.hasValue || self.value == otherMessage.value) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  __block NSUInteger hashCode = 7;
  if (self.hasName) {
    hashCode = hashCode * 31 + [self.name hash];
  }
  if (self.hasValue) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInteger:self.value] hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface MessageSemOptionsBuilder()
@property (strong) MessageSemOptions* resultSemOptions;
@end

@implementation MessageSemOptionsBuilder
@synthesize resultSemOptions;
- (instancetype) init {
  if ((self = [super init])) {
    self.resultSemOptions = [[MessageSemOptions alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return resultSemOptions;
}
- (MessageSemOptionsBuilder*) clear {
  self.resultSemOptions = [[MessageSemOptions alloc] init];
  return self;
}
- (MessageSemOptionsBuilder*) clone {
  return [MessageSemOptions builderWithPrototype:resultSemOptions];
}
- (MessageSemOptions*) defaultInstance {
  return [MessageSemOptions defaultInstance];
}
- (MessageSemOptions*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (MessageSemOptions*) buildPartial {
  MessageSemOptions* returnMe = resultSemOptions;
  self.resultSemOptions = nil;
  return returnMe;
}
- (MessageSemOptionsBuilder*) mergeFrom:(MessageSemOptions*) other {
  if (other == [MessageSemOptions defaultInstance]) {
    return self;
  }
  if (other.hasName) {
    [self setName:other.name];
  }
  if (other.hasValue) {
    [self setValue:other.value];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (MessageSemOptionsBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (MessageSemOptionsBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSetBuilder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    SInt32 tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setName:[input readString]];
        break;
      }
      case 16: {
        [self setValue:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasName {
  return resultSemOptions.hasName;
}
- (NSString*) name {
  return resultSemOptions.name;
}
- (MessageSemOptionsBuilder*) setName:(NSString*) value {
  resultSemOptions.hasName = YES;
  resultSemOptions.name = value;
  return self;
}
- (MessageSemOptionsBuilder*) clearName {
  resultSemOptions.hasName = NO;
  resultSemOptions.name = @"";
  return self;
}
- (BOOL) hasValue {
  return resultSemOptions.hasValue;
}
- (SInt32) value {
  return resultSemOptions.value;
}
- (MessageSemOptionsBuilder*) setValue:(SInt32) value {
  resultSemOptions.hasValue = YES;
  resultSemOptions.value = value;
  return self;
}
- (MessageSemOptionsBuilder*) clearValue {
  resultSemOptions.hasValue = NO;
  resultSemOptions.value = 0;
  return self;
}
@end

@interface MessageCheckBlock ()
@property SInt32 initClient;
@property SInt32 sendingClient;
@property (strong) NSString* targetSem;
@end

@implementation MessageCheckBlock

- (BOOL) hasInitClient {
  return !!hasInitClient_;
}
- (void) setHasInitClient:(BOOL) value_ {
  hasInitClient_ = !!value_;
}
@synthesize initClient;
- (BOOL) hasSendingClient {
  return !!hasSendingClient_;
}
- (void) setHasSendingClient:(BOOL) value_ {
  hasSendingClient_ = !!value_;
}
@synthesize sendingClient;
- (BOOL) hasTargetSem {
  return !!hasTargetSem_;
}
- (void) setHasTargetSem:(BOOL) value_ {
  hasTargetSem_ = !!value_;
}
@synthesize targetSem;
- (instancetype) init {
  if ((self = [super init])) {
    self.initClient = 0;
    self.sendingClient = 0;
    self.targetSem = @"";
  }
  return self;
}
static MessageCheckBlock* defaultMessageCheckBlockInstance = nil;
+ (void) initialize {
  if (self == [MessageCheckBlock class]) {
    defaultMessageCheckBlockInstance = [[MessageCheckBlock alloc] init];
  }
}
+ (instancetype) defaultInstance {
  return defaultMessageCheckBlockInstance;
}
- (instancetype) defaultInstance {
  return defaultMessageCheckBlockInstance;
}
- (BOOL) isInitialized {
  if (!self.hasInitClient) {
    return NO;
  }
  if (!self.hasSendingClient) {
    return NO;
  }
  if (!self.hasTargetSem) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasInitClient) {
    [output writeInt32:1 value:self.initClient];
  }
  if (self.hasSendingClient) {
    [output writeInt32:2 value:self.sendingClient];
  }
  if (self.hasTargetSem) {
    [output writeString:3 value:self.targetSem];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (SInt32) serializedSize {
  __block SInt32 size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasInitClient) {
    size_ += computeInt32Size(1, self.initClient);
  }
  if (self.hasSendingClient) {
    size_ += computeInt32Size(2, self.sendingClient);
  }
  if (self.hasTargetSem) {
    size_ += computeStringSize(3, self.targetSem);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (MessageCheckBlock*) parseFromData:(NSData*) data {
  return (MessageCheckBlock*)[[[MessageCheckBlock builder] mergeFromData:data] build];
}
+ (MessageCheckBlock*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageCheckBlock*)[[[MessageCheckBlock builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (MessageCheckBlock*) parseFromInputStream:(NSInputStream*) input {
  return (MessageCheckBlock*)[[[MessageCheckBlock builder] mergeFromInputStream:input] build];
}
+ (MessageCheckBlock*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageCheckBlock*)[[[MessageCheckBlock builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MessageCheckBlock*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (MessageCheckBlock*)[[[MessageCheckBlock builder] mergeFromCodedInputStream:input] build];
}
+ (MessageCheckBlock*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MessageCheckBlock*)[[[MessageCheckBlock builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MessageCheckBlockBuilder*) builder {
  return [[MessageCheckBlockBuilder alloc] init];
}
+ (MessageCheckBlockBuilder*) builderWithPrototype:(MessageCheckBlock*) prototype {
  return [[MessageCheckBlock builder] mergeFrom:prototype];
}
- (MessageCheckBlockBuilder*) builder {
  return [MessageCheckBlock builder];
}
- (MessageCheckBlockBuilder*) toBuilder {
  return [MessageCheckBlock builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasInitClient) {
    [output appendFormat:@"%@%@: %@\n", indent, @"initClient", [NSNumber numberWithInteger:self.initClient]];
  }
  if (self.hasSendingClient) {
    [output appendFormat:@"%@%@: %@\n", indent, @"sendingClient", [NSNumber numberWithInteger:self.sendingClient]];
  }
  if (self.hasTargetSem) {
    [output appendFormat:@"%@%@: %@\n", indent, @"targetSem", self.targetSem];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[MessageCheckBlock class]]) {
    return NO;
  }
  MessageCheckBlock *otherMessage = other;
  return
      self.hasInitClient == otherMessage.hasInitClient &&
      (!self.hasInitClient || self.initClient == otherMessage.initClient) &&
      self.hasSendingClient == otherMessage.hasSendingClient &&
      (!self.hasSendingClient || self.sendingClient == otherMessage.sendingClient) &&
      self.hasTargetSem == otherMessage.hasTargetSem &&
      (!self.hasTargetSem || [self.targetSem isEqual:otherMessage.targetSem]) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  __block NSUInteger hashCode = 7;
  if (self.hasInitClient) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInteger:self.initClient] hash];
  }
  if (self.hasSendingClient) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInteger:self.sendingClient] hash];
  }
  if (self.hasTargetSem) {
    hashCode = hashCode * 31 + [self.targetSem hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface MessageCheckBlockBuilder()
@property (strong) MessageCheckBlock* resultCheckBlock;
@end

@implementation MessageCheckBlockBuilder
@synthesize resultCheckBlock;
- (instancetype) init {
  if ((self = [super init])) {
    self.resultCheckBlock = [[MessageCheckBlock alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return resultCheckBlock;
}
- (MessageCheckBlockBuilder*) clear {
  self.resultCheckBlock = [[MessageCheckBlock alloc] init];
  return self;
}
- (MessageCheckBlockBuilder*) clone {
  return [MessageCheckBlock builderWithPrototype:resultCheckBlock];
}
- (MessageCheckBlock*) defaultInstance {
  return [MessageCheckBlock defaultInstance];
}
- (MessageCheckBlock*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (MessageCheckBlock*) buildPartial {
  MessageCheckBlock* returnMe = resultCheckBlock;
  self.resultCheckBlock = nil;
  return returnMe;
}
- (MessageCheckBlockBuilder*) mergeFrom:(MessageCheckBlock*) other {
  if (other == [MessageCheckBlock defaultInstance]) {
    return self;
  }
  if (other.hasInitClient) {
    [self setInitClient:other.initClient];
  }
  if (other.hasSendingClient) {
    [self setSendingClient:other.sendingClient];
  }
  if (other.hasTargetSem) {
    [self setTargetSem:other.targetSem];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (MessageCheckBlockBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (MessageCheckBlockBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSetBuilder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    SInt32 tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        [self setInitClient:[input readInt32]];
        break;
      }
      case 16: {
        [self setSendingClient:[input readInt32]];
        break;
      }
      case 26: {
        [self setTargetSem:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasInitClient {
  return resultCheckBlock.hasInitClient;
}
- (SInt32) initClient {
  return resultCheckBlock.initClient;
}
- (MessageCheckBlockBuilder*) setInitClient:(SInt32) value {
  resultCheckBlock.hasInitClient = YES;
  resultCheckBlock.initClient = value;
  return self;
}
- (MessageCheckBlockBuilder*) clearInitClient {
  resultCheckBlock.hasInitClient = NO;
  resultCheckBlock.initClient = 0;
  return self;
}
- (BOOL) hasSendingClient {
  return resultCheckBlock.hasSendingClient;
}
- (SInt32) sendingClient {
  return resultCheckBlock.sendingClient;
}
- (MessageCheckBlockBuilder*) setSendingClient:(SInt32) value {
  resultCheckBlock.hasSendingClient = YES;
  resultCheckBlock.sendingClient = value;
  return self;
}
- (MessageCheckBlockBuilder*) clearSendingClient {
  resultCheckBlock.hasSendingClient = NO;
  resultCheckBlock.sendingClient = 0;
  return self;
}
- (BOOL) hasTargetSem {
  return resultCheckBlock.hasTargetSem;
}
- (NSString*) targetSem {
  return resultCheckBlock.targetSem;
}
- (MessageCheckBlockBuilder*) setTargetSem:(NSString*) value {
  resultCheckBlock.hasTargetSem = YES;
  resultCheckBlock.targetSem = value;
  return self;
}
- (MessageCheckBlockBuilder*) clearTargetSem {
  resultCheckBlock.hasTargetSem = NO;
  resultCheckBlock.targetSem = @"";
  return self;
}
@end

@interface MessageBuilder()
@property (strong) Message* resultMessage;
@end

@implementation MessageBuilder
@synthesize resultMessage;
- (instancetype) init {
  if ((self = [super init])) {
    self.resultMessage = [[Message alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return resultMessage;
}
- (MessageBuilder*) clear {
  self.resultMessage = [[Message alloc] init];
  return self;
}
- (MessageBuilder*) clone {
  return [Message builderWithPrototype:resultMessage];
}
- (Message*) defaultInstance {
  return [Message defaultInstance];
}
- (Message*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (Message*) buildPartial {
  Message* returnMe = resultMessage;
  self.resultMessage = nil;
  return returnMe;
}
- (MessageBuilder*) mergeFrom:(Message*) other {
  if (other == [Message defaultInstance]) {
    return self;
  }
  if (other.hasType) {
    [self setType:other.type];
  }
  if (other.hasInfo) {
    [self mergeInfo:other.info];
  }
  if (other.hasResponse) {
    [self setResponse:other.response];
  }
  if (other.hasSemOption) {
    [self mergeSemOption:other.semOption];
  }
  if (other.hasCheckBlock) {
    [self mergeCheckBlock:other.checkBlock];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (MessageBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (MessageBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSetBuilder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    SInt32 tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        MessageMessageType value = (MessageMessageType)[input readEnum];
        if (MessageMessageTypeIsValidValue(value)) {
          [self setType:value];
        } else {
          [unknownFields mergeVarintField:1 value:value];
        }
        break;
      }
      case 18: {
        MessageInfoBuilder* subBuilder = [MessageInfo builder];
        if (self.hasInfo) {
          [subBuilder mergeFrom:self.info];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setInfo:[subBuilder buildPartial]];
        break;
      }
      case 24: {
        MessageResponse value = (MessageResponse)[input readEnum];
        if (MessageResponseIsValidValue(value)) {
          [self setResponse:value];
        } else {
          [unknownFields mergeVarintField:3 value:value];
        }
        break;
      }
      case 34: {
        MessageSemOptionsBuilder* subBuilder = [MessageSemOptions builder];
        if (self.hasSemOption) {
          [subBuilder mergeFrom:self.semOption];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setSemOption:[subBuilder buildPartial]];
        break;
      }
      case 42: {
        MessageCheckBlockBuilder* subBuilder = [MessageCheckBlock builder];
        if (self.hasCheckBlock) {
          [subBuilder mergeFrom:self.checkBlock];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setCheckBlock:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasType {
  return resultMessage.hasType;
}
- (MessageMessageType) type {
  return resultMessage.type;
}
- (MessageBuilder*) setType:(MessageMessageType) value {
  resultMessage.hasType = YES;
  resultMessage.type = value;
  return self;
}
- (MessageBuilder*) clearType {
  resultMessage.hasType = NO;
  resultMessage.type = MessageMessageTypeHb;
  return self;
}
- (BOOL) hasInfo {
  return resultMessage.hasInfo;
}
- (MessageInfo*) info {
  return resultMessage.info;
}
- (MessageBuilder*) setInfo:(MessageInfo*) value {
  resultMessage.hasInfo = YES;
  resultMessage.info = value;
  return self;
}
- (MessageBuilder*) setInfoBuilder:(MessageInfoBuilder*) builderForValue {
  return [self setInfo:[builderForValue build]];
}
- (MessageBuilder*) mergeInfo:(MessageInfo*) value {
  if (resultMessage.hasInfo &&
      resultMessage.info != [MessageInfo defaultInstance]) {
    resultMessage.info =
      [[[MessageInfo builderWithPrototype:resultMessage.info] mergeFrom:value] buildPartial];
  } else {
    resultMessage.info = value;
  }
  resultMessage.hasInfo = YES;
  return self;
}
- (MessageBuilder*) clearInfo {
  resultMessage.hasInfo = NO;
  resultMessage.info = [MessageInfo defaultInstance];
  return self;
}
- (BOOL) hasResponse {
  return resultMessage.hasResponse;
}
- (MessageResponse) response {
  return resultMessage.response;
}
- (MessageBuilder*) setResponse:(MessageResponse) value {
  resultMessage.hasResponse = YES;
  resultMessage.response = value;
  return self;
}
- (MessageBuilder*) clearResponse {
  resultMessage.hasResponse = NO;
  resultMessage.response = MessageResponseOk;
  return self;
}
- (BOOL) hasSemOption {
  return resultMessage.hasSemOption;
}
- (MessageSemOptions*) semOption {
  return resultMessage.semOption;
}
- (MessageBuilder*) setSemOption:(MessageSemOptions*) value {
  resultMessage.hasSemOption = YES;
  resultMessage.semOption = value;
  return self;
}
- (MessageBuilder*) setSemOptionBuilder:(MessageSemOptionsBuilder*) builderForValue {
  return [self setSemOption:[builderForValue build]];
}
- (MessageBuilder*) mergeSemOption:(MessageSemOptions*) value {
  if (resultMessage.hasSemOption &&
      resultMessage.semOption != [MessageSemOptions defaultInstance]) {
    resultMessage.semOption =
      [[[MessageSemOptions builderWithPrototype:resultMessage.semOption] mergeFrom:value] buildPartial];
  } else {
    resultMessage.semOption = value;
  }
  resultMessage.hasSemOption = YES;
  return self;
}
- (MessageBuilder*) clearSemOption {
  resultMessage.hasSemOption = NO;
  resultMessage.semOption = [MessageSemOptions defaultInstance];
  return self;
}
- (BOOL) hasCheckBlock {
  return resultMessage.hasCheckBlock;
}
- (MessageCheckBlock*) checkBlock {
  return resultMessage.checkBlock;
}
- (MessageBuilder*) setCheckBlock:(MessageCheckBlock*) value {
  resultMessage.hasCheckBlock = YES;
  resultMessage.checkBlock = value;
  return self;
}
- (MessageBuilder*) setCheckBlockBuilder:(MessageCheckBlockBuilder*) builderForValue {
  return [self setCheckBlock:[builderForValue build]];
}
- (MessageBuilder*) mergeCheckBlock:(MessageCheckBlock*) value {
  if (resultMessage.hasCheckBlock &&
      resultMessage.checkBlock != [MessageCheckBlock defaultInstance]) {
    resultMessage.checkBlock =
      [[[MessageCheckBlock builderWithPrototype:resultMessage.checkBlock] mergeFrom:value] buildPartial];
  } else {
    resultMessage.checkBlock = value;
  }
  resultMessage.hasCheckBlock = YES;
  return self;
}
- (MessageBuilder*) clearCheckBlock {
  resultMessage.hasCheckBlock = NO;
  resultMessage.checkBlock = [MessageCheckBlock defaultInstance];
  return self;
}
@end


// @@protoc_insertion_point(global_scope)