source("code/Initial Analysis.R")

charSub <- line %>%
  left_join(select(charity, charityID, provinceID, designationID), by = "charityID") %>%
  left_join(select(form, formBox, formStar, formDesc), by = "formBox") %>%
  filter(is.na(lineValue)==F, formStar == "Y")