#define char_is_whitespace
/// char_is_whitespace(char)

var char = argument0;

if (char == " ") return true;
return false;
#define char_is_alphanumeric
/// char_is_alphanumeric(c)
/// Is true if c is a-z, A-Z, 0-9, _

var c = argument0;
var oc = ord(c);
if (oc >= ord('a') and oc <= ord('z')) return true;
if (oc >= ord('A') and oc <= ord('Z')) return true;
if (oc >= ord('0') and oc <= ord('9')) return true;
if (c == '_') return true;
return false;
#define char_is_alphabetical
/// char_is_alphanumeric(c)
/// Is true if c is a-z, A-Z, 0-9, _

var c = argument0;
var oc = ord(c);
if (oc >= ord('a') and oc <= ord('z')) return true;
if (oc >= ord('A') and oc <= ord('Z')) return true;
if (c == '_') return true;
return false;
#define char_is_numeric
/// char_is_numeric(c)
/// Is true if c is a-z, A-Z, 0-9, _

var c = argument0;
var oc = ord(c);
if (oc >= ord('0') and oc <= ord('9')) return true;
return false;
#define log_debug
/// log_debug(message)
if (!is_string(argument0)) {
    show_debug_message(string(argument0));
} else {
    show_debug_message(argument0);
}
#define log_warn
/// log_warn(message)
show_message(argument0);
#define log_error
/// log_error(error_message)
show_error(argument0, true);
game_end();
#define string_trim
/// string_trim(string)
/// Trim whitespace from both sides of string

var str = argument0;

// Trim from left
var pos = 1;
while (char_is_whitespace(string_char_at(str, pos)) and pos <= string_length(str)) {
    pos++;
}
str = string_copy(str, pos, string_length(str) - (pos-1));

// Trim from right
var pos = string_length(str);
while (char_is_whitespace(string_char_at(str, pos)) and pos >= 1) {
    pos++;
}
str = string_copy(str, 1, pos);

return str;
#define string_trim_left
/// string_trim(string)
/// Trim whitespace from both sides of string

var str = argument0;

// Trim from left
var pos = 1;
while (char_is_whitespace(string_char_at(str, pos)) and pos <= string_length(str)) {
    pos++;
}
return string_copy(str, pos, string_length(str) - (pos-1));
#define string_is_alphanumeric
/// string_is_alphanumeric(string)

var str = argument0;

if (string_is_empty(str)) return false;

for (var pos = 1; pos <= string_length(str); pos++) {
    if (!char_is_alphanumeric(string_char_at(str, pos))) {
        return false;
    }
}

return true;
#define string_is_empty
/// string_is_empty(string)

return argument0 == "";
#define string_startswith
/// string_startswith(string, substr)

var str = argument0;
var subs = argument1;

if (string_is_empty(str)) return false;
return string_copy(str, 1, string_length(subs)) == subs;
#define string_startswithchar
/// string_startswithchar(string, char)

var str = argument0;
var c = argument1;

if (string_is_empty(str)) return false;
return string_char_at(str, 1) == c;
#define string_endswithchar
/// string_endswithchar(string, char)

var str = argument0;
var c = argument1;

if (string_is_empty(str)) return false;
return string_char_at(str, string_length(str)) == c;
#define assert
/// assert(statement, error_message)

if (argument0 == false) {
    log_error(argument1);
}
#define json_encode_list
/// json_encode_list(list)

if (ds_exists(argument0, ds_type_list)) {
    var m = ds_map_create();
    ds_map_add_list(m, "list", argument0);
    var ret = json_encode(m);
    ds_map_delete(m, "list");
    ds_map_destroy(m);
    return ret;
}
else {
    return "";
}
#define ds_list_add_list
/// ds_list_add_list(list, list_to_add)

ds_list_add(argument0, argument1);
ds_list_mark_as_list(argument0, ds_list_size(argument0)-1);
#define b2script_failure
/// b2script_failure(section, line, error);

log_warn(argument0 + " failure on line " + string(argument1) + ":#" + argument2);
#define b2script_run

var filename = argument[0];

var args = ds_list_create();
for (var i = 1; i < argument_count; i++) {
    ds_list_add(args, argument[i]);
}

if (!ds_map_exists(global.b2script_loaded, filename)) {
    if (b2script_load(filename)) {
        log_debug("Running script: " + filename);
        var script = global.b2script_loaded[? filename];
        var ret = executor(script, args);
        ds_list_destroy(args);
        return ret;
    } else {
        log_debug("Failed to load script: " + filename);
        ds_list_destroy(args);
        return NULL;
    }

} else {
    log_debug("Running script: " + filename);
    var script = global.b2script_loaded[? filename];
    var ret = executor(script, args);
    ds_list_destroy(args);
    return ret;
}
#define b2script_load
/// b2script_load(scriptname)

var filename = argument0;

var path = working_directory + "\" + filename;
log_debug("Loading script: " + path);

var lexed = lexer(global.b2script_grammar, path);
if (lexed == NULL) {
    return false;
}

var parsed = parser(global.b2script_grammar, lexed);
ds_list_destroy(lexed);
if (parsed == NULL) {
    return false;
}

if (ds_map_exists(global.b2script_loaded, filename)) {
    var existing = global.b2script_loaded[? filename];
    ds_list_destroy(existing);
}
global.b2script_loaded[? filename] = parsed;

return true;
#define b2script_init
/// b2script_init(constantsFile)

var consFile = argument0;

