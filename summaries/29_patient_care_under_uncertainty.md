## Patient Care Under Uncertainty

### Three Kinds of Questions

* Normative Analysis
	- Ideal properties of decision making
* Descriptive Analysis
	- How decisions are made
* Prescriptive Analysis
	- "Improve" decision making
		- Assumes some normative criteria
		- Uses descriptive analysis to understand current practice
		- Diff.

### Identification Problems

* as sample size grows, the problems persist
* Unobservability of counterfactual treatment outcomes
* External Validity -- extrapolation
* Data Quality, e.g., surrogate outcomes, missing data, etc.

### Questions

* Clinical practice guidelines
* Sample size for trials
* Diagnostic testing and treatment under ambiguity
	* Should i collect more data?
	* Surveillance Vs. Aggresive Treatment
		* Localized cancer 
			- CT scans, ultrasound
			- Immunotherapy, etc.
				- Reduce the risk of disease dev./severity of disease 
				- Side effects, etc.


### Clinical practice guidelines (CPGs)

* CVD
	* Demographic
	* Labs
	* History	
	* Doesn't condition on obesity, exercise, etc.

* BCRA
	* BRCA mutation
	* Age
	* Race
	* 1st degree relatives w/ breast cancer, etc.
	* but doesn't condition on 2nd degree relatives, ethnic group, etc.

* strong financial/legal incentives to comply

#### Why CPG?

* Clinicians do not have rational expectations
		
		- Sarbin (1943, 1944)
		- Meehl (1954)
		- Goldberg (1968) -- model of you beats you
		- Paul Hoffman, simple models beat human judgment
		- Dawes et al. 1989: give equal weights to predictors. beats humans.
		- Dawes, Faust, and Meehl (Science, 1989)
			- already in the 1940s --- algorithms better than what doctors say
		- Gigerenzer

#### Why not to CPG?

* Guidelines disagree with one other
* Clinicians Observe more traits + more info. about patient pref.
* Methodological underpinnings are shot
* Doctors may be better
	* no experiment on CGG vs. discretion
	* compare point prediction than intervals
		- yes/no implies > .5 or < .5 so you could compare wider bounds

#### Methodological Underpinnings

* Extrapolation
	* No comorbidities
		* Specific symptoms for hypertension --- isolated syslotic but not diastolic 
	* Volunteers with constraints on age, geo., etc.
	* Get more attention during trials including more f2f + more tests
	* Blinding --- in clinical practice, both sides know they are getting this drug
		- sequential experimentation for hypertension drugs is common
		- ITT won't predict how clinicians and patients respond when both are aware
	* Surrogate outcome
		- Phase 3 trials ~ 2--3 years
		- oncology drugs (2009--2013)---improvements in quality of life but quantity of life clinical improvement not meaningful (Davis et al. 2017)
	* Side Effects
		* Multiple outcomes
			* Primary outcome is the primary determinant of patient welfare
			* Secondary outcomes don't differ much across conditions
		* Warfarin for AFib
			* Can cause serious bleeding
	* Has led to efficacy trials (ideal conditions), effectiveness trials (pragmatic)

* Hypothesis Testing
	* Generally Type 1 fixed at 5%, Type II at 10-20% 
	* Magnitude of losses

### Optimal Personalized Care

* Optimal Personalized Care
	- Maximize group mean welfare
	- Treat similar patients similarly


* decision rules: 
	- common sense: choose the option favored by the available evidence, even if only by a small margin. 
		-  one-sided test at 50%. 
	- hypothesis testing at 5% --- extreme loss aversion
	- minimax regret criteria --- minimizes the maximum regret
		- A = 5 years if mutation, 2 mo. w/o mutation
		- B = 4 mo. if mutation, 3 year w/o
		- A minimizes maximum regret

	- maximin regret --- worst (maximum) loss is better than the least (minimum) loss of all other option
		- A = 2 mo. --- 5 years, B = 4 mo. --- 3 years
		- Clinicial chooses B
	
	- A sufficiently strict test ensures that the probability of Type I errors (acceptance of bad innovations) is smaller than the ratio between the proponent’s cost of collecting the evidence (e.g., clinical trials) and the proponent’s benefit from the regulator’s acceptance. I show that hypothesis tests at this level are optimal for a regulator having maximin utility1 with ambiguity regarding the quality of potential proposals. 15%

	- DiMasi et al. (2003), who collected detailed confidential cost data from pharmaceutical firms for a sample of drugs first tested in 1983–1994. They report $119.2 million (in 2000 dollars) as the average scost of a Phase III clinical trial, including trials that did not lead to approval. The trial costs are spread over an average of 30.5 months and the estimate discounts the costs at 11% rate to the time of approval (estimated to be 18.2 months after the end of Phase III trials). The rate of 11% is the real cost of capital estimated by DiMasi et al. (2003) for the pharmaceutical industry during the study’s time period.

	- As a case study, we reconsider a trial comparing nodal observation and lymph node dissection when treating patients with cutaneous melanoma. Using a statistical power calculation, the investigators assigned 971 patients to dissection and 968 to observation. We conclude that assigning 244 patients to each option would yield findings that enable suitably near-optimal treatment choice. --- https://www.tandfonline.com/doi/full/10.1080/00031305.2018.1543617

	* Adaptive Minimax Regret
		- observationally similar patients 

	* If sign of the treatment effect is not identified?
		- No optimal way but reasonable ways
