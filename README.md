# PLC-Coursework
## What is this?
This is a Haskell interpreter that can be used to query data from the provided RDF files 
* Input files must follow RDF specification - (Have a look at https://www.w3.org/TR/turtle/ for more details )

## How to run the interpreter
#### Step 1: 
> Compile the RDF Lexer & Language Lexer using the Alex tool
```
$ alex RDF_Lexer.x
$ alex LangTokens.x
```

#### Step 2: 
> Compile the RDF Parser with the Happy tool
```
$ happy RDF_Parser.y
$ happy LangParser.y
```

#### Step 3:
> Create turtle files(.tll) and write your processing query script in a ".q" file
```
e.g. [script.q]
Contents:
---------
union ["foo.tll",'testing.tll'] "foo.tll" 
```

#### Step 4: 
> Run parser with runghc command and provide the file where you have written your code at 
```
$ runghc LangParser.hs
> script.q
```



## Language Specification:
### BNF
```
QUERY = QUERY_WITH_FILE |
        QUERY_WITH_FILE where VAR_ASSIGNMENTS

QUERY_WITH_FILE = FUNCTION FILE |
                  FUNCTION FILE '|' SIMPLE_QUERY

SIMPLE_QUERY = FUNCTION |
               FUNCTION '|' SIMPLE_QUERY

FUNCTIONS (Defined bellow)

VAR_ASSIGNMENTS = VAR_ASSIGNMENT |
                  VAR_ASSIGNMENT VAR_ASSIGNMENTS

VAR_ASSIGNMENT = var '=' INT_EXP |
                 var '=' STR_EXP |
                 var '=' BOOL_EXP

NODE = SUBJECT | PREDICATE | OBJECT 

SUBJECT = sbj
PREDICATE = pred
OBJECT = obj

SLIST = [FILE,FILE,FILE,...]

CONDITION = ACTION |
            BOOL_EXP ? CONDITION : CONDITION

ACTION = SUBJECT '=' URL |
         PREDICATE '=' URL |
         OBJECT '=' URL  |
         OBJECT '=' STR_EXP |
         OBJECT '=' INT_EXP |
         OBJECT '=' BOOL_EXP

URL = "<"(http\:\/\/|https\:\/\/)[\. \/ \# $alpha $digit]*">"

-- VAR can only hold integer values
VAR = $alpha+

INT = $digit+

INT_EXP : (INT_EXP | OBJECT) '+' (INT_EXP | OBJECT)          
        | (INT_EXP | OBJECT) '-' (INT_EXP | OBJECT)          
        | (INT_EXP | OBJECT) '*' (INT_EXP | OBJECT)          
        | (INT_EXP | OBJECT) '/' (INT_EXP | OBJECT)           
        | (INT_EXP | OBJECT) '^' (INT_EXP | OBJECT)
        | '(' INT_EXP ')'                                
        | '-' (INT_EXP|OBJECT)
        | INT           
        | VAR

BOOL_EXP : (BOOL_EXP | OBJECT) and (BOOL_EXP | OBJECT)
         | (BOOL_EXP | OBJECT) or (BOOL_EXP | OBJECT)
         | (INT_EXP | OBJECT) '>' (INT_EXP | OBJECT)
         | (INT_EXP | OBJECT) '<' (INT_EXP | OBJECT)
         
         | INT_EXP deq INT_EXP
         | BOOL_EXP deq BOOL_EXP
         | STR_EXP deq STR_EXP
         | URL deq URL

         | OBJECT "==" (INT_EXP | BOOL_EXP | STR_EXP)                            
         | (INT_EXP | BOOL_EXP | STR_EXP) "==" OBJECT

         | NODE "==" URL
         | URL "==" NODE
 
         | '(' BOOL_EXP ')'
         
         | true
         | false


STR_EXP = \" [$printable # \"]+ \" |
          \' [$printable # \']+ \'


```
### FUNCTIONS
```
FUNCTION = map () | 
           union SLIST |
           join {-r | -                         ,NODE) SLIST
```