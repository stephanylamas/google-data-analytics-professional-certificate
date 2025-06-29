all_trips_v3 %>% 
     mutate(weekday = wday(started_at, label = TRUE)) %>% 
     group_by(member_casual, weekday) %>% 
     summarise(number_of_rides = n(),average_duration = mean(ride_length_min)) %>% 
     arrange(member_casual, weekday)  %>% 
     ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
     geom_col(position = "dodge") + labs(title = "Average Ride Duration Per Week Day", x = "Day of the Week", y = "Average Ride Duration (min)", fill = "Rider Type") +
     scale_fill_manual(values = c("casual" = "lightseagreen", "member" = "lemonchiffon"))+
     theme(panel.background = element_rect(fill = "gray", color = NA))