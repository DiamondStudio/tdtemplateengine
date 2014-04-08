#import <PEGKit/PKParser.h>
        
@class PKTokenizer;

enum {
    XP_TOKEN_KIND_GT = 14,
    XP_TOKEN_KIND_GE_SYM,
    XP_TOKEN_KIND_DOUBLE_AMPERSAND,
    XP_TOKEN_KIND_PIPE,
    XP_TOKEN_KIND_TRUE,
    XP_TOKEN_KIND_NOT_EQUAL,
    XP_TOKEN_KIND_BANG,
    XP_TOKEN_KIND_LT_SYM,
    XP_TOKEN_KIND_MOD,
    XP_TOKEN_KIND_LE,
    XP_TOKEN_KIND_GT_SYM,
    XP_TOKEN_KIND_LT,
    XP_TOKEN_KIND_OPEN_PAREN,
    XP_TOKEN_KIND_CLOSE_PAREN,
    XP_TOKEN_KIND_EQ,
    XP_TOKEN_KIND_YES_UPPER,
    XP_TOKEN_KIND_OR,
    XP_TOKEN_KIND_NE,
    XP_TOKEN_KIND_NOT,
    XP_TOKEN_KIND_TIMES,
    XP_TOKEN_KIND_PLUS,
    XP_TOKEN_KIND_COMMA,
    XP_TOKEN_KIND_AND,
    XP_TOKEN_KIND_DOUBLE_PIPE,
    XP_TOKEN_KIND_MINUS,
    XP_TOKEN_KIND_IN,
    XP_TOKEN_KIND_DOT,
    XP_TOKEN_KIND_DIV,
    XP_TOKEN_KIND_BY,
    XP_TOKEN_KIND_FALSE,
    XP_TOKEN_KIND_LE_SYM,
    XP_TOKEN_KIND_TO,
    XP_TOKEN_KIND_GE,
    XP_TOKEN_KIND_NO_UPPER,
    XP_TOKEN_KIND_DOUBLE_EQUALS,
};

@interface XPParser : PKParser
        
+ (PKTokenizer *)tokenizer;

@end

