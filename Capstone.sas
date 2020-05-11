PROC LOGISTIC DATA=work.import1 DESCENDING;
   MODEL churn=gender	SeniorCitizen	Partner	Dependents	tenure	PhoneService	MultipleLines	InternetService	OnlineSecurity	OnlineBackup	DeviceProtection	TechSupport	StreamingTV	StreamingMovies	Contract	PaperlessBilling	PaymentMethod	MonthlyCharges	TotalCharges
 / SELECTION=STEPWISE SLENTRY=0.1 SLSTAY=0.1; 
RUN;
