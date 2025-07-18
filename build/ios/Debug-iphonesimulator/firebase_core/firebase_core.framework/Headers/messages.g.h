// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// Autogenerated from Pigeon (v25.3.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class CoreFirebaseOptions;
@class CoreInitializeResponse;

@interface CoreFirebaseOptions : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithApiKey:(NSString *)apiKey
                         appId:(NSString *)appId
             messagingSenderId:(NSString *)messagingSenderId
                     projectId:(NSString *)projectId
                    authDomain:(nullable NSString *)authDomain
                   databaseURL:(nullable NSString *)databaseURL
                 storageBucket:(nullable NSString *)storageBucket
                 measurementId:(nullable NSString *)measurementId
                    trackingId:(nullable NSString *)trackingId
             deepLinkURLScheme:(nullable NSString *)deepLinkURLScheme
               androidClientId:(nullable NSString *)androidClientId
                   iosClientId:(nullable NSString *)iosClientId
                   iosBundleId:(nullable NSString *)iosBundleId
                    appGroupId:(nullable NSString *)appGroupId;
@property(nonatomic, copy) NSString *apiKey;
@property(nonatomic, copy) NSString *appId;
@property(nonatomic, copy) NSString *messagingSenderId;
@property(nonatomic, copy) NSString *projectId;
@property(nonatomic, copy, nullable) NSString *authDomain;
@property(nonatomic, copy, nullable) NSString *databaseURL;
@property(nonatomic, copy, nullable) NSString *storageBucket;
@property(nonatomic, copy, nullable) NSString *measurementId;
@property(nonatomic, copy, nullable) NSString *trackingId;
@property(nonatomic, copy, nullable) NSString *deepLinkURLScheme;
@property(nonatomic, copy, nullable) NSString *androidClientId;
@property(nonatomic, copy, nullable) NSString *iosClientId;
@property(nonatomic, copy, nullable) NSString *iosBundleId;
@property(nonatomic, copy, nullable) NSString *appGroupId;
@end

@interface CoreInitializeResponse : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithName:(NSString *)name
                             options:(CoreFirebaseOptions *)options
    isAutomaticDataCollectionEnabled:(nullable NSNumber *)isAutomaticDataCollectionEnabled
                     pluginConstants:(NSDictionary<NSString *, id> *)pluginConstants;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, strong) CoreFirebaseOptions *options;
@property(nonatomic, strong, nullable) NSNumber *isAutomaticDataCollectionEnabled;
@property(nonatomic, copy) NSDictionary<NSString *, id> *pluginConstants;
@end

/// The codec used by all APIs.
NSObject<FlutterMessageCodec> *nullGetMessagesCodec(void);

@protocol FirebaseCoreHostApi
- (void)initializeAppAppName:(NSString *)appName
        initializeAppRequest:(CoreFirebaseOptions *)initializeAppRequest
                  completion:(void (^)(CoreInitializeResponse *_Nullable,
                                       FlutterError *_Nullable))completion;
- (void)initializeCoreWithCompletion:(void (^)(NSArray<CoreInitializeResponse *> *_Nullable,
                                               FlutterError *_Nullable))completion;
- (void)optionsFromResourceWithCompletion:(void (^)(CoreFirebaseOptions *_Nullable,
                                                    FlutterError *_Nullable))completion;
@end

extern void SetUpFirebaseCoreHostApi(id<FlutterBinaryMessenger> binaryMessenger,
                                     NSObject<FirebaseCoreHostApi> *_Nullable api);

extern void SetUpFirebaseCoreHostApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger,
                                               NSObject<FirebaseCoreHostApi> *_Nullable api,
                                               NSString *messageChannelSuffix);

@protocol FirebaseAppHostApi
- (void)setAutomaticDataCollectionEnabledAppName:(NSString *)appName
                                         enabled:(BOOL)enabled
                                      completion:(void (^)(FlutterError *_Nullable))completion;
- (void)setAutomaticResourceManagementEnabledAppName:(NSString *)appName
                                             enabled:(BOOL)enabled
                                          completion:(void (^)(FlutterError *_Nullable))completion;
- (void)deleteAppName:(NSString *)appName completion:(void (^)(FlutterError *_Nullable))completion;
@end

extern void SetUpFirebaseAppHostApi(id<FlutterBinaryMessenger> binaryMessenger,
                                    NSObject<FirebaseAppHostApi> *_Nullable api);

extern void SetUpFirebaseAppHostApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger,
                                              NSObject<FirebaseAppHostApi> *_Nullable api,
                                              NSString *messageChannelSuffix);

NS_ASSUME_NONNULL_END
