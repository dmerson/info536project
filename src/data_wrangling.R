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
                        values_to = "Migration" ) %>% #turn into tidy data from wider data
                      filter(State != StateBefore) %>% #remove internal migration
                      mutate(NextElection=2020, Year=2019, PreviousElection=2016, State=toupper(State), StateBefore=toupper(StateBefore))



#read 2018 migration data
State_Migration_2018_clean <- read_excel("data/State_to_State_Migrations_Table_2018.xls", 
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
               values_to = "Migration" ) %>% #turn into tidy data from wider data
  filter(State != StateBefore) %>% #remove internal migration
  mutate(NextElection=2020, Year=2018, PreviousElection=2016, State=toupper(State), StateBefore=toupper(StateBefore) )

#read 2017 migration data
State_Migration_2017_clean <- read_excel("data/State_to_State_Migrations_Table_2017.xls", 
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
               values_to = "Migration" ) %>% #turn into tidy data from wider data
  filter(State != StateBefore) %>% #remove internal migration
  mutate(NextElection=2020, Year=2017, PreviousElection=2016, State=toupper(State), StateBefore=toupper(StateBefore))


# get presidental data
X1976_2020_president <- read_delim("data/1976-2020-president.tab", delim = "\t", escape_double = FALSE, trim_ws = TRUE) %>% 
  filter(party_simplified =="DEMOCRAT" | party_simplified =="REPUBLICAN") %>% 
  pivot_wider( 
    names_from = party_simplified,
    values_from = candidatevotes, values_fill=0, names_repair = unique ) %>% 
  select(year, State=state,DEMOCRAT, REPUBLICAN)
#get democrat and republican list
democrat_list <- X1976_2020_president %>% 
  filter(REPUBLICAN==0)
republican_list <-  X1976_2020_president %>% 
  filter(DEMOCRAT==0)
#set state to upper case to prepare for join
state_info <- state_info %>% 
  mutate(State=toupper(State))

#join data to get 1 row for each state, year with winner
presidential_list <- state_info %>% 
  inner_join(democrat_list ) %>% 
  select(State,year, DEMOCRAT) %>% 
  inner_join(republican_list,  by=c("State", "year")) %>% 
  select(State, year, DEMOCRAT =DEMOCRAT.x, REPUBLICAN) %>% 
  mutate(winner=case_when(DEMOCRAT > REPUBLICAN ~ "BLUE",
                          REPUBLICAN > DEMOCRAT ~ "RED")) %>% 
    filter(DEMOCRAT >100) #remove weird data quirk where arizona had 2 records in 2016

#get the colorized data for 2019
colorized_2019_data <-State_Migration_2019_clean %>% 
  inner_join(presidential_list, by=c("State"="State","NextElection"="year")) %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner=winner) %>% 
  inner_join(presidential_list, by=c("State"="State","PreviousElection"="year"))  %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner, previouswinner=winner)  %>% 
  inner_join(presidential_list, by=c("StateBefore"="State","PreviousElection"="year")) %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner, previouswinner, migrationcolor=winner)   
#summarized the colorized data for 2019
colorized_2019_summary_data <- colorized_2019_data %>% 
  select(State, Year, NextElection,previouswinner , migrationcolor, Migration) %>% 
  mutate(Migration=parse_number(Migration, na="N/A")) %>% 
  group_by(State, Year, NextElection, migrationcolor) %>% 
  summarize(migration_count=sum(Migration))  %>% 
  mutate(migration_count=case_when(is.na(migration_count) ~ 0,
                                   TRUE ~ migration_count)) %>% 
  pivot_wider(names_from = migrationcolor,values_from=migration_count) %>% 
  mutate(migration_winner=case_when((BLUE > RED) ~ "BLUE",
                                    (RED > BLUE) ~ "RED") )    %>% 
    mutate (migration_winner_amount=case_when(BLUE > RED ~ BLUE-RED,
                                            RED > BLUE ~ RED-BLUE)) %>% 
  group_by(State, Year, NextElection,migration_winner) %>% 
  summarise(Migration=migration_winner_amount)
  
#get the colorized data for 2018
colorized_2018_data <-State_Migration_2018_clean %>% 
  inner_join(presidential_list, by=c("State"="State","NextElection"="year")) %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner=winner) %>% 
  inner_join(presidential_list, by=c("State"="State","PreviousElection"="year"))  %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner, previouswinner=winner)  %>% 
  inner_join(presidential_list, by=c("StateBefore"="State","PreviousElection"="year")) %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner, previouswinner, migrationcolor=winner) 
#summarized the colorized data for 2018
colorized_2018_summary_data <- colorized_2018_data %>% 
  select(State, Year, NextElection,previouswinner , migrationcolor, Migration) %>% 
  mutate(Migration=parse_number(Migration, na="N/A")) %>% 
  group_by(State, Year, NextElection, migrationcolor) %>% 
  summarize(migration_count=sum(Migration))  %>% 
  mutate(migration_count=case_when(is.na(migration_count) ~ 0,
                                   TRUE ~ migration_count)) %>% 
  pivot_wider(names_from = migrationcolor,values_from=migration_count) %>% 
  mutate(migration_winner=case_when((BLUE > RED) ~ "BLUE",
                                    (RED > BLUE) ~ "RED") )    %>% 
  mutate (migration_winner_amount=case_when(BLUE > RED ~ BLUE-RED,
                                            RED > BLUE ~ RED-BLUE)) %>% 
  group_by(State, Year, NextElection,migration_winner) %>% 
  summarise(Migration=migration_winner_amount)

#get the colorized data for 2017
colorized_2017_data <-State_Migration_2017_clean %>% 
  inner_join(presidential_list, by=c("State"="State","NextElection"="year")) %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner=winner) %>% 
  inner_join(presidential_list, by=c("State"="State","PreviousElection"="year"))  %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner, previouswinner=winner)  %>% 
  inner_join(presidential_list, by=c("StateBefore"="State","PreviousElection"="year")) %>% 
  select(State, StateBefore, Migration, NextElection, Year, PreviousElection, nextWinner, previouswinner, migrationcolor=winner) 
#summarized the colorized data for 2017
colorized_2017_summary_data <- colorized_2017_data %>% 
  select(State, Year, NextElection,previouswinner , migrationcolor, Migration) %>% 
  mutate(Migration=parse_number(Migration, na="N/A")) %>% 
  group_by(State, Year, NextElection, migrationcolor) %>% 
  summarize(migration_count=sum(Migration))  %>% 
  mutate(migration_count=case_when(is.na(migration_count) ~ 0,
                                   TRUE ~ migration_count)) %>% 
  pivot_wider(names_from = migrationcolor,values_from=migration_count) %>% 
  mutate(migration_winner=case_when((BLUE > RED) ~ "BLUE",
                                    (RED > BLUE) ~ "RED") )    %>% 
  mutate (migration_winner_amount=case_when(BLUE > RED ~ BLUE-RED,
                                            RED > BLUE ~ RED-BLUE)) %>% 
  group_by(State, Year, NextElection,migration_winner) %>% 
  summarise(Migration=migration_winner_amount)
            