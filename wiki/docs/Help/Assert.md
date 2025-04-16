You'll see assert calls dotted around, often doing this such as `local screen = assert(GetPart("Screen"), "no screen connected")`.

This may be confusing to people who have never seen assert before, but all it is doing, is taking the first parameter, checking if it is `false` or `nil`, and if it *is*, throwing the text in the second parameter as an error, but if it *isn't*, it returns the first parameter.

For example, doing something like:

This same logic applies to the return value of `GetPart(s)(FromPort)`, allowing us to easily throw useful errors if no object is connected, which helps prevents the whole class of "attempt to index nil with ..." relating to objects being disconnected.


```lua
local value = assert(32, "value is nil!") -- this will run fine
print(value) -- '32'
```

```lua
-- error-line
local value = assert(nil, "value is nil!") -- this will run fine
print(value) -- this will not run
```

This same logic applies to the return value of `GetPart(s)(FromPort)`, allowing us to easily throw useful errors if no object is connected, which helps prevents the whole class of "attempt to index nil with ..." relating to objects being disconnected.
