use "..\..\STATA\HHV1_PERV1_merged.dta" 

*******INSTALLED PACKAGES*******
ssc install asdoc

*******GENERATING NEW VARIABLES*******
gen pvar141 = cond(pvar32>51 & pvar35=="1", pvar44, pvar33)
label variable pvar141 "Usual status_NIC"
tostring pvar141, format("%05.0f") replace

gen pvar142 = cond(pvar32>51 & pvar35=="1", pvar45, pvar34)
label variable pvar142 "Usual status_NCO"

gen pvar143 = substr(pvar141,1,2)
label variable pvar143 "Usual status_NIC 2 digit"
destring pvar143, replace

gen pvar144 = ""
replace pvar144 = "Agriculture, forestry and fishing" if pvar143>=1 & pvar143<=3
replace pvar144 = "Mining and quarrying" if pvar143>=5 & pvar143<=9
replace pvar144 = "Manufacturing" if pvar143>=10 & pvar143<=33
replace pvar144 = "Electricity and water supply" if pvar143>=35 & pvar143<=39
replace pvar144 = "Construction" if pvar143>=41 & pvar143<=43
replace pvar144 = "Trade" if pvar143>=45 & pvar143<=47
replace pvar144 = "Transport" if pvar143>=49 & pvar143<=53
replace pvar144 = "Accomodation and food services" if pvar143>=55 & pvar143<=56
replace pvar144 = "Other services" if pvar143>=58 & pvar143<=99
label variable pvar144 "Usual status_ NIC Sector"

gen pvar145 = cond(pvar32>51 & pvar35=="1", pvar49, pvar39)
label variable pvar145 "Usual status_Job contract"

gen pvar146 = cond(pvar32>51 & pvar35=="1", pvar51, pvar41)
label variable pvar146 "Usual status_Social Security"

*******LABELING VALUES OF VARIABLES*******

//State names
destring pvar6, replace
label define lvar6 01 "Jammu & Kashmir"	02 "Himachal Pradesh"	03 "Punjab"	04 "Chandigarh"	///
 05 "Uttarakhand"	06 "Haryana"	07 "Delhi"	08 "Rajasthan"	09 "Uttar Pradesh"	10 "Bihar" ///
 11 "Sikkim"	12 "Arunachal Pradesh"	13 "Nagaland"	14 "Manipur"	15 "Mizoram"	16 "Tripura" ///
 17 "Meghalaya"	18 "Assam"	19 "West Bengal"	20 "Jharkhand"	21 "Odisha"	22 "Chhattisgarh"	///
 23 "Madhya Pradesh"	24 "Gujarat"	25 "D & N. Haveli & Daman & Diu"	27 "Maharashtra"	///
 28 "Andhra Pradesh"	29 "Karnataka"	30 "Goa"	31 "Lakshadweep"	32 "Kerala"	33 "Tamilnadu"	///
 34 "Puduchery"	35 "Andaman & N. Island"	36 "Telangana"	37 "Ladakh"
label values pvar6 lvar6

//General education
destring pvar22, replace
label define lvar22 01 "not literate" 02 "literate without formal schooling: EGS/ NFEC/ AEC" ///
 03 "TLC" 04 "others" 05 "literate: below primary" 06 "primary" 07 "middle" 08 "secondary" ///
 10 "higher secondary" 11 "diploma/certificate course" 12 "graduate" 13 "postgraduate and above"
label values pvar22 lvar22

//Technical education
destring pvar23, replace
label define lvar23 ///
    01 "No technical education" ///
    02 "Technical degree in agriculture" ///
    03 "Technical degree in engineering/technology" ///
    04 "Technical degree in medicine" ///
    05 "Technical degree in crafts" ///
    06 "Technical degree in other subjects" ///
    07 "Diploma or certificate (below graduate level) in agriculture" ///
    08 "Diploma or certificate (below graduate level) in engineering/technology" ///
    09 "Diploma or certificate (below graduate level) in medicine" ///
    10 "Diploma or certificate (below graduate level) in crafts" ///
    11 "Diploma or certificate (below graduate level) in other subjects" ///
    12 "Diploma or certificate (graduate and above level) in agriculture" ///
    13 "Diploma or certificate (graduate and above level) in engineering/technology" ///
    14 "Diploma or certificate (graduate and above level) in medicine" ///
    15 "Diploma or certificate (graduate and above level) in crafts" ///
    16 "Diploma or certificate (graduate and above level) in other subjects"
label values pvar23 lvar23

