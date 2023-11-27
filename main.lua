local lua_io = require "lua_io"

local console = lua_io.io:new(io.stdin, io.stdout)

console:print("hello world")

local x = console:input("type number:")
console:print("number is", x)

local file_in   = io.open("in", "r")
local file_out  = io.open("out", "w")
local file = lua_io.io:new(file_in, file_out)

file:print("hello lua")

local y = file:input("type string:")
file:print("string is", y)

file_in:close()
file_out:close()