all_trips_v2 %>% 
     mutate(weekday = wday(started_at, label = TRUE)) %>% 
     group_by(member_casual, weekday) %>% 
     summarise(number_of_rides = n(),average_duration = mean(ride_length)) %>% 
     arrange(member_casual, weekday)  %>% 
     ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
     geom_col(position = "dodge") + labs(title = "Rides per Weekday", x = "Day of the Week", y = "Total Number of Rides", fill = "Rider Type") + scale_y_continuous(labels = comma) +
     scale_fill_manual(values = c("casual" = "lightseagreen", "member" = "lemonchiffon"))+
     theme(panel.background = element_rect(fill = "gray", color = NA))
