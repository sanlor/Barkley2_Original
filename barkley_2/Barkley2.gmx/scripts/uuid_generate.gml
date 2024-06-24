/// uuid_generate()

var str = ""
repeat(30) {
    var n = irandom(31);
    if (n  < 10) {
        str += chr(ord('0') + n);
    } else {
        str += chr(ord('a') + (n-10));
    }
}
return str;