global.b2script_loaded = ds_map_create();
global.b2script_grammar = grammar_read("b2script.gr");
if (is_string(consFile) and file_exists(working_directory + "\" + consFile)) {
    grammar_addConstants(global.b2script_grammar, consFile);
}
#define executor
/// executor(syntaxTree, argsList)
/// Executes syntax tree. Returns execution result, or NULL

var tree = argument0;
var argsList = argument1;

if (!ds_exists(tree, ds_type_list)) {
    log_debug("Executor: SyntaxTree list did not exist, returning NULL");
    return NULL;
}

global.executor_failure = false;
global.executor_stop = false;
global.executor_returnValue = 0;

// Read input arguments into state
var state = ds_map_create();
for (i = 0; i < ds_list_size(argsList); i++) {
    var argName = "argument" + string(i);
    var argValue = argsList[| i];
    state[? argName] = argValue;
}

executor_inner(tree, state);
ds_map_destroy(state);

return global.executor_returnValue;

#define executor_inner
/// executor_inner(syntaxTree, state)
/// Executes syntax tree. Returns execution result, or NULL

var tree = argument0;
var state = argument1;

if executor_stopExec() return NULL;

if (!ds_exists(tree, ds_type_list)) {
    log_debug("Executor: SyntaxTree list did not exist, returning NULL");
    return NULL;
}

if (ds_list_size(tree) == 0) {
    return NULL;
}

var type = tree[| 0];

// Execute
switch (type) {
    case "b2script":
        return executor_inner(tree[| 1], state);
        break;
        
    case "prog":
        // List of statements
        var stmtList = tree[| 1];
        for (var i = 0; i < ds_list_size(stmtList) and !executor_stopExec(); i++) {
            executor_inner(stmtList[| i], state)
        }
        return NULL;
        break;
        
    case "stmt":
        if (ds_list_size(tree) == 4) {
            // List of statements in brackets
            var stmtList = tree[| 2];
            for (var i = 0; i < ds_list_size(stmtList) and !executor_stopExec(); i++) {
                executor_inner(stmtList[| i], state)
            }
            return NULL;
        } else {
            // Single statement
            return executor_inner(tree[| 1], state);
        }
        break;
        
    case "fcall":
        // Function call
        var scriptToken = tree[| 1];
        var scriptName = scriptToken[| 1];
        
        // Execute function arguments
        var args = ds_list_create();
        var fargs = tree[| 3];
        var argTokens = fargs[| 1];
        for (var i = 0; i < ds_list_size(argTokens) and !executor_stopExec(); i++) {
            var arg = executor_inner(argTokens[| i], state);
            ds_list_add(args, arg);
        }
        if (executor_stopExec()) { ds_list_destroy(args); return NULL; }
        
        if (asset_get_type(scriptName) == asset_script) {
            var script = asset_get_index(scriptName);
            var ret = executor_script_execute_arglist(script, args);
            ds_list_destroy(args);
            return ret;
        } else {
            var ret = executor_function(scriptName, args);
            ds_list_destroy(args);
            return ret;
        }
        break;
        
    case "expr":
        var boolexpr = executor_inner(tree[| 1], state);
        return executor_doBoolExpr(boolexpr, state);
        break;
    
    case "boolexpr":
        var exprTree1 = tree[| 1];
        if (ds_list_size(tree) == 2) {
            var boolexpr = ds_list_create();
            boolexpr[| 0] = exprTree1;
            return boolexpr;
        } else {
            var exprTree2 = tree[| 3];
            var boolOpTree = tree[| 2];
            var boolOpToken = boolOpTree[| 1];
            var boolOp = boolOpToken[| 0];
            
            var boolexpr = executor_inner(exprTree2, state);
            ds_list_insert(boolexpr, 0, boolOp);
            ds_list_insert(boolexpr, 0, exprTree1);
            return boolexpr;
        }
        
    case "eqexpr":
        var exprTree1 = tree[| 1];
        var expr1 = executor_inner(exprTree1, state);
        if (executor_stopExec()) return NULL;
        var expr1val = executor_doArithmeticExpr(expr1);
        if (executor_stopExec()) return NULL;
        
        if (ds_list_size(tree) == 2) {
            return expr1val;
        } else {
            var exprTree2 = tree[| 3];
            var expr2 = executor_inner(exprTree2, state);
            if (executor_stopExec()) return NULL;
            var expr2val = executor_doArithmeticExpr(expr2);
            if (executor_stopExec()) return NULL;
            
            var opTree = tree[| 2];
            var comparatorToken = opTree[| 1];
            var comparator = comparatorToken[| 0];
            
            var res = executor_compare(expr1val, expr2val, comparator);
            return res;
        }
        break;
        
    case "arithexpr":
        var primaryExprTree = tree[| 1];
        var primaryExpr = executor_inner(primaryExprTree, state);
        if (executor_stopExec()) return NULL;
        
        if (ds_list_size(tree) == 2) {
            var arithExpr = ds_list_create();
            arithExpr[| 0] = primaryExpr;
            return arithExpr;
        } else {
            var arithSubExprTree = tree[| 3];
            var arithSubExpr = executor_inner(arithSubExprTree, state);
            if (executor_stopExec()) return NULL;
            
            var opTree = tree[| 2];
            var op = opTree[| 1];
            var opType = op[| 0];
            
            ds_list_insert(arithSubExpr, 0, opType);
            ds_list_insert(arithSubExpr, 0, primaryExpr);
            return arithSubExpr;
        }
        break;
    
    case "primary":
        var token = tree[| 1];
        var tokenType = token[| 0];
        var tokenVal = token[| 1];
        switch (tokenType) {
            case "fcall":
                return executor_inner(token, state);
                break;
            case "TRUE":
                return true;
                break;
            case "FALSE":
                return false;
                break;
            case "INT":
            case "FLOAT":
                return real(tokenVal);
                break;
            case "STRING":
                return string_copy(tokenVal, 2, string_length(tokenVal)-2); // Strip surrounding quotes
                break;
            case "WORD":
                return executor_word(tokenVal, state);
                break;
            case "LPAR":
                return executor_inner(tree[| 2], state);
                break;
            case "MINUS":
                var res = executor_inner(tree[| 2], state);
                if (executor_stopExec()) return NULL;
                if (!is_string(res)) {
                    return -res;
                } else {
                    log_warn("Execution failure#Cannot do '-' on string: " + res);
                    global.executor_failure = true;
                    return NULL;
                }
                // TODO
                break;
        }
        break;
        
    case "ifstmt":
        var compareTree = tree[| 2];
        var compareResult = executor_inner(compareTree, state);
        if (executor_stopExec()) return NULL;
        if (compareResult) {
            var stmtTree = tree[| 3];
            return executor_inner(stmtTree, state);
        }
        break;
        
    case "ifelstmt":
        var compareTree = tree[| 2];
        var compareResult = executor_inner(compareTree, state);
        if (executor_stopExec()) return NULL;
        if (compareResult) {
            var stmtTree = tree[| 3];
            return executor_inner(stmtTree, state);
        } else {
            var stmtElseTree = tree [| 5];
            return executor_inner(stmtElseTree, state);
        }
        break;
    
    case "withstmt":
        var instanceTree = tree[| 3];
        var instance = executor_inner(instanceTree, state);
        if (executor_stopExec()) return NULL;
        if (is_string(instance)) {
            log_warn("Execution failure#Invalid instance id (Cannot be a string): " + instance);
            global.executor_failure = true;
            return NULL;
        }
        else if (instance_exists(instance)) {
            var stmtTree = tree[| 5];
            with (instance) {
                executor_inner(stmtTree, state);
            }
            return NULL;
        }
        else {
            log_warn("Execution failure#No instance with id: " + string(instance));
            global.executor_failure = true;
            return NULL;
        }
        break;
        
    case "vdef":
        // Do nothing! Just here to support GMS syntax.
        return NULL;
        break;
        
    case "vdefass":
        // Write value to variable
        var variableToken = tree[| 2];
        var variableName = variableToken[| 1];
        
        var exprTree = tree[| 4];
        var value = executor_inner(exprTree, state);
        if (executor_stopExec()) return NULL;
        if (!executor_variable_set(variableName, value)) {
            state[? variableName] = value;
        }
        return value;
        break;
        
    case "vass":
        // Write value to variable
        var variableToken = tree[| 1];
        var variableName = variableToken[| 1];
        
        var exprTree = tree[| 3];
        var value = executor_inner(exprTree, state);
        if (executor_stopExec()) return NULL;
        if (!executor_variable_set(variableName, value)) {
            state[? variableName] = value;
        }
        return value;
        break;
        
    case "returnstmt":
        var exprTree = tree[| 2];
        var expr = executor_inner(exprTree, state);
        global.executor_stop = true;
        global.executor_returnValue = expr;
        return NULL;
        break;
        
    // TODO
    case "switchstmt":
    case "vassacc":
    case "vassdpt":
    case "dotnot":
    case "accessor":
    case "accessorarray":
    case "accessorlist":
    case "accessormap":
    case "accessorgrid":
        return NULL;
        break;
}

#define executor_script_execute_arglist
/// executor_script_execute_arglist(script, args)

var script = argument0;
var args = argument1;

var argc = ds_list_size(args);

if (argc == 0)       { return script_execute(script); }
else if (argc == 1)  { return script_execute(script, args[| 0]); }
else if (argc == 2)  { return script_execute(script, args[| 0], args[| 1]); }
else if (argc == 3)  { return script_execute(script, args[| 0], args[| 1], args[| 2]); }
else if (argc == 4)  { return script_execute(script, args[| 0], args[| 1], args[| 2], args[| 3]); }
else if (argc == 5)  { return script_execute(script, args[| 0], args[| 1], args[| 2], args[| 3], args[| 4]); }
else if (argc == 6)  { return script_execute(script, args[| 0], args[| 1], args[| 2], args[| 3], args[| 4], args[| 5]); }
else if (argc == 7)  { return script_execute(script, args[| 0], args[| 1], args[| 2], args[| 3], args[| 4], args[| 5], args[| 6]); }
else if (argc == 8)  { return script_execute(script, args[| 0], args[| 1], args[| 2], args[| 3], args[| 4], args[| 5], args[| 6], args[| 7]); }
else if (argc == 9)  { return script_execute(script, args[| 0], args[| 1], args[| 2], args[| 3], args[| 4], args[| 5], args[| 6], args[| 7], args[| 8]); }
else if (argc == 10) { return script_execute(script, args[| 0], args[| 1], args[| 2], args[| 3], args[| 4], args[| 5], args[| 6], args[| 7], args[| 8], args[| 9]); }
else if (argc == 11) { return script_execute(script, args[| 0], args[| 1], args[| 2], args[| 3], args[| 4], args[| 5], args[| 6], args[| 7], args[| 8], args[| 9], args[| 10]); }
else {
    log_warn("Execution failure#Too many script arguments: " + string(argc));
    global.executor_failure = true;
    return NULL;
}

#define executor_word
/// executor_word(word, state)

var word = argument0;
var state = argument1;

// Check if asset
if (asset_get_type(word) != asset_unknown) {
    return asset_get_index(word);
}

// Check if script variable
if (ds_map_exists(state, word)) {
    return state[? word];
}

return executor_variable_get(word);

#define executor_compare
/// executor_compare(val1, val2, comparator)

var val1 = argument0;
var val2 = argument1;
var comparator = argument2;

switch (comparator) {
    case "EQ":
        return val1 == val2;
        break;
    case "NEQ":
        return val1 != val2;
        break;
    case "LTEQ":
        return val1 <= val2;
        break;
    case "GTEQ":
        return val1 >= val2;
        break;
    case "LT":
        return val1 < val2;
        break;
    case "GT":
        return val1 > val2;
        break;

    default:
        log_warn("Execution failure#Invalid comparator: " + comparator);
        global.executor_failure = false;
        return NULL;
        break;
}

#define executor_function
/// executor_function(functionName, args)

var fn = argument0;
var args = argument1;

if (fn == "string") {
    if (executor_function_checkArgLength(fn, args, 1)) {
        return string(args[| 0]);  
    }
    return NULL;
}

else if (fn == "real") {
    if (executor_function_checkArgLength(fn, args, 1)) {
        return real(args[| 0]);  
    }
    return NULL;
}

else if (fn == "random") {
    if (executor_function_checkArgLength(fn, args, 1)) {
        return random(args[| 0]);  
    }
    return NULL;
}

else if (fn == "irandom") {
    if (executor_function_checkArgLength(fn, args, 1)) {
        return irandom(args[| 0]);  
    }
    return NULL;
}

else if (fn == "irandom_range") {
    if (executor_function_checkArgLength(fn, args, 2)) {
        return irandom_range(args[| 0], args[| 1]);  
    }
    return NULL;
}

else if (fn == "instance_create") {
    if (executor_function_checkArgLength(fn, args, 3)) {
        return instance_create(args[| 0], args[| 1], args[| 2]);  
    }
    return NULL;
}

else {
    log_warn("Execution failure#Unknown function: " + fn);
    global.executor_failure = true;
    return NULL;
}

#define executor_function_checkArgLength
/// executor_function_checkArgLength(functionName, args, checkLength)

if (ds_list_size(argument1) != argument2) {
    global.executor_failure = true;
    log_warn("Execution failure#Wrong nr of arguments for function " + argument0 + ", required " + string(argument2) + ", got " + string(argument1));
    return false;
}
return true;

#define executor_doArithmeticExpr
/// executor_doArithmeticExpr(arithExpr)

var expr = argument0;
var size = ds_list_size(expr);

// Combine DIV
var n = 1;
while (n < size) {
    var opType = expr[| n];
    if (opType == "DIV") {
        var v1 = expr[| n-1];
        var v2 = expr[| n+1];
        
        if (v2 == 0) {
            // Fail on div by zero
            log_warn("Executor failure#Division by zero");
            global.executor_failure = false;
            return NULL;
        }
        
        if (is_string(v1)) {
            log_warn("Execution failure#Cannot do '/' on string: " + v1);
            global.executor_failure = true;
            return NULL
        }
        if (is_string(v2)) {
            log_warn("Execution failure#Cannot do '/' on string: " + v2);
            global.executor_failure = true;
            return NULL
        }
        
        var val = v1/v2;
        ds_list_delete(expr, n+1);
        ds_list_delete(expr, n);
        ds_list_delete(expr, n-1);
        ds_list_insert(expr, n-1, val);
        size -= 2;
    } else {
        n += 2;
    }
}

// Combine MULT
n = 1;
while (n < size) {
    var opType = expr[| n];
    if (opType == "MULT") {
        var v1 = expr[| n-1];
        var v2 = expr[| n+1];
        
        if (is_string(v1)) {
            log_warn("Execution failure#Cannot do '*' on string: " + v1);
            global.executor_failure = true;
            return NULL
        }
        if (is_string(v2)) {
            log_warn("Execution failure#Cannot do '*' on string: " + v2);
            global.executor_failure = true;
            return NULL
        }
        
        var val = v1*v2;
        ds_list_delete(expr, n+1);
        ds_list_delete(expr, n);
        ds_list_delete(expr, n-1);
        ds_list_insert(expr, n-1, val);
        size -= 2;
    } else {
        n += 2;
    }
}

// Combine MINUS
n = 1;
while (n < size) {
    var opType = expr[| n];
    if (opType == "MINUS") {
        var v1 = expr[| n-1];
        var v2 = expr[| n+1];
        
        if (is_string(v1)) {
            log_warn("Execution failure#Cannot do '-' on string: " + v1);
            global.executor_failure = true;
            return NULL
        }
        if (is_string(v2)) {
            log_warn("Execution failure#Cannot do '-' on string: " + v2);
            global.executor_failure = true;
            return NULL
        }
        
        var val = v1-v2;
        ds_list_delete(expr, n+1);
        ds_list_delete(expr, n);
        ds_list_delete(expr, n-1);
        ds_list_insert(expr, n-1, val);
        size -= 2;
    } else {
        n += 2;
    }
}

// Combine PLUS
n = 1;
while (n < size) {
    var opType = expr[| n];
    if (opType == "PLUS") {
        var v1 = expr[| n-1];
        var v2 = expr[| n+1];
        
        var val = v1+v2;
        ds_list_delete(expr, n+1);
        ds_list_delete(expr, n);
        ds_list_delete(expr, n-1);
        ds_list_insert(expr, n-1, val);
        size -= 2;
    } else {
        n += 2;
    }
}

var ret = expr[| 0];
ds_list_destroy(expr);
return ret;
#define executor_doBoolExpr
/// executor_doBoolExpr(boolexpr, state)

var boolexpr = argument0;
var state = argument1;

// Start out by computing first value always
var valFirstTree = boolexpr[| 0];
var valFirst = executor_inner(valFirstTree, state);
boolexpr[| 0] = valFirst;

// Compute values one by one, left to right. Ignore fields that dont need to be processed (lazy boolean computation)
while (ds_list_size(boolexpr) > 1) {
    var boolOp = boolexpr[| 1];
    var valFirst = boolexpr[| 0];
    
    if (boolOp == "AND" or boolOp == "ANDAMP") {
        if (valFirst == false) {
            // false AND anything = false
            ds_list_delete(boolexpr, 2);
            ds_list_delete(boolexpr, 1);
        } else {
            var valNextTree = boolexpr[| 2];
            var valNext = executor_inner(valNextTree, state);
            var res = valFirst and valNext;
            ds_list_delete(boolexpr, 2);
            ds_list_delete(boolexpr, 1);
            ds_list_delete(boolexpr, 0);
            ds_list_insert(boolexpr, 0, res);
        }
    }
    else if (boolOp == "OR" or boolOp == "ORPIPE") {
        if (valFirst == true) {
            // true OR anything = true
            ds_list_delete(boolexpr, 2);
            ds_list_delete(boolexpr, 1);
        } else {
            var valNextTree = boolexpr[| 2];
            var valNext = executor_inner(valNextTree, state);
            var res = valFirst or valNext;
            ds_list_delete(boolexpr, 2);
            ds_list_delete(boolexpr, 1);
            ds_list_delete(boolexpr, 0);
            ds_list_insert(boolexpr, 0, res);
        }
    }
    else {
        log_warn("Execution failure#Not a boolean operator: " + boolOp);
        global.executor_failure = true;
        return NULL
    }
}

var ret = boolexpr[| 0];
ds_list_destroy(boolexpr);
return ret;
#define executor_stopExec
return global.executor_failure or global.executor_stop;
#define executor_variable_get
/// executor_variable_get(word)
var word = argument0;


// Check if built-in variable
if (word == "x") { return x };
if (word == "y") { return y };
if (word == "z") { return z };
if (word == "id") { return id };


// Otherwise fail
log_warn("Execution failure#Undefined variable: " + word);
global.executor_failure = true;
return NULL;
#define executor_variable_set
/// executor_variable_set(word, value)
var word = argument0;
var val = argument1;


if (word == "x") {x = val; return true}
if (word == "y") {y = val; return true}
if (word == "z") {z = val; return true}

return false;
#define grammar_read
/// grammar_read(filename)

var filename = argument0;
var path = working_directory + "\" + filename;

log_debug("Reading grammar from file: " + path);

var tokens = ds_map_create();
var syntax = ds_map_create();

var grammar = ds_map_create();
ds_map_add_map(grammar, "tokens", tokens);
ds_map_add_map(grammar, "syntax", syntax);
ds_map_add_map(grammar, "constants", ds_map_create());

// Read each line of file
var file = file_text_open_read(path);
while (!file_text_eof(file)) {
    var line = file_text_read_string(file);
    file_text_readln(file);
    var parsed = grammar_read_line(line);
    if (parsed != NULL) {
        var first = parsed[| 0];
        
        if (first == "token") {
            // Definition is a token
            var key = parsed[| 1];
            var value = parsed[| 2];
            ds_map_add(tokens, key, value);
            ds_list_destroy(parsed);
            
        } else if (first == "syntax") {
            // Definition is a syntax definition
            var key = parsed[| 1];
            ds_list_delete(parsed, 1);
            ds_list_delete(parsed, 0);
            ds_map_add_list(syntax, key, parsed);
        
        } else if (first == "grammar") {
            // Definition is the grammar entry point
            var entrypoint = parsed[| 1];
            ds_map_add(grammar, "grammar", entrypoint);
            ds_list_destroy(parsed);
        }
    }
}
file_text_close(file);

log_debug("Grammar parsed");
//log_debug(json_encode(grammar));

assert(ds_map_exists(grammar, "grammar"), "No grammar entry point specified.");

return grammar;

#define grammar_read_line
/// grammar_read_line(line)
/// Reads a line and returns a list [ defname, args... ] or NULL

var line = argument0;
line = string_trim(line);

// Ignore empty lines
if (string_length(line) == 0) {
    return NULL;
}

// Ignore comments
if (string_copy(line, 1, 2) == "//") {
    return NULL;
}

// Read tokens
var tokens = grammar_tokenize(line);
var tokens_len = ds_list_size(tokens);

var first = tokens[| 0];
var last = tokens[| tokens_len-1];

// Ensure this is a valid definition (otherwise error and exit)
assert(last == ";", "Invalid grammar: Line must end with ';' : " + line);
assert(string_is_alphanumeric(first), "Invalid grammar: Invalid definition name: " + first);

if (first == "grammar") {
    // Just ignore for now. But check syntax!
    assert(tokens_len == 3, "Invalid grammar: Invalid definition: " + line);
    var ret = ds_list_create();
    ret[| 0] = "grammar";
    ret[| 1] = tokens[| 1];
    ds_list_destroy(tokens);
    return ret;
    
} else if (first == "token") {
    // Read this token
    assert(tokens_len == 4 and
           string_is_alphanumeric(tokens[| 1]) and
           string_startswithchar(tokens[| 2], "'") and
           string_endswithchar(tokens[| 2], "'"),
           "Invalid grammar: Invalid definition: " + line);
    var token_str = tokens[| 2];
    token_str = string_copy(token_str, 2, string_length(token_str) - 2); // Cut off heading and trailing quotation marks
    var ret = ds_list_create();
    ret[| 0] = "token";
    ret[| 1] = tokens[| 1];
    ret[| 2] = token_str;
    ds_list_destroy(tokens);
    return ret;
    
} else {
    // Read this syntax definition
    assert(tokens[| 1] == ":", "Invalid grammar: Invalid definition, second token must be ':' : " + line);
    assert(tokens[| 2] != "|", "Invalid grammar: Invalid definition, second token must be ':' : " + line);
    assert(tokens_len >= 4, "Invalid grammar: Invalid definition: " + line);
    var ret = ds_list_create();
    ret[| 0] = "syntax";
    ret[| 1] = first;
    
    var currentSyntax = ds_list_create();
    var n = 2;
    
    for (var i = 2; i < tokens_len-1; i++) {
        var token = tokens[| i];
        var next = tokens[| i+1];
        assert(token != ';', "Invalid grammar: Unexpected ';' in line: " + line);
        
        if (token == '|') {
            // Syntax divider
            assert(next != '|', "Invalid grammar: Unexpected '|' in line: " + line);
            ret[| n] = currentSyntax;
            ds_list_mark_as_list(ret, n);
            currentSyntax = ds_list_create();
            n++;
        } else {
            ds_list_add(currentSyntax, token);
        }
    }
    
    ret[| n] = currentSyntax;
    ds_list_mark_as_list(ret, n);
    ds_list_destroy(tokens);
    return ret;
}

#define grammar_tokenize
/// grammar_tokenize(string)
/// Tokenizes string. Returns list of tokens.

var str = argument0;
var tokens = ds_list_create();

var strlen = string_length(str);
var pos = 1;
var token = "";
var parsingString = false;

var c, cnext;
while (pos <= strlen) {
    c = string_char_at(str, pos);
    if (pos < strlen) {
        cnext = string_char_at(str, pos+1);
    } else {
        cnext = '';
    }
    
    if (parsingString) {
        if (c == "'") {
            parsingString = false;
            token += c;    
        } else {
            assert (pos < strlen, "Unexpected end of line: " + str);
            token += c;
            if (c == '\' and cnext == "'") {
                // Do not terminate string parsing at escaped single quote
                token += cnext;
                pos++;
            }
        }
        
    } else {
    
        if (char_is_whitespace(c)) {
            if (token != "") {
                grammar_add_token(tokens, token);
            }
            token = "";
        } else {
            token += c;
            if (pos == strlen) {
                grammar_add_token(tokens, token);
            } else if (c == "'") {
                parsingString = true;
            }
        }
    }
    pos++;
}

return tokens;



#define grammar_add_token
/// grammar_add_token(tokens, token)

var tokens = argument0;
var token = argument1;

// Add the token
// Check if token ends with ; (then ; is a separate token)
if (string_endswithchar(token, ';') and string_length(token) > 1) {
    ds_list_add(tokens, string_copy(token, 1, string_length(token) - 1));
    ds_list_add(tokens, ";");
}
else {
    ds_list_add(tokens, token);
}
#define grammar_addConstants
/// grammar_addConstants(grammar, constantsFilename)

var grammar = argument0;
var filename = argument1;
var path = working_directory + "\" + filename;

var constants = grammar[? "constants"];

var f = file_text_open_read(path);
while (!file_text_eof(f)) {
    var line = file_text_read_string(f);
    file_text_readln(f);
    
    var pos = string_pos(";", line);
    if (pos != 0) {
        var constantName = string_copy(line, 1, pos-1);
        var constantValue = string_copy(line, pos+1, string_length(line) - pos);
        constants[? constantName] = constantValue;
    }
}
file_text_close(f);
#define lexer
/// lexer(grammar, filename)
/// Returns lexed tokens, or NULL

var grammar = argument0;
var path = argument1;

//log_debug("Lexing from file: " + path);

if (!file_exists(path)) {
    return NULL;
}

// Read script file
var script = "";
var file = file_text_open_read(path);
var lineAt = 1;
var tokens = ds_list_create();
var constants = grammar[? "constants"];

var failure = false;

while (!file_text_eof(file) and !failure) {
    var line = file_text_read_string(file);
    file_text_readln(file);
    line = string_trim(lexer_stripComments(line));
    
    // Tokenize line
    while (!failure and string_length(line) > 0) {
        var res = lexer_findToken(grammar, line);
        if (res == NULL) {
            b2script_failure("Lexer", lineAt, "Unexpected character: '" + string_copy(line, 0, 1) + "'");
            failure = true;
        } else {
            var token = res[| 0];
            token[| 2] = lineAt;
            line = string_trim_left(res[| 1]);
            //ds_list_destroy(res);
            
            if (ds_map_exists(constants, token[| 1])) {
                // Replace constant with its value and keep parsing
                line = constants[? token[| 1]] + line;
            } else {
                // Add token to list of tokens
                ds_list_add_list(tokens, token);
            }
        }
    }
    lineAt++;
}
file_text_close(file);


if (failure) {
    ds_list_destroy(tokens);
    return NULL;
} else {
    // Return lexed tokens
    //log_debug("Lexer result: " + json_encode_list(tokens));
    return tokens;
}


#define lexer_findToken
/// lexer_findToken(grammar, line)
/// Returns [[tokentype, token], newstring] or NULL

var grammar = argument0;
var line = argument1;

// First check if Token
var tokens = grammar[? "tokens"];

var key = ds_map_find_first(tokens);
var longest = "";
var longestKey;
for (var i = 0; i < ds_map_size(tokens); i++) {
    var value = tokens[? key];
    if (string_startswith(line, value)) {
        // Match longest token possible
        if (string_length(value) > string_length(longest)) {
            longest = value;
            longestKey = key;
        }
    }

    key = ds_map_find_next(tokens, key);
}

if (longest != "") {
    var res = ds_list_create();
    var resInner = ds_list_create();
    ds_list_add(resInner, longestKey, longest);
    ds_list_add_list(res, resInner);
    ds_list_add(res, string_copy(line, string_length(longest)+1, string_length(line) - string_length(longest)));
    return res;
}

var c = string_char_at(line, 1);

// Check if String
if (string_startswithchar(line, '"')) {
    var word = c;
    var p = 2;
    var iterate = true;
    while (iterate and p <= string_length(line)) {
        c = string_char_at(line, p);
        word += c;
        p++;
        
        if (c == '"') {
            iterate = false;
        }
    }
    
    var res = ds_list_create();
    var resInner = ds_list_create();
    ds_list_add(resInner, "STRING", word);
    ds_list_add_list(res, resInner);
    ds_list_add(res, string_copy(line, string_length(word)+1, string_length(line) - string_length(word)));
    return res;
}

if (string_startswithchar(line, "'")) {
    var word = c;
    var p = 2;
    var iterate = true;
    while (iterate and p <= string_length(line)) {
        c = string_char_at(line, p);
        word += c;
        p++;
        
        if (c == "'") {
            iterate = false;
        }
    }
    
    var res = ds_list_create();
    var resInner = ds_list_create();
    ds_list_add(resInner, "STRING", word);
    ds_list_add_list(res, resInner);
    ds_list_add(res, string_copy(line, string_length(word)+1, string_length(line) - string_length(word)));
    return res;
}

// Check if Digits
if (char_is_numeric(c)) {
    var word = c;
    var p = 2;
    while (p <= string_length(line) and char_is_numeric(string_char_at(line, p))) {
        word += string_char_at(line, p);
        p++;
    }
    
    if (string_char_at(line, p) == '.' and char_is_numeric(string_char_at(line, p+1))) {
        // Float
        word += '.';
        p++;
        while (p <= string_length(line) and char_is_numeric(string_char_at(line, p))) {
            word += string_char_at(line, p);
            p++;
        }
        
        var res = ds_list_create();
        var resInner = ds_list_create();
        ds_list_add(resInner, "FLOAT", word);
        ds_list_add_list(res, resInner);
        ds_list_add(res, string_copy(line, string_length(word)+1, string_length(line) - string_length(word)));
        return res;
        
    } else {
        // Int
        var res = ds_list_create();
        var resInner = ds_list_create();
        ds_list_add(resInner, "INT", word);
        ds_list_add_list(res, resInner);
        ds_list_add(res, string_copy(line, string_length(word)+1, string_length(line) - string_length(word)));
        return res;
    }
}

// Check if Word
else if (char_is_alphabetical(c)) {
    var word = c;
    var p = 2;
    while (p <= string_length(line) and char_is_alphanumeric(string_char_at(line, p))) {
        word += string_char_at(line, p);
        p++;
    }
    
    var res = ds_list_create();
    var resInner = ds_list_create();
    ds_list_add(resInner, "WORD", word);
    ds_list_add_list(res, resInner);
    ds_list_add(res, string_copy(line, string_length(word)+1, string_length(line) - string_length(word)));
    return res;
}

// Error
return NULL;

#define lexer_stripComments
/// lexer_stripComments(line)

var line = argument0;

// TODO: Handle /* these comments */

if (string_pos("//", line) == 0) {
    return line;
} else {
    var p = string_pos("//", line);
    return string_copy(line, 1, p-1);
}
#define parser
/// parser(grammar, tokens)
/// Returns parsed syntax, or NULL

var grammar = argument0;
var tokens = argument1;

if (tokens == NULL or ds_list_size(tokens) == 0) {
    // If no tokens, return empty parse tree
    return ds_list_create();
}

var pos = 0;
global.parser_maxpos = 0;
var syntax = grammar[? "grammar"];

//log_debug("Parsing syntax");

var res = parser_parse_syntax(grammar, tokens, syntax, pos);

if (res != NULL) {
    var parseTree = res[| 0];
    var endPos = res[| 1];
    if (endPos == ds_list_size(tokens)) {
        //log_debug("Parsed syntax");
        //log_debug(json_encode_list(parseTree));
        return parseTree;
    } else if (endPos < ds_list_size(tokens)) {
        var t = tokens[| global.parser_maxpos];
        var lineAt = t[| 2];
        t = t[| 1];
        if (!is_string(t)) {
            t = string(t);
        }
        log_warn("Unexpected token: " + t + " at line: " + string(lineAt));
        return NULL;
    }
} else {
    log_debug("Failed to parse syntax");
    return NULL;
}


#define parser_parse_syntax
/// parser_parse_syntax(grammar, lexer_tokens, syntax_to_parse, pos)
/// Returns [parsed tree, new pos], or NULL if parsing this syntax at this position failed

var grammar = argument0;
var lexerTokens = argument1;
var syntax = argument2;
var pos = argument3;

if (pos >= ds_list_size(lexerTokens)) {
    return NULL;
}

global.parser_maxpos = max(pos, global.parser_maxpos);

//log_debug("PARSING " + syntax + " AT POS " + string(pos) + ": " + json_encode_list(lexerTokens[| pos]));

if (parser_syntax_is_token(grammar, syntax)) {
    var token = lexerTokens[| pos];
    var tokenType = token[| 0];
    if (tokenType == syntax) {
        var ret = ds_list_create();
        var retInner = ds_list_create();
        ds_list_copy(retInner, token);
        ds_list_add_list(ret, retInner);
        ds_list_add(ret, pos + 1);
        return ret;
    } else {
        return NULL;
    }
} else {

    // Get the syntax
    var allSyntaxDefs = grammar[? "syntax"];
    var syntaxDefs = allSyntaxDefs[? syntax];
    
    var parseSuccess = false;
    var parsedSyntaxTree;
    var posParse;
    
    for (var i = 0; i < ds_list_size(syntaxDefs) and !parseSuccess; i++) {
        // Attempt to parse this syntax def
        var syntaxDef = syntaxDefs[| i];
        var parseFailure = false;
        
        parsedSyntaxTree = ds_list_create();
        parsedSyntaxTree[| 0] = syntax;
        
        posParse = pos;
        
        var optional = false;
        var optionalStartState;
        var optionalFailed;
        
        for (var j = 0; j < ds_list_size(syntaxDef) and !parseFailure; j++) {
            var syntaxParse = syntaxDef[| j];
            
            if (syntaxParse == '(') {
                // --- Begin optional block
                optional = true;
                optionalStartState = parsedSyntaxTree;
                parsedSyntaxTree = ds_list_create();
                optionalFailed = false;
            
            } else if (syntaxParse == ')') {
                // --- End optional block
                optional = false;
                if (optionalFailed) {
                    // Return to previous syntax tree
                    ds_list_destroy(parsedSyntaxTree);
                    parsedSyntaxTree = optionalStartState;
                } else {
                    // Copy optional parsed result back into original syntax tree
                    while(ds_list_size(parsedSyntaxTree) > 0) {
                        ds_list_add_list(optionalStartState, parsedSyntaxTree[| 0]);
                        ds_list_delete(parsedSyntaxTree, 0);
                    }
                    ds_list_destroy(parsedSyntaxTree);
                    parsedSyntaxTree = optionalStartState;
                }
            
            } else if (optional and optionalFailed) {
                // Skip
            
            } else if (syntaxParse == '[') {
            
                // --- Parse list of syntaxes
                if (ds_list_size(syntaxDef) >= j + 2 and syntaxDef[| j+2] == ']') {
                    // List has no separators
                    var listEntrySyntax = syntaxDef[| j+1];
                    var args = ds_list_create();
                    
                    var doNext = true;
                    while (doNext) {
                        var res = parser_parse_syntax(grammar, lexerTokens, listEntrySyntax, posParse);
                        if (res == NULL) {
                            doNext = false;
                        } else {
                            ds_list_add_list(args, res[| 0]);
                            posParse = res[| 1];
                        }
                    }
                    
                    ds_list_add_list(parsedSyntaxTree, args);
                    j += 2;
                    
                } else if (ds_list_size(syntaxDef) >= j + 3 and syntaxDef[| j+3] == ']') {
                    // List has separators
                    var listEntrySyntax = syntaxDef[| j+1];
                    var separatorSyntax = syntaxDef[| j+2];
                    var args = ds_list_create();
                    
                    var doNext = true;
                    while (doNext) {
                        var res = parser_parse_syntax(grammar, lexerTokens, listEntrySyntax, posParse);
                        if (res == NULL) {
                            doNext = false;
                        } else {
                            ds_list_add_list(args, res[| 0]);
                            posParse = res[| 1];
                            
                            // Attempt to parse separator
                            res = parser_parse_syntax(grammar, lexerTokens, separatorSyntax, posParse);
                            if (res == NULL) {
                                // No separator = no next item
                                doNext = false;
                            } else {
                                // Don't save separator syntax
                                posParse = res[| 1];
                            }
                        }
                    }
                    
                    ds_list_add_list(parsedSyntaxTree, args);
                    j += 3;
                    
                } else {
                    // Invalid grammar
                    log_warn("Invalid grammar: List syntax must have 1 or 2 entries, begin with [, end with ]");
                    return NULL;
                }
                
                
            } else {
                // --- Parse
                var res = parser_parse_syntax(grammar, lexerTokens, syntaxParse, posParse);
                if (res == NULL) {
                    parseFailure = true;
                } else {
                    ds_list_add_list(parsedSyntaxTree, res[| 0]);
                    posParse = res[| 1];
                }
            }
            
            if (parseFailure and optional) {
                // Convert to a failure of parsing the optional block
                parseFailure = false;
                optionalFailed = true;
            }
        }
        
        if (parseFailure) {
            ds_list_destroy(parsedSyntaxTree);
        } else {
            parseSuccess = true;
        }
    }
        
    if (parseSuccess) {
        //log_debug("Parsed: " + json_encode_list(parsedSyntaxTree));
        var ret = ds_list_create();
        ds_list_add_list(ret, parsedSyntaxTree);
        ds_list_add(ret, posParse);
        return ret;
    } else {
        //log_debug("Failed to parse " + syntax);
        return NULL;
    }
}


#define parser_syntax_is_token
/// parser_syntax_is_token(grammar, syntax)

var grammar = argument0;
var syntax = argument1;

if (syntax == "WORD") return true;
if (syntax == "INT") return true;
if (syntax == "FLOAT") return true;
if (syntax == "STRING") return true;

var tokens = grammar[? "tokens"];
if (ds_map_exists(tokens, syntax)) return true;

return false;