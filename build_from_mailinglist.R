mailinglist_usluo  <- read.csv(file = "./data/mailinglist_usluo.txt",
                              header = T, colClasses = rep("character", 10))
mailinglist_usluec <- read.csv(file = "./data/mailinglist_usluec.txt",
                              header = T, colClasses = rep("character", 10))
registration_list <- read.csv(file = "./data//2015_04_23_usluo_registration_data.csv",
                              header = T, colClasses = rep("character", 10))

list_of_collaborations <- c("CMS", "ATLAS", "LHCb", "ALICE", "LARP", "Theorist")
cat(rep('#',80), sep="")
cat("\n")
cat("FullName", ", ", "Email", ", ",  "Institute", ", ",  "Collaboration", fill = T)
cat("\n")
for(i in 1:nrow(mailinglist_usluo)){
#for(i in 1:20){
  row = mailinglist_usluo[i,]
  #print(registration_list[ tolower(registration_list$Email) == tolower(row$Email) , 1:5], row.names=F, col.names = F, collab="")
  fullName  <- registration_list[ tolower(registration_list$Email) == tolower(row$Email) , 1 ]
  email     <- tolower(registration_list[ tolower(registration_list$Email) == tolower(row$Email) , 2 ])
  institute <- registration_list[ tolower(registration_list$Email) == tolower(row$Email) , 3 ]
  collab    <- registration_list[ tolower(registration_list$Email) == tolower(row$Email) , 4 ]
  if ( length(collab)==0 || ! collab %in% list_of_collaborations){
    collab = "---"
  }
  if(length(fullName) > 0){
  cat(fullName[1], ", ", email[1], ", ", institute[1], ", ", collab[1], "\n", fill = F)
  }
#   if(length(fullName)==0){
#     print(row$Email)
#     print(row$fullName)
#   }
}
