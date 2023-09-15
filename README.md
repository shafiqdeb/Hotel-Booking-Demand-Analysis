![slide1](/assets/slides/Slide1.png)

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
- [References](https://github.com/shafiqdeb/Hotel-Booking-Demand-Analysis#references)

<br><br>
 
---

## 1️⃣ Introduction

Analyzing business performance is a vital component of achieving success for companies. Through careful analysis, businesses can uncover their issues, vulnerabilities, and strengths. In the context of the hospitality industry, comprehending customer behavior becomes particularly crucial. This understanding allows companies to pinpoint the factors that sway customers when they're booking hotels. Moreover, it enables companies to recognize which products or services are underperforming in the market. These insights serve as a foundation for tailoring effective business strategies, ultimately enhancing the customer experience and paving the way for long-term business success.

### Objectives
This mini-project was done to:
- [x] Enhance my ability to extract and clean data using Excel and SQL.
- [x] Create informative visualization using Tableau Desktop and Tableau Public.
- [x] Give some suggestions and recommendations to improve the hotel business.

<br><br>

---

## 2️⃣ Problem Statement

Both City and Resort Hotels are experiencing downturn in their booking numbers as people would cancel their reservation after a period of time. The manager wanted to know what was the reasoning behind this and how do they overcome this situation. Come out with some recommendations that we can suggest to the hotels manager in order to improve their business.

### Business Questions

1. Where do the customers are coming from?
2. What would affect the cancellation rate of hotel bookings? and
3. How do hotel prices and duration of stays have impact on the customer satisfaction?

<br><br>

---

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
| Null values or missing cells  | There are null values ​​on `company`, `city`, `children`, and `agent` columns | - `company`: filled with `0`, indicates the guest is not from any company <br> - `agent`: filled with `0`, indicates the guest made an independent reservation or not through an agent <br> - `children`: filled with `0`, indicates the guest is not bringing children to the hotel |
Inappropriate or inconsistent values | The meaning of 'Undefined' in the `meal` column | Changed 'Undefined' to `SC` that refers to Self-Catering, means customer did not request for foods |
Outliers or unusual values | There are negative values ​​and outliers that are very far from the data distribution in the column `adr`| **Deleted** the data row as it would skew the distribution|
| Unnecessary data | `name`, `email`, `phone_number` and `credit_card` columns are said to be artificially created and added into the dataset | **Dropped** the columns as it is irrelevant to be used in the analysis |

<br><br>

---

## 4️⃣ Data Analysis

The purpose of this analysis is to gain insights into booking trends specific to each hotel type. By conducting this analysis, companies can gain a deeper understanding of market dynamics and customer preferences. This knowledge, in turn, can be leveraged to enhance operational efficiency and maximize revenue optimization strategies.

### 1. Introduction on City Hotel and Resort Hotel

According to beaches.com, the main difference between resorts and City Hotels is in the amenities. City Hotels cater to travellers who need a place to spend the night at a certain destination, while Resort Hotels tend to be destinations in themselves. Resorts often have a more spacious layout, offering their guests everything they need in one place[^1].

[slide3]

The first chart shows ratio of bookings in Resort Hotel compared to City Hotel. City Hotel is clearly more popular with customers, with a booking percentage reaching 66% with 79,325 orders. Whereas, Resort Hotels are only booked by 33% of the time, from a total bookings of 119,393 orders.

In regards of the booking cancelation, total number of customer checked-out from both hotels has a whopping amount of 75,164 while customers that declined the bookings represents a total of 44,219 times.

[slide4]

According to data, around 19% of hotel orders made online are canceled before the customer arrives[^2]. These cancellations can cause reduced room availability and impact hotel revenue because every empty room can be a financial burden on that day. Additionally, if a hotel uses an Online Travel Agency (OTA), this cancellation rate can impact the hotel's ranking in searches[^3].

City Hotels have a higher cancellation rate when compared to Resort Hotels. This suggests that a significant portion of customers who book City Hotels tend to cancel their reservations more frequently. One possible explanation for this trend could be the central location of City Hotels in urban areas, close to both tourist and business attractions. Such proximity may lead to customers needing to make various arrangements, and there could be additional factors that contribute to the higher cancellation rates in these urban settings.

<br>

### 2. Insights on countries with the most booking orders

From the given dataset, the hotel customers travelled from 177 distinct coutries, with the most of the bookings coming from European country, specifically in Portugal. Not only that, the top 10 of the booking orders comes from countries that have four season weather which means they most probably travelled for vacations. The distribution of countries can be seen in the map below:

[slide5]

The darker the greenish colour indicates that more bookings coming from that country. Protugal having the most orders with 44,584 bookings, followed by United Kingdom with 12,128 bookings and France with 10,415 booking orders. The rest are below than 10,000 orders that shares the same continent as the top countries.

<br>

### 3. Comparison on total bookings and room rate per months

To investigate the factors influencing cancellation rates among customers, we first examined the relationship between the number of hotel bookings and the months of the year. In the graph, the y-axis represents the total bookings, while the x-axis represents the months, with blue lines indicating City Hotels and orange lines indicating Resort Hotels.

[slide6]

Both City and Resort Hotels show a steady increase in bookings as the year progresses, reaching a peak in August. Then it followed by a sharp decline in bookings for the rest of the year. This indicates that the highest number of hotel bookings occurs during the summer season, typically spanning from June to September. During this period, people are more likely to go on summer vacations, leading to increased bookings.

[slide7]

In August, Resort Hotels have a peak average daily room rate of $187, whereas City Hotels charge an average of $115 per night. When comparing the number of bookings canceled due to price surges, August stands out with the highest cancellation rates compared to other months. This observation suggests that an increase in room rates, especially during the peak summer season, may be a key reason for customers canceling their hotel bookings. Understanding these patterns can help hotels better manage pricing strategies and potentially reduce cancellation rates during peak seasons.

<br>

### 4. Correlation on week of stay against the cancellation rate

To analyze the impact of the duration of customer stays on booking cancellations, we divided the data into two categories: stays during weeknights (Monday to Friday) and stays during weekend nights (Saturday and Sunday) as shown in the chart below:

[slide8]

**Weeknight Stays:**

- For stays less than a week (short stays), there's a significant cancellation rate, with City Hotels having a cancellation rate of more than 25%. However, this rate decreases dramatically in the following weeks. This suggests that many customers initially book for short stays but then cancel their reservations, possibly because they found alternative accommodations or changed their plans.
- In contrast, Resort Hotels show a relatively steady increase in cancellations as the duration of stay extends throughout the week. This could indicate that guests may become dissatisfied with the hotel's services or amenities during longer stays, leading to cancellations.

**Weekend Stays:**

- In the case of weekend stays, there's a notable surge in cancellations for stays of less than a week for City Hotels, accounting for nearly 40% of the total cancellations. However, this cancellation rate decreases linearly with longer stays. This suggests that customers booking City Hotels for weekend getaways may be more likely to cancel if they initially plan for shorter trips.
- For Resort Hotels, there isn't a clear linear pattern in the cancellation rates based on the duration of the stay. However, most of the cancellation rates for Resort Hotels are below 15%, which is relatively low compared to City Hotels.

These findings highlight the need for improvements in the hotel industry, especially for City Hotels, where higher cancellation rates are observed compared to Resort Hotels. These improvements may encompass service quality, pricing strategies, and other factors that influence customer satisfaction and booking cancellations. Understanding these patterns can help hotels take proactive measures to reduce cancellations and enhance the overall guest experience.

<br><br>

---

## 5️⃣ Summary and Recommendation

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


<br><br>

## References

[^1]: Morrow, K. (2021, March 11). *"Resorts vs Hotels: The Differences And Best Option For Your Next Getaway"*. Beaches.
    https://www.beaches.com/blog/resorts-vs-hotels/

[^2]: May, K. (2015, December 31). *"One in five hotel bookings on the web are cancelled"*. Phocuswire.
    https://www.phocuswire.com/One-in-five-hotel-bookings-on-the-web-are-cancelled

[^3]: Verot, B. (2023, August 18). *"Everything you Need to Know About Hotel Cancellations"*. Hotelminder.
    https://www.hotelminder.com/everything-you-need-to-know-about-hotel-cancellations