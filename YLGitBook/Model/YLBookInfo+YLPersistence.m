//
//  YLBookInfo+YLPersistence.m
//  YLGitBook
//
//  Created by Relly on 08/03/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLBookInfo+YLPersistence.h"
#import "YLAuthorInfo.h"
#import "YLAuthorInfo+YLPersistence.h"
static NSString *const INSERT_STATEMENT = @"INSERT INTO book_info(id, status, name, title, license, language, book_description, is_public, bulid, created, author_id) VALUES(:id, :status, :name, :title, :license, :language, :description, :public, :bulid, :created, :author_id)";

static NSString *const UPDATE_STATEMENT = @"UPDATE book_info SET id = :id, status = :status, name = :name, title = :title, license = :license, language = :language, book_description = :description, is_public = :public, bulid = :bulid, created =:created, author_id = :author_id WHERE id = :id";

@implementation YLBookInfo (YLPersistence)
- (BOOL)yl_saveOrUpdate
{
    __block BOOL result = NO;
    [[FMDatabaseQueue sharedInstance] inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT *FROM book_info WHERE id = ? LIMIT 1;", self.id];
        @onExit {
            [rs close];
        };
        
        if(rs == nil) {
            MRCLogLastError(db);
            result = NO;
            return;
        }
        
        NSString *sql = ![rs next] ? INSERT_STATEMENT : UPDATE_STATEMENT;
        NSMutableDictionary *dict = [[self yy_modelToJSONObject] mutableCopy];
        [dict removeObjectForKey:@"author"];
        [dict removeObjectForKey:@"counts"];
        [dict removeObjectForKey:@"cover"];
        [dict removeObjectForKey:@"dates"];
        [dict setObject:self.dates.build forKey:@"bulid"];
        [dict setObject:self.dates.created forKey:@"created"];
        [dict setObject:self.author.id forKey:@"author_id"];
        
        result = [db executeUpdate:sql withParameterDictionary:dict];
        if(!result) {
            result = NO;
            MRCLogLastError(db);
            return;
        }
        [self.author yl_saveOrUpdateWithDB:db];
    }];
    return YES;
}
- (BOOL)yl_delete
{
    __block BOOL result = NO;
    [[FMDatabaseQueue sharedInstance] inTransaction:^(FMDatabase *db, BOOL *rollback) {
        result = [db executeQuery:@"DELETE FROM WHERE id = ?", self.id];
        if(!result) {
            MRCLogLastError(db);
        }
    }];
    return result;
}
@end
