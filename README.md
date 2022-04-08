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

NODE = subj | pred | obj 

SLIST = [FILE,FILE,FILE,...]

CONDITION = ACTION |
            BOOL_EXP ? CONDITION : CONDITION

ACTION = subj '=' URL |
         pred '=' URL |
         obj '=' URL  |
         obj '=' STR_EXP |
         obj '=' INT_EXP |
         obj '=' BOOL_EXP

URL = "<"(http\:\/\/|https\:\/\/)[\. \/ \# $alpha $digit]*">"

STR_EXP = \" [$printable # \"]+ \" |
          \' [$printable # \']+ \'

INT_EXP = $digit+

BOOL_EXP = true | false

```
### FUNCTIONS
```
FUNCTION = map (CONDITION) | 
           union SLIST |
           join {-r | -l | -l -r | -r -l } (NODE,NODE) SLIST
```