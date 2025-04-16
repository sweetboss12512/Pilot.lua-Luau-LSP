The events section of the pages shows the information in the format of `EventName(parameterA, parameterB)`, to connect to an event like this you would do:

```lua
object.EventName:Connect(function(parameterA, parameterB)
	print("Event fired!")
end)
```

Events also return 'connections', these can be used to disconnect the event (i.e., stop it from running in future).

```lua
local connection = object.EventName:Connect(function(parameterA, parameterB)
	print("Event fired!")
end)

task.wait(5) -- Wait 5 seconds before disconnecting the event.

connection:Disconnect() -- You can alternatively use `connection:Unbind()`
```
