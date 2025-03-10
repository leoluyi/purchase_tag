remove_unit <- function(x) {
  if(!is.character(x)) stop("x must be character vector")

  ## to_halfwidth
  x <- to_halfwidth(x)

  x <- gsub("^\\s+|\\s+$", "", x) # trim
  x <- gsub("[(]?[0-9]+(\\.[0-9 ])*\\s*(l|ml|g|kg|XL|cc|w|公斤|公克|公升|入|包|個)[\\s)]?(\\s*/\\s*[罐瓶組包粒盒])?$", "",
            x, ignore.case = TRUE) # 123 ml
  x <- gsub("[(][大中小粗細][)]|(x*l|m)$", "", x, ignore.case = TRUE)
  x <- gsub("[0-9]+\\s*(l|L|ml|ML|g|G|cc|公斤|公克|公升|入|包|個).*", "", x)
  x <- gsub("[#*]\\d+$", "", x, ignore.case = TRUE)

  x <- gsub("^\\s+|\\s+$", "", x) # trim

  x
}


# remove_unit(c("康寶獨享杯(10ml)", "Biore 淨嫩沐浴乳抗菌光澤型 1000ml"))
# remove_unit(to_halfwidth("百齡罈8年調和式麥芽蘇格蘭威士忌"))
# remove_unit("Biore 淨嫩沐浴乳抗菌光澤型 1000ml")
# remove_unit("Biore含水防曬保濕水凝霜33g/瓶")
# remove_unit("BLUE GIRL藍妹啤酒 330ml/罐")
# remove_unit("奶油餐包")
# remove_unit(c("皇力牌雨衣3XL", "賓漢格紋平口XL", "sdfsf#112"))
# remove_unit("美祿1.5kg")
