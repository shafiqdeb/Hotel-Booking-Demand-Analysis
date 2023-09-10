# 🏨 Hotel Booking Demand Analysis
# 🚧 [WORK IN PROGRESS] 🚧
A personal project instructed by General Academy to showcase my EDA work <br>

**Tools**: Microsoft Excel, PgAdmin, Tableau <br>
**Programming Language**: PostgreSQL <br>
<!--Dataset: [Kaggle open dataset](https://www.kaggle.com/datasets/mojtaba142/hotel-booking)--> <br>

**Table of Contents**
- Problem Statement
    - Introduction
    - Business Question
    - Objectives
- Data Preparation and Cleaning
    - Data Overview
    - Data Assessment
- Data Analysis
- Summary and Recommendation

<br>
<br>

----

## 1️⃣ Problem Statement

### Introduction
Analyzing business performance is a vital component of achieving success for companies. Through careful analysis, businesses can uncover their issues, vulnerabilities, and strengths. In the context of the hospitality industry, comprehending customer behavior becomes particularly crucial. This understanding allows companies to pinpoint the factors that sway customers when they're booking hotels. Moreover, it enables companies to recognize which products or services are underperforming in the market. These insights serve as a foundation for tailoring effective business strategies, ultimately enhancing the customer experience and paving the way for long-term business success.

### Business Question
1. What types of hotels do customers visit most often?
2. Does length of stay affect hotel booking cancellation rates?
3. Does the time lag between a hotel reservation and the day the guest arrives affect the cancellation rate of hotel reservations?

### Objectives
This mini-project was done to:
1. Enhance my ability to extract, clean and summarize data.
2. Create informative visualization from queries in PostgreSQL.
3. Give some suggestions to improve the hotel business.

<br>
<br>
<br>

----

## 2️⃣ Data Preparation and Cleaning

### Data Overview
For this **EDA** (Exploratory Data Analysis) project, I will be utilizing the "Hotel booking demand" dataset. The original source of this data is the [article](https://www.sciencedirect.com/science/article/pii/S2352340918315191) titled "Hotel Booking Demand Datasets," authored by *Nuno Antonio*, *Ana Almeida*, and *Luis Nunes*, and published in [Data in Brief](https://www.sciencedirect.com/journal/data-in-brief), Volume 22, in February 2019. The dataset was downloaded and subjected to cleaning procedures by *Thomas Mock* and *Antoine Bichat* during the [#TidyTuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2020/2020-02-11) initiative in the week of February 11th, 2020.

The dataset consists of `29` columns and `119390` rows and held three years worth of transactions ranging from October 2014 until September 2017. It also includes booking details for both city hotel and resort hotel. It includes hotel reservation information such as the booking date, length of stay, the number of adults, children, and babies, as well as the availability of parking spaces, among other attributes.

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

### Data Assessment
Data assessment is carried out to ensure that the data used for further analysis is ready and in accordance with the analysis needs. Things to do:

- Checking for `null` values ​​or missing values ​​in the data
- Checking data duplication
- Performs data type and value consistency
- Check for outliers or unusual data

<br>

Data handling summary:

| Data Assessment | Finding | Handling |
| --------------- | ------- | -------- |
| Null values or missing cells | There are null values ​​on `company`, `city`, `children`, and `agent` columns | - `company`: is filled with `0`, indicates the guest is not from any company <br> - `agent`: filled with `0`, indicates the guest made an independent reservation or not through an agent <br> - `children`: filled with `0`, indicates the guest is not bringing children to the hotel<br> - `city`: filled with `Undefined`, because the city is not known or uncertain |
Inappropriate or inconsistent values | 	The meaning of 'Undefined' in the `meal` column | Values in `meal` column ​​can be categorized into 2, namely: <br> - `With Meal` (for values with BB, HB, FB) <br> - `No Meal` (for values with SC and Undefined)
Anomalous data or data that is not needed | - There are negative values ​​and outliers that are very far from the data distribution in the column `adr` <br> - There are 180 booking data that do not have guests | **Delete** or **drop** the data row

<br>
<br>
<br>

----

## 3️⃣ Data Analysis


<br>
<br>
<br>

----

## 4️⃣ Summary and Recommendation