data_2015 <- read.csv('2015.csv')
View(data_2015)
householdmodel_2015 <- lm(Median_household_income ~ Total.Population + Male + Aged_18_64 + Median_Age  + Average_household_size + Now_married + High_school_graduate + Some_college_associates + bachelors_degree + graduate_degree + Foreign_born + Civilian_labor_force + Mean_travel_time + Management_business_science_and_arts_occupations + Service_occupations + Sales_and_office_occupations + Natural_resources_construction_maintenance_occupations + Production_transportation_and_material_moving_occupations + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry + Other_services_industry + Housing_units_with_mortgage + Broadband_internet, data = data_2015)
summary(model_2015)
hist(data_2015$Per_capita_income, col='red', xlab = 'percapita')

#this doesn't seem good, because there's probably too much garbage variables due to covariance or random stuff
#so I'm going to most of the industries and occupations
#I remove Total Population, 

householdmodel_2015 <- lm(Median_household_income ~ Male + Aged_18_64 + Median_Age  + Average_household_size + Now_married + High_school_graduate + Some_college_associates + bachelors_degree + graduate_degree + Foreign_born + Civilian_labor_force + Mean_travel_time + Management_business_science_and_arts_occupations + Service_occupations + Sales_and_office_occupations + Natural_resources_construction_maintenance_occupations + Production_transportation_and_material_moving_occupations + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry + Other_services_industry + Broadband_internet, data = data_2015)
summary(model_2015)

#There are still a lot of high p-value coefficients
#removing Aged_18_64

householdmodel_2015 <- lm(Median_household_income ~ Male + Median_Age  + Average_household_size + Now_married + High_school_graduate + Some_college_associates + bachelors_degree + graduate_degree + Foreign_born + Civilian_labor_force + Mean_travel_time + Management_business_science_and_arts_occupations + Service_occupations + Sales_and_office_occupations + Natural_resources_construction_maintenance_occupations + Production_transportation_and_material_moving_occupations + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry + Other_services_industry + Broadband_internet, data = data_2015)
summary(model_2015)

#still not great, so I'm taking out all education and putting in bachelors degree or higher

householdmodel_2015 <- lm(Median_household_income ~ Male + Median_Age  + Average_household_size + Now_married + Bachelor_higher + Foreign_born + Civilian_labor_force + Mean_travel_time + Management_business_science_and_arts_occupations + Service_occupations + Sales_and_office_occupations + Natural_resources_construction_maintenance_occupations + Production_transportation_and_material_moving_occupations + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry + Other_services_industry + Broadband_internet, data = data_2015)
summary(model_2015)

individualmodel_2015 <- lm(Per_capita_income ~ Male + Median_Age  + Average_household_size + Now_married + Bachelor_higher + Foreign_born + Civilian_labor_force + Mean_travel_time + Management_business_science_and_arts_occupations + Service_occupations + Sales_and_office_occupations + Natural_resources_construction_maintenance_occupations + Production_transportation_and_material_moving_occupations + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry + Other_services_industry + Broadband_internet, data = data_2015)
summary(model_2015)

#I think the industries and occupations might be covariate, so I'm going to keep the industries, remove occupations
individualmodel_2015 <- lm(Per_capita_income ~ Male + Median_Age  + Average_household_size + Now_married + Bachelor_higher + Foreign_born + Civilian_labor_force + Mean_travel_time + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry + Other_services_industry + Broadband_internet, data = data_2015)
summary(model_2015)

#I'm removing civilian labor force, and other services

individualmodel_2015 <- lm(Per_capita_income ~ Male + Median_Age  + Average_household_size + Now_married + Bachelor_higher + Foreign_born + Mean_travel_time + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry+ Broadband_internet, data = data_2015)
summary(individualmodel_2015)

householdmodel_2015 <- lm(Median_household_income ~ Male + Median_Age  + Average_household_size + Now_married + Bachelor_higher + Foreign_born + Mean_travel_time + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry+ Broadband_internet, data = data_2015)
summary(householdmodel_2015)



#################################################################################################
#now let's do this for the other models

data_2016 <- read.csv('2016.csv')
View(data_2016)

individualmodel_2016 <- lm(Per_capita_income ~ Male + Median_Age  + Average_household_size + Now_married + Bachelor_higher + Foreign_born + Mean_travel_time + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry+ Broadband_internet, data = data_2016)
summary(individualmodel_2016)


#################################################################################



data_2017 <- read.csv('2015.csv')
View(data_2017)

individualmodel_2017 <- lm(Per_capita_income ~ Male + Median_Age  + Average_household_size + Now_married + Bachelor_higher + Foreign_born + Mean_travel_time + Agriculture_forestry_fishing_and_hunting_mining_industry + Construction_industry + Manufacturing_industry + Wholesale_trade_industry + Retail_trade_industry + Transportation_and_warehousing_and_utilities_industry + Information_industry + Finance_and_insurance_and_real_estate_and_rental_and_leasing + Professional_scientific_management_administrative_waste_management_services_industry + Educational_services_health_care_social_assistance_industry + Arts_entertainment_and_recreation_accommodation_food_services_industry+ Broadband_internet, data = data_2017)
summary(individualmodel_2017)
