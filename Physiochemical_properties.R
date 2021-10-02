
library(dplyr)
library(purrr)
library(rio)
library(openxlsx)
Physicochemical_properties <- function(x){
  aacom <- Peptides::aaComp(x)
  aacom
  c <- data.frame(aacom)
  y <- c %>% select(Number)
  Tiny_Number<- y[1,]
  Tiny_Number
  Small_Number <- y[2,]
  Small_Number
  Aliphatic_Number <- y[3,]
  Aliphatic_Number
  Aromatic_Number <- y[4,]
  Aromatic_Number
  NonPolar_Number <- y[5,]
  NonPolar_Number
  Polar_Number <- y[6,]
  Polar_Number
  Charged_Number <- y[7,]
  Charged_Number
  Basic_Number <- y[8,]
  Basic_Number
  Acidic_Number <- y[9,]
  Acidic_Number
  df <- data.frame(Tiny_Number,Small_Number,Aliphatic_Number,Aromatic_Number,NonPolar_Number,Polar_Number,Charged_Number,Basic_Number,Acidic_Number)
  df
  z <- c %>% select(Mole.)
  Tiny_Mole <- z[1,]
  Tiny_Mole
  Small_Mole <- z[2,]
  Small_Mole
  Aliphatic_Mole <- z[3,]
  Aliphatic_Mole
  Aromatic_Mole <- z[4,]
  Aromatic_Mole
  NonPolar_Mole <- z[5,]
  NonPolar_Mole
  Polar_Mole <- z[6,]
  Polar_Mole
  Charged_Mole <- z[7,]
  Charged_Mole
  Basic_Mole <- z[8,]
  Basic_Mole
  Acidic_Mole <- z[9,]
  Acidic_Mole
  df2 <- data.frame(Tiny_Mole,Small_Mole,Aliphatic_Mole,Aromatic_Mole,NonPolar_Mole,Polar_Mole,Charged_Mole,Basic_Mole,Acidic_Mole)
  df2
  mw <- Peptides::mw(x)
  L <- Peptides::lengthpep(x)
  nC <- Peptides::charge(x)
  iep <- Peptides::pI(x)
  aip <- Peptides::aIndex(x)
  InsI <- Peptides::instaIndex(x)
  bI <- Peptides::boman(x)
  hp <- Peptides::hydrophobicity(x)
  hpm <- Peptides::hmoment(x)
  
  
  df3 <- data.frame(  "Molecularweight" = mw, "LengthofPeptide" = L, "NetChargeofProtein" = nC, "isoelectricpoint" = iep,
                      "aliphaticindexofprotein" = aip, "instabilityindex" = InsI, "bomanIndex"= bI, "hydrophobicity" = hp, "hydriphobicmoment" = hpm)
  Peptide_sequences <- x
  C <- cbind(Peptide_sequences,df,df2,df3)
  return(C)
}
a <- map_df(c(x),Physicochemical_properties) 
a

export(a, "physicochemical_properties.xlsx")


