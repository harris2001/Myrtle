# PLC-Coursework
## What is this?
This is a Haskell interpreter that can be used to query data from the provided RDF files 
* Input files must follow RDF specification - (Have a look at https://www.w3.org/TR/turtle/ for more details )

## How to run the interpreter
#### Step1: 
> Compile Lexer using Alex tool
```
$ alex RDF_Lexer.x
```

#### Step2: 
> Compile Parser with Happy tool
```
$ happy RDF_Parser.y
```

#### Step3: 
> Run parser with runghc command
```
$ runghc RDF_Parser.hs
```

## Language Specification:
### Functions
```
FUNCTIONS = map (CONDITION) | 
            union SLIST |
            join {-r | -l | -l -r | -r -l } (NODE,NODE) SLIST

NODE = subj | pred | obj 

SLIST = [FILE,FILE,FILE,...]

CONDITION