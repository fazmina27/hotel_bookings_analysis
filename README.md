# Hotel Booking Analysis — From Data to Business Strategy  
### A Data-Driven Case Study Using SQL · Python · Tableau

---

## Executive Summary  

This project analyzes **119,390 hotel bookings** to uncover the drivers behind **revenue, cancellations, and booking behavior** across City and Resort hotels.  
Using **SQL for data engineering**, **Python for exploratory analysis**, and **Tableau for visualization**, I translated raw operational data into actionable insights and revenue-focused strategies.  

**Key Results:**  
- City Hotels receive 2× more bookings, but Resorts generate 35% more revenue per booking.  
- Cancellations increase sharply (up to 88%) for bookings made over 400 days in advance.  
- Strategic pricing and policy changes could increase annual revenue by 15–20%.  


    <img src="visuals\dashboard\Hotel Booking Dashboard.png" alt="dashboard" width="850" />

---

## Business Context  

Despite stable booking volumes, profitability was inconsistent across hotel types.  
City Hotels maintained high occupancy but lower per-guest value; Resort Hotels earned more per booking but suffered from seasonality and cancellations.  

The goal was to determine:  
1. What differentiates performance between City and Resort hotels?  
2. What factors drive cancellations and lost revenue?  
3. Which channels and guest segments contribute most to profit?  
4. What strategic levers can sustainably increase total revenue?

---

## Data Overview and Preparation  

- Dataset: 119,390 booking records from two hotel types (City, Resort).  
- Data Cleaning (SQL):  
  - Removed 180 invalid records (bookings with zero guests).  
  - Replaced NULL and blank values with standardized “Unknown.”  
  - Created computed fields: `stay_length`, `guest_count`, `booking_status`, `total_revenue`, and `seasons`.  
- Validation: Ensured no duplicate booking IDs and consistent date ranges.  


---

## Analytical Approach  

1. **SQL — Data Engineering**  
   Structured and transformed raw data; joined hotel and country dimensions.  

2. **Python — Exploratory Data Analysis (EDA)**  
   - Analyzed distributions, correlations, and booking behavior.  
   - Quantified revenue drivers and cancellation patterns.  

   
       <img src="visuals\plots\corr_headmap.png" alt="Correlation Heatmap" width="500" />    


3. **Tableau — Visualization & Storytelling**  
   Developed dashboards summarizing performance by hotel type, segment, and season.  

  

   [🔗 View Dashboard on Tableau Public](https://public.tableau.com/app/profile/fazmina.a8154/viz/Dashboard-HotelBooking/HotelBookingDashboard)

   

4. **Business Interpretation**  
   Synthesized results into data-driven recommendations with measurable financial impact.

---

## Core Findings and Evidence  

1. **City Hotels win in volume; Resort Hotels win in value.**  
   - City Hotels: ~80K bookings vs. ~40K for Resorts.  
   - Resorts: Average revenue per booking ₹430 vs. ₹320 in City Hotels.  
   - City Hotels rely on short-stay, high-frequency guests; Resorts attract longer leisure stays.   

 
       <img src="visuals\plots\hotel_per_booking_revenue.png" alt="hotel_per_booking_revenue" width="500"/> 


2. **Long lead times cause cancellations.**  
   - Cancellation rate exceeds 85% when lead time > 400 days.  
   - Flexible OTA bookings amplify cancellations.  
    
      <img src="visuals\plots\leadtime_distribution.png" width="500" />    <img src="visuals\plots\leadtime_cancellation_rate.png" alt="leadtime_cancellation_rate" width="500"/>
   
   
3. **ADR alone doesn’t determine profitability.**  
   - City ADR = ₹105; Resort ADR = ₹93.  
   - Longer stays and package deals at Resorts offset lower nightly rates.  
    

4. **Channel mix shapes revenue quality.**  
   - 52% of City bookings from OTAs; 2× Resort proportion.  
   - OTA commissions reduce margins; Direct/Corporate channels yield steadier profits.  


     <img src="visuals\plots\market_segment_distribution.png" height="300"/>  

5. **Guest demographics influence behavior.**  
   - Families (43%) and couples (27%) dominate Resort stays.  
   - Business travelers drive City occupancy year-round with low cancellation rates.  


     <img src="visuals\plots\guest_demographics.png" width="350"/>

---

## Strategic Recommendations  

Based on verified insights, I proposed actions tied directly to measurable KPIs:

**1. Dynamic Pricing and Yield Optimization**  
- Use historical occupancy data and lead-time curves to adjust ADR dynamically.  
- Introduce early-bird discounts and high-demand surcharges.  
- Expected impact: 5–10% increase in ADR, verified through simulation analysis.  
  

**2. Strengthen Cancellation Policies**  
- Introduce partial prepayment or tiered flexibility options.  
- Differentiate policies by booking channel and lead-time segment.  
- Expected impact: 12–15% reduction in lost revenue from cancellations.  

**3. Optimize Channel Mix**  
- Shift 15–20% OTA volume toward direct bookings via loyalty incentives and digital campaigns.  
- Reduce commission costs and improve margin stability.  
- Verified by sensitivity analysis on channel profitability.  

**4. Increase Ancillary Revenue**  
- Bundle value-added services: meals, spa, transport, and premium upgrades.  
- For City Hotels: position “business convenience” packages.  
- For Resorts: emphasize “experience-driven” bundles.  
- Estimated gain: 8–12% uplift in per-guest spend.  

**5. Manage Resort Seasonality**  
- Launch off-season campaigns targeting remote workers and wellness travelers.  
- Partner with corporates for retreats and events during slow months.  
- Forecasted 15–20% improvement in off-season occupancy.  

**6. Build a Unified Loyalty Program**  
- Introduce a shared loyalty system across City and Resort hotels.  
- Cross-property benefits to increase repeat stays and lifetime value.  
- Expected retention growth: +10% repeat bookings within 12 months.  

---

## Tools and Technologies  

- SQL (PostgreSQL): data cleaning, transformation, and computation.  
- Python (Pandas, NumPy, Seaborn, Matplotlib): EDA, visualization, correlation analysis.  
- Tableau: KPI dashboards, trend analysis, and executive reporting.  
- VS Code / Jupyter Notebook: analysis environment and documentation.

  [🔗 View Jupyter Notebook](https://github.com/fazmina27/hotel_bookings_analysis/blob/main/notebooks/01_EDA.ipynb)

---

## Key Outcomes  

- Identified primary revenue and cancellation drivers through quantitative evidence.  
- Delivered a pricing and channel strategy with clear ROI projections.  
- Demonstrated end-to-end capability — from SQL data modeling to Tableau storytelling.  

**Quantified Business Impact:**  
- +5–10% ADR growth through pricing optimization.  
- −15% cancellation-related revenue loss.  
- +15–20% total revenue growth potential across the hotel portfolio.  

---


## Next Steps  

To extend this project into a deeper business analytics case, the following enhancements are planned:

- **Predictive Cancellations:** Develop ML models to identify high-risk bookings and enable proactive retention strategies.  
- **Revenue Forecasting:** Implement time-series models to project revenue and optimize pricing and staffing.  
- **Customer Segmentation:** Cluster guests by booking behavior to drive targeted marketing and personalized offers.  



---

## Closing Note  

This project represents my consulting approach to analytics:  
- Ask meaningful business questions.  
- Validate every insight with data.  
- Deliver strategies that improve measurable KPIs.  


