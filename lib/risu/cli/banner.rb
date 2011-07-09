#Cool random banner stuff for the cli, based on the metasploit random banner stuff

module Risu
	module CLI
		module Banner
			Banners =
				[
'
      _           
 _ __(_)___ _   _ 
| \'__| / __| | | |
| |  | \__ \ |_| |
|_|  |_|___/\__,_|
               

',
'
      _           
     (_)          
 _ __ _ ___ _   _ 
| \'__| / __| | | |
| |  | \__ \ |_| |
|_|  |_|___/\__,_|
                  

',
'
              _/                      
   _/  _/_/        _/_/_/  _/    _/   
  _/_/      _/  _/_/      _/    _/    
 _/        _/      _/_/  _/    _/     
_/        _/  _/_/_/      _/_/_/      


',
'
      o             
 ,_       ,         
/  |  |  / \_|   |  
   |_/|_/ \/  \_/|_/
                    

',
'
       _         
  ____(_)__ __ __
 / __/ (_-</ // /
/_/ /_/___/\_,_/ 
                 

'
				]

			def self.to_s
				Banners[rand(Banners.length)]
			end
		end
	end
end