###########################################################################
#Purpose of this function:

#Assume you downloaded some games/manga of a certain series from DLsite
#and all files are properly named. eg: "[Date][RJXXXXXX][maker] title"
#By using DLsite_Info_Scraper.R to get all product info of that series,
#you can now find out what games/manga you've missed from the list.
#The program will return a list of product IDs in a csv file.
#You MUST use the csv generated from "DLsite_Info_Scraper.R"
#to run this program!!!
##########################################################################

get_missed = function(csv, filepath){
  
  full_list = read.csv(csv, header=T) #Get the full list of product info
  file = list.files(filepath) #Get the file list under a folder
  
  #Get only the product IDs (eg: RJXXXXXX)
  file = gsub("(?:.*)\\[(?:[^\\]]+)\\]\\[([^\\]]+)\\]\\[(?:[^\\]]+)\\](?:.*)", "\\1", file, perl=T)
  
  #compare and store
  missed = setdiff(full_list[,2], file)
  write.csv(missed, file="missed.csv", row.names=F)
}
