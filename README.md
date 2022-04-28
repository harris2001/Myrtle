# Myrtle lang
![Myrtle](Resources/Images/MyrtleLang.png)
# PLC-Coursework
## What is this?
This is a Haskell interpreter that can be used to query data from the provided RDF files 
* Input files must follow RDF specification - (Have a look at https://www.w3.org/TR/turtle/ for more details )

## How to run the interpreter
#### Step 1: 
> Compile the Language Lexer using the Alex tool
```
$ alex MyrtleLexer.x
```

#### Step 2: 
> Compile the Language Parser with the Happy tool
```
$ happy MyrtleParser.y
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
> Run parser with runghc command and provide the file where you have written your code as an argument
```
$ runghc Stql.hs pr1.stql
```



## Language Specification:
### BNF
```

QUERY = FILTERED_QUERY ">>" FILE |
        FILTERED QUERY

FILTERED_QUERY = BASIC_QUERY |
                 QUERY_WITH_FILE where VAR_ASSIGNMENTS

BASIC_QUERY = FUNCTION |
               FUNCTION '|' BASIC_QUERY

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
FUNCTION = select (CONDITION) |
           map (CONDITION) | 
           union SLIST |
           join {-r | -l | -l -r | -r -l } (NODE,NODE) SLIST
```
### EXAMPLE COMMANDS
```
union "foo.ttl"                                         : Prints the content of foo.ttl (sorted )
union ["foo.ttl",'bar.ttl'] >> "out.ttl"                : Outputs the result of unioning foo & bar files in out.ttl
union "foo.ttl" | union 'bar.ttl' >> "out.ttl"          : Exactly the same as above
```

#### USE OF WHERE CONDITION
###### Variables can be assigned as follows
```
where x1 = 1                                            : from integer values
      x2 = (1+2*3-4/5)^6                                : from integer expressions
      x3 = true and (5>0 or 40<20)                      : from boolean expressions
      x4 = "testing"                                    : from string literals
```