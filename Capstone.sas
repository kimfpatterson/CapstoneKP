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

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.IMPORT1;
	vbar Churn / group=SeniorCitizen groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.IMPORT1;
	vbar Churn / group=gender groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;

PROC LOGISTIC DATA=work.import1 DESCENDING;
   MODEL churn= gender SeniorCitizen Partner Dependents tenure PhoneService MultipleLines InternetService OnlineSecurity OnlineBackup DeviceProtection TechSupport StreamingTV StreamingMovies Contract PaperlessBilling PaymentMethod MonthlyCharges TotalCharges
 / SELECTION=STEPWISE SLENTRY=0.1 SLSTAY=0.1; 
RUN;