//Whether recieved any vocational training
destring pvar26, replace
label define lvar26 ///
	1 "Received formal vocational/technical training" ///
    2 "Received vocational/technical training other than formal vocational/technical training: hereditary" ///
    3 "Received vocational/technical training other than formal vocational/technical training: self-learning" ///
    4 "Received vocational/technical training other than formal vocational/technical training: learning on the job" ///
	5 "Received vocational/technical training other than formal vocational/technical training: others" ///
    6 "Did not receive any vocational/technical training"
label values pvar26 lvar26

//Field of training
destring pvar28, replace
label define lvar28 ///
	01 "Aerospace and Aviation" ///
    02 "Agriculture, Non-crop based Agriculture, Food Processing" ///
    03 "Allied Manufacturing: Gems and Jewellery, Leather, Rubber, Furniture and Fittings, Printing" ///
    04 "Artisan/Craftsman/Handicraft/Creative Arts and Cottage Based Production" ///
    05 "Automotive" ///
    06 "Beauty and Wellness" ///
    07 "Chemical Engineering, Hydrocarbons, Chemicals and Petrochemicals" ///
    08 "Civil Engineering: Construction, Plumbing, Paints and Coatings" ///
    09 "Electrical, Power and Electronics" ///
    10 "Healthcare and Life Sciences" ///
    11 "Hospitality and Tourism" ///
	12 "Iron and Steel, Mining, Earthmoving and Infra Building" ///
	13 "IT-ITeS" ///
	14 "Logistics" ///
	15 "Mechanical Engineering: Capital Goods, Strategic Manufacturing" ///
	16 "Media: Journalism, Mass Communication and Entertainment" ///
	17 "Office and Business Related Work" ///
	18 "Security" ///
	19 "Telecom" ///
	20 "Textiles and Handlooms, Apparels" ///
	21 "Work Related to Childcare, Nutrition, Pre-school and Crèche" ///
	99 "Other"
label values pvar28 lvar28

//Duration of training
destring pvar29, replace
label define lvar29 ///
	1 "Less than 3 months" ///
	2 "3 months or more but less than 6 months" ///
	3 "6 months or more but less than 12 months" ///
	4 "12 months or more but less than 18 months" ///
	5 "18 months or more but less than 24 months" ///
	6 "24 months or more"
label values pvar29 lvar29

//Location of training
destring pvar30, replace
label define lvar30 ///
	1 "On the job" ///
	2 "Other than on the job: Part-time" ///
	3 "Other than on the job: Full-time"
label values pvar30 lvar30

//Funding for training
destring pvar31, replace
label define lvar31 ///
	1 "Govt" ///
	2 "Own funding" ///
	9 "Others"
label values pvar31 lvar31
	
//Nature of work
label define lvar140 ///
    11 "Worked in household enterprise (self employed): Own account worker" ///
    12 "Worked in household enterprise (self employed): Employer" ///
    21 "worked as helper in h.h. enterprise(unpaid family worker)" ///
    31 "Regular salaried/wage employee" ///
    41 "Casual wage labor: Public works" ///
    51 "Casual wage labor: Other types of work" ///
    81 "Seeking/available for work but did not work" ///
    91 "Attended educational institution" ///
    92 "Attended domestic duties only" ///
    93 "Engaged in domestic duties and other household activities" ///
    94 "Rentiers, pensioners, remittance recipients, etc." ///
    95 "Not able to work due to disability" ///
    97 "Others (including begging, prostitution, etc.)"
label values pvar140 lvar140

//Coal miners NCO occupations

