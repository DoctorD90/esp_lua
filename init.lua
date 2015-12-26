function reboot()
	node.restart();
end

dofile("sys.lua");
dofile("files.lua");
dofile("gpio.lua");
dofile("wlan.lua");

print("");
version();
print("");
du();
print("");
voltage();
print("");
