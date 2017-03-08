//
//  YLAuthorInfo+YLPersistence.m
//  YLGitBook
//
//  Created by Relly on 08/03/2017.
//  Copyright © 2017 YL. All rights reserved.
//
static NSString *const INSERT_STATEMENT = @"INSERT INTO author_info(id, type, name, username, website, bio) VALUES(:id, :type, :name, :username, :website, :bio);";

static NSString *const UPDATE_STATEMENT = @"UPDATE author_info SET id = :id, type = :type, name = :name, username = :username, website = :website, bio = :bio WHERE id = :id";

#import "YLAuthorInfo+YLPersistence.h"

@implementation YLAuthorInfo (YLPersistence)

- (BOOL)yl_saveOrUpdateWithDB:(FMDatabase *)db
{
    BOOL result = NO;
    FMResultSet *rs = [db executeQuery:@"SELECT *FROM author_info WHERE id = ? LIMIT 1;", self.id];
    @onExit {
        [rs close];
    };
    if(!rs) {
        MRCLogLastError(db);
    }
    
    NSString *sql = ![rs next] ? INSERT_STATEMENT : UPDATE_STATEMENT;
    NSMutableDictionary *dict = [[self yy_modelToJSONObject] mutableCopy];
    if(![dict objectForKey:@"bio"]) {
        [dict setObject:@"" forKey:@"bio"];
    }
    [dict removeObjectForKey:@"urls"];
    result = [db executeUpdate:sql withParameterDictionary:dict];
    if(!result) {
        MRCLogLastError(db);
    }
    
    return result;

}

- (BOOL)yl_saveOrUpdate
{
    __block BOOL result = NO;
    [[FMDatabaseQueue sharedInstance] inDatabase:^(FMDatabase *db) {
        result = [self yl_saveOrUpdateWithDB:db];
    }];
    
    return result;
}
- (BOOL)yl_delete
{
    return NO;
}
@end
