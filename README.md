# 🏨 Hotel Booking Demand Analysis
# 🚧 [WORK IN PROGRESS] 🚧
A personal project instructed by General Academy to showcase my EDA work. <br>
Click [🔗here](https://public.tableau.com/app/profile/pideb/viz/HotelBookingDemands_16947519881480/STORYBOARD) to access the Tableau Storyboard used in the presentation.

💻 Software: <br>
[![Microsoft Excel](https://img.shields.io/badge/MS_Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)](https://www.microsoft.com/en-my/microsoft-365/excel) 
[![pgAdmin](https://img.shields.io/badge/PgAdmin-34567C?style=for-the-badge&logo=adminer&logoColor=white)](https://www.pgadmin.org/)
[![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://www.tableau.com/) <br>
🅰️ Programming Language:  <br>
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/) <br> <!-- &emsp;-->
📑 Datasets: <br>
[![Kaggle](https://img.shields.io/badge/Kaggle-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)](https://www.kaggle.com/datasets/mojtaba142/hotel-booking)

<br>

**Table of Contents**
- [Introduction](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#1%EF%B8%8F%E2%83%A3-introduction)
    - [Objectives](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#objectives)
- [Problem Statement](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#1%EF%B8%8F%E2%83%A3-problem-statement)
    - [Business Questions](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#business-question)
- [Data Preparation and Cleaning](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#2%EF%B8%8F%E2%83%A3-data-preparation-and-cleaning)
    - [Data Overview](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#data-overview)
    - [Data Handling](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#data-handling)
- [Data Analysis](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#3%EF%B8%8F%E2%83%A3-data-analysis)
- [Summary and Recommendation](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#4%EF%B8%8F%E2%83%A3-summary-and-recommendation)

<br><br>
 
----

## 1️⃣ Introduction

Analyzing business performance is a vital component of achieving success for companies. Through careful analysis, businesses can uncover their issues, vulnerabilities, and strengths. In the context of the hospitality industry, comprehending customer behavior becomes particularly crucial. This understanding allows companies to pinpoint the factors that sway customers when they're booking hotels. Moreover, it enables companies to recognize which products or services are underperforming in the market. These insights serve as a foundation for tailoring effective business strategies, ultimately enhancing the customer experience and paving the way for long-term business success.

### Objectives
This mini-project was done to:
- [x] Enhance my ability to extract and clean data using Excel and SQL.
- [x] Create informative visualization using Tableau Desktop and Tableau Public.
- [x] Give some suggestions and recommendations to improve the hotel business.

<br><br>

## 2️⃣ Problem Statement

Both City and Resort Hotels are experiencing downturn in their booking numbers as people would cancel their reservation after a period of time. The manager wanted to know what was the reasoning behind this and how do they overcome this situation. Come out with some recommendations that we can suggest to the hotels manager in order to improve their business.

### Business Questions

1. Where do the customers are coming from?
2. What would affect the cancellation rate of hotel bookings? and
3. How do hotel prices and duration of stays have impact on the customer satisfaction?

<br><br>

----

## 3️⃣ Data Preparation and Cleaning

### Data Overview
For this **EDA** (Exploratory Data Analysis) project, I will be utilizing the "Hotel booking demand" dataset. The original source of this data is the [article](https://www.sciencedirect.com/science/article/pii/S2352340918315191) titled "Hotel Booking Demand Datasets," authored by *Nuno Antonio*, *Ana Almeida*, and *Luis Nunes*, and published in [Data in Brief](https://www.sciencedirect.com/journal/data-in-brief), Volume 22, in February 2019. The dataset was downloaded and subjected to cleaning procedures by *Thomas Mock* and *Antoine Bichat* during the [#TidyTuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2020/2020-02-11) initiative in the week of February 11th, 2020.<br>

![GitHub](https://img.shields.io/github/license/rfordatascience/tidytuesday)


The dataset consists of `29` columns and `119390` rows and held three years worth of transactions ranging from October 2014 until September 2017. It includes booking details for both City Hotel and Resort Hotel. The dataset also includes hotel reservation information such as the booking date, length of stay, the number of adults, children, and babies, as well as, the availability of parking spaces, among other attributes.

> [!NOTE] 
> All personally identifiable information has been carefully removed from the dataset to ensure privacy.

<br>

### Data Dictionary
<details>

<summary>Click to open the table</summary>
<br>

|Column name                    |Datatype  |Description |
|:------------------------------|:--------:|:-----------|
|hotel                          |character | Hotel types (`Resort Hotel` or `City Hotel`) |
|is_canceled                    |double    | Value indicating if the booking was canceled (`1`) or not (`0`) |
|lead_time                      |double    | Number of days that elapsed between the entering date of the booking into the PMS and the arrival date |
|arrival_date_year              |double    | Year of arrival date|
|arrival_date_month             |character | Month of arrival date|
|arrival_date_week_number       |double    | Week number of year for arrival date|
|arrival_date_day_of_month      |double    | Day of arrival date|
|stays_in_weekend_nights        |double    | Number of weekend nights (Saturday or Sunday) the guest stayed or booked to stay at the hotel |
|stays_in_week_nights           |double    |  Number of week nights (Monday to Friday) the guest stayed or booked to stay at the hotel|
|adults                         |double    | Number of adults|
|children                       |double    | Number of children|
|babies                         |double    |Number of babies |
|meal                           |character | Type of meal booked. Categories are presented in standard hospitality meal packages: <br>`BB` – Bed & Breakfast <br> `HB` – Half board (breakfast and one other meal – usually dinner) <br> `FB` – Full board (breakfast, lunch and dinner) <br> `SC` – Self Catering (no meal package) |
|country                        |character | Country of origin. Categories are represented in the `ISO 3155–3:2013` format |
|market_segment                 |character | Market segment designation, in categories. <br> – `TA` means "Travel Agents" <br> – `TO` means "Tour Operators" |
|distribution_channel           |character | Booking distribution channel. <br> – `TA` means "Travel Agents" <br> – `TO` means "Tour Operators" |
|is_repeated_guest              |double    | Value indicating if the booking name was from a repeated guest (`1`) or not (`0`) |
|previous_cancellations         |double    | Number of previous bookings that were cancelled by the customer prior to the current booking |
|previous_bookings_not_canceled |double    | Number of previous bookings not cancelled by the customer prior to the current booking |
|reserved_room_type             |character | Code of room type reserved. Code is presented instead of designation for anonymity reasons |
|assigned_room_type             |character | Code for the type of room assigned to the booking. Sometimes the assigned room type differs from the reserved room type due to hotel operation reasons (e.g. overbooking) or by customer request. Code is presented instead of designation for anonymity reasons |
|booking_changes                |double    | Number of changes/amendments made to the booking from the moment the booking was entered on the PMS until the moment of check-in or cancellation|
|deposit_type                   |character | Indication on if the customer made a deposit to guarantee the booking. This variable can assume three categories:<br>`No Deposit` – no deposit was made<br>`Non Refund` – a deposit was made in the value of the total stay cost<br>`Refundable` – a deposit was made with a value under the total cost of stay. |
|agent                          |character | ID of the travel agency that made the booking |
|company                        |character | ID of the company/entity that made the booking or responsible for paying the booking. ID is presented instead of designation for anonymity reasons |
|days_in_waiting_list           |double    | Number of days the booking was in the waiting list before it was confirmed to the customer |
|customer_type                  |character | Type of booking, assuming one of four categories:<br>`Contract` – when the booking has an allotment or other type of contract associated to it<br>`Group` – when the booking is associated to a group;<br>`Transient` – when the booking is not part of a group or contract, and is not associated to other transient booking<br>`Transient-party` – when the booking is transient, but is associated to at least other transient booking|
|adr                            |double    | Average Daily Rate as defined by dividing the sum of all lodging transactions by the total number of staying nights |
|required_car_parking_spaces    |double    | Number of car parking spaces required by the customer |
|total_of_special_requests      |double    | Number of special requests made by the customer (e.g. twin bed or high floor)|
|reservation_status             |character | Reservation last status, assuming one of three categories:<br>`Canceled` – booking was canceled by the customer<br>`Check-Out` – customer has checked in but already departed<br>`No-Show` – customer did not check-in and did inform the hotel of the reason why |
|reservation_status_date        |double    | Date at which the last status was set. This variable can be used in conjunction with the ReservationStatus to understand when was the booking canceled or when did the customer checked-out of the hotel |

</details>

<br> 

### Data Handling
Data assessment is carried out to ensure that the data used for further analysis is ready and in accordance with the analysis needs. Things to do:

- Check for `null` ​​or missing values
- Perform data type and value consistency
- Check for any outliers or unusual values 
- Drop any unnecessary columns that are not used in the analysis

<br>

Data handling summary:

| Data Assessment | Finding | Handling |
| --------------- | ------- | -------- |
| Null values or missing cells | There are null values ​​on `company`, `city`, `children`, and `agent` columns | - `company`: is filled with `0`, indicates the guest is not from any company <br> - `agent`: filled with `0`, indicates the guest made an independent reservation or not through an agent <br> - `children`: filled with `0`, indicates the guest is not bringing children to the hotel<br> - `city`: filled with `Undefined`, because the city is not known or uncertain |
Inappropriate or inconsistent values | 	The meaning of 'Undefined' in the `meal` column | Values in `meal` column ​​can be categorized into 2, namely: <br> - `With Meal` (for values with BB, HB, FB) <br> - `No Meal` (for values with SC and Undefined)
Anomalous data or data that is not needed | - There are negative values ​​and outliers that are very far from the data distribution in the column `adr` <br> - There are 180 booking data that do not have guests | **Delete** or **drop** the data row

<br><br>

----

## 4️⃣ Data Analysis

testing

<br><br>

----

## 5️⃣ Summary and Recommendation

<!--

In summary, City Hotels are the preferred choice for most customers, and there's a noticeable surge in bookings during holiday seasons, particularly from May to July and October to December. Based on these observations, here are some business recommendations:

1. **Enhance Resort Hotels**: Given the lower booking rates for Resort Hotels, companies can focus on optimizing their facilities and services to attract more customers. Consider adding amenities like spas, gyms, or swimming pools to improve the overall guest experience. Providing personalized and friendly customer service can also make a significant difference.

2. **Boost Promotions During Peak Seasons**: During holiday seasons, consider implementing promotional strategies to attract more guests. Special discounts for guests booking multiple rooms or enticing holiday packages can be effective. To minimize booking cancellations, think about introducing non-refundable booking options.

3. **Flexible Pricing for Off-Peak Times**: During low season periods, companies can adopt a combination of flexible and non-refundable rates to attract guests. Offering special but non-refundable discounts can help maintain bookings even during less busy times.

<br>

The cancellation rate increases as the length of stay in both types of hotels incereases. City Hotels' cancellation rate increased significantly with the lowest percentage for a duration of less than one week. Resort hotels also tend to experience an increase in cancellation rates, but they are more stagnant and for stays of less than 2 weeks and more than 1 month the cancellation rate tends to be lower. Based on the insights about cancellation rates and the length of stay at both types of hotels, here are some business recommendations:

1. **Establish Clear Cancellation Policies**: It's essential for companies to have well-defined cancellation policies in place to protect against revenue loss. These policies should be communicated clearly to customers both during online and offline booking processes. They should encompass details about refunds, cancellation fees, and other terms and conditions. Implementing stricter cancellation policies can help deter fraudulent bookings and minimize revenue impact.

2. **Optimize Pricing Strategies**: Consider implementing a pricing strategy that includes limiting the number of overnight stays. For flexible rates, you can set a one-week window for maximum stays, reducing the risk of unwanted cancellations. Additionally, offer non-refundable rates for longer stays to increase revenue and discourage last-minute cancellations.

3. **Enhance Pre-Stay Services**: To prevent cancellations, focus on improving customer satisfaction by providing excellent pre-stay services. Engage with customers before their arrival, addressing their questions or concerns promptly. Personalized and attentive service can build loyalty and reduce the likelihood of guests canceling their reservations.

<br>
By implementing these recommendations, both City and Resort Hotels can effectively manage lead times and reduce cancellation rates, ultimately improving revenue and guest satisfaction.

-->