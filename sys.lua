function round2(num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function version()
	majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
	print("NodeMCU","", "v"..majorVer.."."..minorVer.."."..devVer);
	print("ChipID","", chipid);
	print("FlashID","", flashid);
	print("FlashSize", flashsize);
	print("FlashMode", flashmode);
	print("FlashSpeed", flashspeed);
	print("HEAP in bytes", node.heap());
end

function du()
	remaining, used, total=file.fsinfo();
	print("Space","Byte","KByte","MByte");
	print("Total:", round2(total,0), round2(total/1024,2), round2(total/1024/1024,2));
	print("Used:", round2(used,0), round2(used/1024,2), round2(used/1024/1024,2));
	print("Left:", round2(remaining,0), round2(remaining/1024,2), round2(remaining/1024/1024,2));
end

function run(f)
	dofile(f);
end

function voltage()
	print(adc.readvdd33().."mV");
end
