if (argument_count == 0)
{
    return global.pedestrianCirculation;
}
else
{
    if (string_lower(string(argument[0])) == "off")
        global.pedestrianCirculation = 0;
    else if (string_lower(string(argument[0])) == "on")
        global.pedestrianCirculation = 1;
    else
        global.pedestrianCirculation = real(argument[0]);
}
