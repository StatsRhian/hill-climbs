library("sf")
library("tidyverse")

filenames <- list.files("data/lancashire", full.names = TRUE)

climbs <- map_df(filenames, st_read, layer = "tracks")

climbs_clean <-
  climbs %>%
  as_tibble() %>%
  select(name, geometry) %>%
  mutate(name = str_replace(name, "ChaseTheLadder.com \\| ", "")) %>%
  mutate(name = str_replace(name, "Strava segment export", "")) %>%
  mutate(name = str_replace(name, "(OFFICIAL|Another) 100( Greatest )?Climbs\\.? No\\s?[:digit:]*", "")) %>%
  mutate(name = str_squish(name)) %>%
  mutate(name = str_to_sentence(name)) %>%
  mutate(col = "purple") %>%
  st_as_sf()

write_sf(climbs_clean, "data/lancashire_climbs.shp")
