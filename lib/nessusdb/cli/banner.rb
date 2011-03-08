# encoding: utf-8

#Cool random banner stuff for the cli, based on the metasploit random banner stuff

module NessusDB
	module CLI
		module Banner
			Banners =
				[
'
                                   _ _       
 _ __   ___  ___ ___ _   _ ___  __| | |__  
| \'_ \ / _ \/ __/ __| | | / __|/ _` | \'_ \ 
| | | |  __/\__ \__ \ |_| \__ \ (_| | |_) |
|_| |_|\___||___/___/\__,_|___/\__,_|_.__/ 

'				
				]

			def self.to_s
				Banners[rand(Banners.length)]
			end
		end
	end
end