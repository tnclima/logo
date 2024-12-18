# create hexsticker for tnclima repo

library(giscoR)
library(sf)
library(ggplot2)
library(dplyr)
library(hexSticker)



# get shape trentino ------------------------------------------------------

gisco_countries
gisco_nuts %>% 
  filter(CNTR_CODE == "IT")


sf_tn <- gisco_get_nuts(resolution = "01", nuts_id = "ITH2")

gg <- ggplot(sf_tn)+
  geom_sf()+
  theme_void()+
  # theme_transparent()+
  coord_sf()

sticker(gg, package = "tnclima", filename = "tnclima/sticker-01.png",
        p_size=20, s_x=1, s_y=.75, s_width=1.3, s_height=1,)

sticker(gg, package = "tnclima", filename = "tnclima/sticker-02.png",
        p_size=20, s_x=1, s_y=0.95, s_width=1.7, s_height=1.7,
        p_x = 0.85, p_y = 0.95, p_color = "grey30")

sticker(gg, package = "tnclima", filename = "tnclima/sticker-03.png",
        p_size=20, s_x=1, s_y=0.9, s_width=1.7, s_height=1.7,
        p_x = 1.38, p_y = 0.36, angle = 30)



gg2 <- ggplot(sf_tn)+
  geom_sf()+
  annotate("text", label = "tnclima", 
           x = 11.07, y = 46.12, size = 20, colour = "grey30", family = "Aller_Rg")+
  theme_void()+
  theme(plot.background = element_rect(fill = "#1881C2", linetype = "blank"))+
  coord_sf()

ggsave("tnclima/logo-01.png", gg2, width = 500, height = 500, units = "px")


st_bbox(sf_tn)
mean(st_bbox(sf_tn)[c(1,3)])

gg2 <-
ggplot(sf_tn)+
  geom_sf()+
  annotate("point", x = 11.2, y = 46.7, size = -Inf)+ 
  annotate("text", label = "tnclima", 
           x = 11.2, y = 46.65, size = 30, colour = "#FFFFFF", family = "Aller_Rg")+
  theme_void()+
  theme(plot.background = element_rect(fill = "#1881C2", linetype = "blank"))+
  coord_sf()

ggsave("tnclima/logo-02.png", gg2, width = 500, height = 500, units = "px")
