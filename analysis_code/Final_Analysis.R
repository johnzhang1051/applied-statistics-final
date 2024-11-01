library(leaps)
data_2015 <- read.csv('2015.csv')
View(data_2015)

#let's do race/black, gender/women, mean commuting time, pupil-teacher ratio, teacher salaries, internet

model_2015 <- lm(Per_capita_income ~  Median_Age + Black + Female + Pupil_Teacher_Ratio + Teacher_Wages + Mean_travel_time + Internet_Access, data = data_2015)
summary(model_2015)

model_2015 <- lm(Per_capita_income ~  Total.Population+Female +Aged_18_64+Median_Age+Average_household_size+Now_married+High_school_graduate+Some_college_associates+	bachelors_degree+graduate_degree+Foreign_born+Civilian_labor_force+Mean_travel_time+Management_business_science_and_arts_occupations+Service_occupations+Sales_and_office_occupations+Natural_resources_construction_maintenance_occupations+Production_transportation_and_material_moving_occupations+Agriculture_forestry_fishing_and_hunting_mining_industry+Construction_industry+Manufacturing_industry+Wholesale_trade_industry+Retail_trade_industry+Transportation_and_warehousing_and_utilities_industry+Information_industry+Finance_and_insurance_and_real_estate_and_rental_and_leasing+Professional_scientific_management_administrative_waste_management_services_industry+Educational_services_health_care_social_assistance_industry+Arts_entertainment_and_recreation_accommodation_food_services_industry+Other_services_industry+Public_administration_industry+Internet_Access+Teacher_Wages+Pupil_Teacher_Ratio+White+Black, data = data_2015)
summary(model_2015)

#let's do best subsets
a<-regsubsets(Per_capita_income~.,data=data_2015, nvmax = 10)
summary(a)
plot(a)

model_2015 <- lm(Per_capita_income ~ Civilian_labor_force + Mean_travel_time + Internet_Access + Teacher_Wages + Pupil_Teacher_Ratio + Black, data=data_2015)
summary(model_2015)
#################################################################################################
#now let's do this for the other models

data_2016 <- read.csv('2016.csv')
View(data_2016)

model_2016 <- lm(Per_capita_income ~ Black + Female + Pupil_Teacher_Ratio + Teacher_Wages + Mean_travel_time + Internet_Access, data = data_2016)
summary(model_2016)

b<-regsubsets(Per_capita_income~.,data=data_2016, nbest=10, nvmax = 10, intercept = TRUE)
View(data_2016)
summary(b)
plot(b)

model_2016 <- lm(Per_capita_income ~ Civilian_labor_force + Mean_travel_time + Internet_Access + Teacher_Wages + Pupil_Teacher_Ratio + Black, data = data_2016)
summary(model_2016)
#################################################################################



data_2017 <- read.csv('2017.csv')
View(data_2017)

model_2017 <- lm(Per_capita_income ~ Black + Female + Pupil_Teacher_Ratio + Teacher_Wages + Mean_travel_time + Internet_Access, data = data_2017)
summary(model_2017)

c<-regsubsets(Per_capita_income~.,data=data_2017, nbest=10, nvmax = 10, intercept = TRUE)
summary(c)
plot(b)

model_2017 <- lm(Per_capita_income ~ Civilian_labor_force + Mean_travel_time + Internet_Access + Teacher_Wages + Pupil_Teacher_Ratio + Black, data = data_2017)
summary(model_2017)



#########################################################
hist(data_2015$Black)
data_2015$black
data_2015
model_black_income_2015 = lm(Per_capita_income ~ Black, data = data_2015)
summary(model_black_income_2015)
###################################################
coefficients <- read.csv('coefficients.csv')
View(coefficients)
library(ggplot2)
ggplot(data = coefficients, aes(x = Year, y = Coefficient, colour = �..)) + 
  geom_line() + geom_point() + theme_bw() + xlab("Year") + ylab("Per Capita Income") #gorgeous

#take out black...
coefficients1 <- read.csv('co_no_black.csv')
View(coefficients)
library(ggplot2)
ggplot(data = coefficients1, aes(x = Year, y = Coefficient, colour = �..)) + 
  geom_line() + geom_point() + theme_bw() + xlab("Year") + ylab("Per Capita Income") #gorgeous
