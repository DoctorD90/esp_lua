function iw()
	function listap(t)
		print("BSSID\t\t","RSSI","CHAN","AUTHMODE","ESSID");
		for essid,v in pairs(t) do
			authmode, rssi, bssid, channel = string.match(v, "([^,]+),([^,]+),([^,]+),([^,]+)");
			if authmode == "1" then
				auth = "OPEN          "
			elseif authmode == "2" then
				auth = "WPA_PSK       "
			elseif authmode == "3" then
				auth = "WPA2_PSK      "
			elseif authmode == "4" then
				auth = "WPA_WPA2_PSK  "
			else
				auth = "????          "
			end
			print(string.upper(bssid),rssi,channel,auth,essid);
		end
	end
	md1=wifi.getmode()
	if md1=="2" then
		wifi.setmode(wifi.STATION)
	end
	wifi.sta.getap(listap)
	if md1=="2" then
		wifi.setmode(wifi.STATIONAP)
	end
end
