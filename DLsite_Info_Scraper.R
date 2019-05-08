##########################################################################################################
#Purpose of the program:
#Store product infos from a keyword search to (.csv)
#
#How To Use This Program:
#1.Get the base url by DLsite keyword search (showtype must be 1), with just the number of page left
#eg: https://www.dlsite.com/maniax/circle/profile/=/language/jp/sex_category%5B0%5D/male/keyword_maker_name/RG17643/order%5B0%5D/release_d/per_page/30/show_type/1/hd/1/page/
#2.Look for total number of pages by yourself, so you don't go over that
#3.Now run all the code once
#4.Then, type: "get_info('paste_the_base_url_here', and_#pages_here)"
#5.A CSV file will be generated
#PS: One issue of my code is it could not handle UNICODE properly. Let me know if you have any ideas.
##########################################################################################################


library(rvest)
library(stringi)

get_info <- function(base_url, page){

  category = unlist(lapply(paste0(base_url, 1:page),
                        function(url){
                          url %>% read_html() %>% 
                            html_nodes(".work_category a") %>% 
                            html_text()
                        }))
  
  release_date = unlist(lapply(paste0(base_url, 1:page),
                        function(url){
                          url %>% read_html() %>% 
                            html_nodes(".sales_date") %>% 
                            html_text()
                        }))
  release_date = gsub("\\D", "", release_date)
  release_date = paste0(stri_sub(release_date, 3, 4),"/",stri_sub(release_date, 5, 6),"/",stri_sub(release_date, 7, 8))
  
  maker = unlist(lapply(paste0(base_url, 1:page),
                           function(url){
                             url %>% read_html() %>% 
                               html_nodes(".maker_name > a") %>% 
                               html_text()
                           }))
  
  links = unlist(lapply(paste0(base_url, 1:page),
                     function(url){
                       url %>% read_html() %>% 
                         html_nodes(".work_name a") %>% 
                         html_attr('href')
                     }))
  
  product_id = stri_sub(links, -13, -6)
  
  title = unlist(lapply(paste0(base_url, 1:page),
                     function(url){
                       url %>% read_html() %>% 
                         html_nodes(".work_name a") %>% 
                         html_text()
                     }))
  
  info = data.frame(cbind(category, product_id, release_date, maker, title, links))
  write.csv(info, file="info.csv", row.names=F)
  #info
}

