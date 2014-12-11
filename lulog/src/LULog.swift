//
//  LULog.swift
//
//  Created by lujiawu on 14/12/11.
//
//

struct LULog {
    
    static var debugEnabled = true
    static var colorEnabled = true
    
    static func debug(tmp : String , args : AnyObject...){
        if( !debugEnabled ){
            return
        }
        if( colorEnabled ){
            ColorLog.blue( self.constructLine(tmp, args: args) )
        }else{
            println(self.constructLine(tmp, args: args))
        }
        
    }
    
    static func error(tmp : String , args : AnyObject...){
        if( colorEnabled ){
            ColorLog.red( self.constructLine(tmp, args: args) )
        }else{
            println(self.constructLine(tmp, args: args))
        }
    }
    
    
    static func constructLine(tmp : String , args : [AnyObject]) -> String {
        if( 0 == args.count){
            return tmp;
        }
        var out = tmp;
        for arg in args {
            var range = out.rangeOfString("{}")
            if( nil != range ){
                out = out.stringByReplacingCharactersInRange(range!, withString: "\(arg)");
            }else{
                out = out.stringByAppendingString(" | \(arg)")
            }
        }
        return out;
    }
    
    
}
