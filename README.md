# DLsite-Info-Scraper


## Purpose of the program:
Store product infos from a keyword search to (.csv)

## How To Use This Program:
1. Get the base url by DLsite keyword search (showtype must be 1), with just the number of page left  

eg: https://www.dlsite.com/maniax/fsr/=/language/jp/sex_category%5B0%5D/male/keyword/陽向葵ゅか/order%5B0%5D/release_d/per_page/30/show_type/1/page/  

2. Look for total number of pages by yourself, so you don't go over that  

3. Now run all the code once  

4. Then, type: "get_info('paste_the_base_url_here', and_#pages_here)"  

5. A CSV file will be generated  

PS: One issue of my code is it could not handle UNICODE properly. Let me know if you have any ideas.