destring pvar142, replace
label define lvar142 ///
	112 "Managing directors and Chief Executives" ///
	121 "Business Services and Administration Managers" ///
	122 "Sales, Marketing and Development Managers" ///
	132 "Manufacturing, Mining, Construction and Distribution Managers" ///
	134 "Professional Services Managers" ///
	143 "Other Services Managers" ///
	211 "Physical and Earth Science Professionals" ///
	214 "Engineering Professionals (Excluding Electrotechnology)" ///
	216 "Architects, Planners, Surveyors and Designers" ///
	241 "Finance Professionals" ///
	243 "Sales, Marketing and Public Relations Professionals" ///
	263 "Social and Religious Professionals" ///
	311 "Physical and Engineering Science Technicians" ///
	312 "Mining, Manufacturing and Construction Supervisors" ///
	313 "Process Control Technicians" ///
	332 "Sales and Purchasing Agents and Brokers" ///
	333 "Business Service Agents" ///
	334 "Administrative and Specialized Secretaries" ///
	411 "General Office Clerks" ///
	413 "Keyboard Operators" ///
	431 "Numerical Clerks" ///
	432 "Material Recording and Transport Clerks" ///
	441 "Other Clerical Support Workers" ///
	522 "Shop Salespersons" ///
	524 "Other Sales Workers" ///
	541 "Protective Service Workers" ///
	611 "Market Gardeners & Crop Growers" ///
	711 "Building Frames and Related Trades Workers" ///
	712 "Building Finishers and Related Trades Workers" ///
	721 "Sheet and Structural Metal Workers, Moulders and Welders, and Related Workers" ///
	723 "Machinery Mechanics and Repairers" ///
	731 "Handicraft Workers" ///
	741 "Electrical Equipment Installers and Repairers" ///
	742 "Electronics and Telecommunication Installers and Repairers" ///
	752 "Wood Treaters, Cabinet Makers and Related Trades Workers" ///
	811 "Mining and Mineral Processing Plant Operators" ///
	812 "Metal Processing and Finishing Plant Operators" ///
	813 "Chemical and Photographic Products Plant and Machine Operators" ///
	814 "Rubber, Plastic and Paper Products Machine Operators" ///
	815 "Textile, Fur and Leather Products Machine Operators" ///
	818 "Other Stationary Plant and Machine Operators" ///
	821 "Assemblers" ///
	832 "Car, Van and Motorcycle Drivers" ///
	833 "Heavy Truck and Bus Drivers" ///
	834 "Mobile Plant Operators" ///
	911 "Domestic, Hotel and Office Cleaners and Helpers" ///
	912 "Vehicle, Window, Laundry and Other Hand Cleaners" ///
	931 "Mining and Construction Labourers" ///
	932 "Manufacturing Labourers" ///
	933 "Transport and Storage Labourers" ///
	961 "Refuse Workers" ///
	962 "Other Elementary Workers"
label values pvar142 lvar142


//Nature of job contract
destring pvar145, replace
label define lvar145 ///
	1 "no written job contract" ///
    2 "written job contract: for 1 year or less" ///
    3 "written job contract: more than 1 year to 3 years" ///
    4 "written job contract: more than 3 years"
label values pvar145 lvar145

//Access to social security 
destring pvar146, replace
label define lvar146 ///
	1 "eligible for: only PF/ pension" ///
    2 "eligible for: only gratuity" ///
    3 "eligible for: only health care/ maternity benefits" ///
    4 "eligible for: only PF/ pension and gratuity" ///
    5 "eligible for: only PF/ pension and health care/ maternity benefits" ///
    6 "eligible for: only gratuity and health care/ maternity benefits" ///
    7 "eligible for: PF/ pension, gratuity, health care/ maternity benefits" ///
	8 "not eligible for any of above social security benefits" ///
	9 "not known"
label values pvar146 lvar146

*Correcting for wrong pvar74 label in the layout file
label variable pvar74 "wage earning for activity 1 on 6 th day"

*******QUESTIONS TO ANSWER*******
// numlabel, add 
/// (optional) If we want to add numeric labels with dexriptive ones in table below

//Age distribution of coal miners aged 15 and above
destring pvar20, replace
histogram pvar20 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], percent width(10) addlabel ///
 xlabel(0(10)100)
*Based on 230 coal miners

//Status of general education of coal miners aged 15 and above
asdoc tab pvar22 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], replace ///
	save(G:\Shared drives\Just Transition\Management\Datasets\PLFS 2022-23\Coal mining study\STATA_outputs_Coalminers_India.doc) title(Coal miners, age>=15_ - General Education Levels)

//Status of technical education of coal miners aged 15 and above
asdoc tab pvar23 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_  - Technical Education) 
	
//Status of vocational education of coal miners aged 15 and above
asdoc tab pvar26 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_  - Whether recieved any technical/vocational training)
asdoc tab pvar28 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_  - Field of training)
asdoc tab pvar29 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_  - Duration of training)
asdoc tab pvar30 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_  - Location of training)
asdoc tab pvar31 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_  - Source of funding for training)
	
// Distribution of coal miners based on NCO occupation
asdoc tab pvar142 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_  - Employment occupation)
	
// Distribution of all miners (coal and lignite, metal ores, other mining and quarrying) in India based on NCO
tab pvar142 if pvar20>=15 & inlist(substr(pvar141,1,3),"051", "052", "071","072", "081", "089") [fweight = round(weight)]

// Distribution of all miners (coal and lignite, metal ores, other mining and quarrying) in Odisha based on NCO
tab pvar142 if pvar20>=15 & pvar6 == 21 & inlist(substr(pvar141,1,3),"051", "052", "071","072", "081", "089") [fweight = round(weight)]

// Distribution of coal miners based on the nature of the contract
asdoc tab pvar145 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_ - Nature of contracts)

//Distribution of coal miners based on social security benefits
asdoc tab pvar146 if pvar20>=15 & substr(pvar141,1,4) == "0510" [fweight = round(weight)], ///
	append title(Coal miners, age>=15_ - Provision of social security benefits)
