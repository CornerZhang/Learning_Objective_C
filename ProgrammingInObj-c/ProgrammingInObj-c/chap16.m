#import <Foundation/Foundation.h>

int main( int argc, char* argv[] ) {
    @autoreleasepool {
#if 0
        // 16.1
        {
            NSString * fName = @"testFile";
            NSFileManager * fileManager = nil;
            NSDictionary * attr;
            
            fileManager = [NSFileManager defaultManager];
            NSString * homeDir = [fileManager currentDirectoryPath];
            
            // check existing
            if( [fileManager fileExistsAtPath: fName] == NO ) {
                NSLog(@"File doesn't exist!");
                return 1;
            }
            
            // copy as "newFile"
            if( [fileManager copyItemAtPath: fName toPath: @"newFile" error: NULL] == NO ) {
                NSLog(@"File Copy failed!");
                return 2;
            }
            
            // compare file binary equal?
            if( [fileManager contentsEqualAtPath: fName andPath: @"newFile"] == NO ) {
                NSLog(@"Files are not Equal!");
                return 3;
            }
            
            // rename
            if( [fileManager moveItemAtPath: @"newFile" toPath: @"newFile2" error: NULL] == NO ) {
                NSLog(@"File rename Failed!");
                return 4;
            }
            
            if( (attr = [fileManager attributesOfItemAtPath: @"newFile2" error: NULL]) == nil ) {
                NSLog(@"Couldn't get file attributes!");
                return 5;
            }
            
            // file size
            NSLog(@"File size is %llu bytes", [[attr objectForKey: NSFileSize] unsignedLongLongValue]);
            
            if( [fileManager removeItemAtPath: fName error: NULL] == NO ) {
                NSLog(@"file removal failed!");
                return 6;
            }
            
            NSLog(@"All operations were successful");
            
            // file encoding
            NSLog(@"%@", [NSString stringWithContentsOfFile: @"newFile2" encoding: NSUTF8StringEncoding error:NULL]);
            
        }
#endif
        
#if 0
        // 16.2
        {
            NSFileManager*	fileManager = nil;
            NSData*			fileData = nil;
            
            fileManager = [NSFileManager defaultManager];
            
            // read "newFile2" from current dir
            fileData = [fileManager contentsAtPath: @"newFile2"];
            if( fileData == nil ) {
                NSLog(@"File read failed!");
                return 1;
            }
            // write data to "newFile3", and create it
            if( [fileManager createFileAtPath: @"newFile3" contents: fileData attributes: nil] == NO ) {
                NSLog(@"Couldn't create the copy!");
                return 2;
            }
            NSLog(@"File copy was successful!");
        }
#endif
        
#if 0
        // 16.4
        {
            NSString* path;
            NSFileManager* fileManager;
            NSDirectoryEnumerator* dirEnum;
            NSArray*	dirArray;
            
            fileManager = [NSFileManager defaultManager];
            path = [fileManager currentDirectoryPath];
            dirEnum = [fileManager enumeratorAtPath: path];
            NSLog(@"Contents of %@", path);
            
            while( (path = [dirEnum nextObject]) != nil ) {
                NSLog(@"%@", path);
            }
            
            dirArray = [fileManager contentsOfDirectoryAtPath: [fileManager currentDirectoryPath] error: NULL];
            NSLog(@"Contents using contentsOfDirectoryAtPath:error:");
            
            for( path in dirArray )
                NSLog(@"%@",path);
        }
        
#endif
        
#if 0
        // 16.8
        {
            NSFileHandle* inFile, * outFile;
            NSData*	buffer;
            
            inFile = [NSFileHandle fileHandleForReadingAtPath: @"FileA"];
            if( inFile==nil ) {
                NSLog(@"Open of fileA for reading failed");
                return 1;
            }
            
            outFile = [NSFileHandle fileHandleForWritingAtPath: @"fileB"];
            if( outFile==nil ) {
                NSLog(@"Open of fileB for writing failed");
                return 2;
            }
            
            [outFile seekToEndOfFile];
            
            buffer = [inFile readDataToEndOfFile];
            [outFile writeData: buffer];
            
            [inFile closeFile];
            [outFile closeFile];
            
            NSLog(@"%@",[NSString stringWithContentsOfFile: @"fileB" encoding: NSUTF8StringEncoding error: NULL]);
        }
#endif
        // 16.9
        {
            NSURL* myUrl = [NSURL URLWithString: @"http://www.apple.com"];
            NSString* myHomePage = [NSString stringWithContentsOfURL: myUrl encoding: NSASCIIStringEncoding error: NULL];
            
            NSLog(@"%@", myHomePage);
        }
    }
    
    return 0;
}