# DLsite-Tools


## DLsite_Info_Scraper
Purpose of the program:  
Store product infos (category/release date/maker/title/url) from a keyword search to (.csv)

How To Use This Program:  
1. Get the base url from DLsite keyword search (`show_type` must be 1), with just the number of page left  

eg: https://www.dlsite.com/maniax/circle/profile/=/language/jp/sex_category%5B0%5D/male/keyword_maker_name/RG17643/order%5B0%5D/release_d/per_page/30/show_type/1/hd/1/page/

2. Look for total number of pages by yourself, so you don't go over that  

3. Now run all the code once  

4. Then, in the command line type: "get_info('paste_the_base_url_here', and_#pages_here)"  

5. A CSV file will be generated  

PS: One issue of my code is it could not handle UNICODE properly. Let me know if you have any ideas.


## DLsite_match

Purpose of this function:  
Assume you downloaded some games/manga of a certain series from DLsite and all files are properly named.  
eg: `[Date][RJXXXXXX][maker] title`  
By using DLsite_Info_Scraper.R to get all product info of that series, you can now find out what games/manga you've missed from the list.  
You MUST use the csv generated from `DLsite_Info_Scraper.R` to run this program!!!
