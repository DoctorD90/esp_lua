function ls()
	l = file.list();
	for k,v in pairs(l) do
		print("Name:"..k..", Size:"..v.." Bytes")
	end
end

function cat(f)
	file.open(f)
	print(file.read(EOF))
	file.close()
end

function mv(old, new)
	r=file.rename(old, new)
	if r=="true" then
		print("OK")
	else
		print("FAILED")
	end
end

function rm(f)
	file.remove(f)
	print("OK")
end
