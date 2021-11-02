#data wrangling

#load libraries
library(tidyverse)
library(readxl)

#create state to inner join with
state_info <- data.frame(State = state.name,
                         State_abb = state.abb) %>% 
  add_row(State="District of Columbia", State_abb="DC")


#read 2019 data
State_Migration_2019_clean <- read_excel("data/State_to_State_Migrations_Table_2019.xls", 
                                                   sheet = "Table", range = "A12:DQ78", 
                                                   col_names = FALSE)   %>% select(State='...1',
                                                                              Alabama='...13',
                                                                              Arizona='...15',
                                                                              Arkansas= '...17',
                                                                              California='...19',
                                                                              Colorado='...21',
                                                                              Connecticut	='...24',
                                                                              Delaware	='...26',
                                                                              `District of Columbia` 	='...28',
                                                                              Florida	='...30',
                                                                              Georgia	='...32',
                                                                              Hawaii	='...35',
                                                                              Idaho	='...37',
                                                                              Illinois	='...39',
                                                                              Indiana	='...41',
                                                                              Iowa	='...43',
                                                                              Kansas	='...46',
                                                                              Kentucky	='...48',
                                                                              Louisiana	='...50',
                                                                              Maine	='...52',
                                                                              Maryland	='...54',
                                                                              Massachusetts	='...57',
                                                                              Michigan	='...59',
                                                                              Minnesota	='...61',
                                                                              Mississippi	='...63',
                                                                              Missouri	='...65',
                                                                              Montana	='...68',
                                                                              Nebraska	='...70',
                                                                              Nevada	='...72',
                                                                              `New Hampshire`='...74',	
                                                                              `New Jersey`	='...76',
                                                                              `New Mexico`	='...79',
                                                                              `New York`	='...81',
                                                                              `North Carolina`	='...83',
                                                                              `North Dakota`	='...85',
                                                                              Ohio	='...87',
                                                                              Oklahoma	='...90',
                                                                              Oregon	='...92',
                                                                              Pennsylvania	='...94',
                                                                              `Rhode Island`	='...96',
                                                                              `South Carolina`	='...98',
                                                                              `South Dakota`	='...101',
                                                                              Tennessee	='...103',
                                                                              Texas	='...105',
                                                                              Utah	='...107',
                                                                              Vermont	='...109',
                                                                              Virginia	='...112',
                                                                              Washington	='...114',
                                                                              `West Virginia`	='...116',
                                                                              Wisconsin	='...118',
                                                                              Wyoming	='...120') %>% 
                    inner_join(state_info) %>%  #use just states and rid NA
                  pivot_longer(cols = -State,
                      names_to = "StateBefore",
                        values_to = "Migration" ) %>% 
                      filter(State != StateBefore) #remove internal migration

# get presidental data
X1976_2020_president <- read_delim("data/1976-2020-president.tab", 
                                   delim = "\t", escape_double = FALSE, 
                                   trim_ws = TRUE) %>% 
                              filter(party_simplified=="DEMOCRAT" | party_simplified=="REPUBLICAN")

