ods noproctitle;
ods graphics / imagemap=on;

proc means data=WORK.IMPORT1 chartype min max n mode vardef=df;
	var gender SeniorCitizen Partner Dependents PhoneService MultipleLines 
		InternetService OnlineSecurity OnlineBackup DeviceProtection TechSupport 
		StreamingTV StreamingMovies Contract PaperlessBilling PaymentMethod Churn;
run;

proc means data=WORK.IMPORT1 chartype mean std min max n vardef=df;
	var tenure MonthlyCharges TotalCharges;
run;

PROC LOGISTIC DATA=work.import1 DESCENDING;
   MODEL churn=gender	SeniorCitizen	Partner	Dependents	tenure	PhoneService	MultipleLines	InternetService	OnlineSecurity	OnlineBackup	DeviceProtection	TechSupport	StreamingTV	StreamingMovies	Contract	PaperlessBilling	PaymentMethod	MonthlyCharges	TotalCharges
 / SELECTION=STEPWISE SLENTRY=0.1 SLSTAY=0.1; 
RUN;
