## Trustworthy Online Controlled Experiments

### Why experiments?

* Microsoft shared that a third of their experiments moved key metrics positively, a third moved negatively, and a third didn’t have significant impact. Linkedin had similar number.

* Some wins where change was introduced via experiments
	- Microsoft's Bing color tweaks similarly showed that users were more successful at completing tasks, their time-to-success improved, and monetization improved to the tune of over $10M annually in the United States (Kohavi et al. 2014, Kohavi and Thomke 2017).
	
	- In 2004, Amazon placed a credit-card offer on the home page. It was highly profitable but had a very low click-through rate (CTR). The team ran an experiment to move the offer to the shopping cart page that the user sees after adding an item, showing simple math highlighting the savings ...
	
	- Speed
		+ each 10 millisecond performance improvement (1/30th of the speed of an eye blink) pays for the fully loaded annual cost of an engineer (Kohavi et al. 2013). "A 2012 detailed study at Bing (Kohavi et al.2013) showed that every 100 msec speedup improves revenue by 0.6%."
		
		+ The team at Bing conducted a follow-on study and key user metrics still improve significantly. While the relative impact on revenue was somewhat reduced, Bing’s revenue improved so much during the time that each millisecond in improved performance was worth more than in the past; every four milliseconds of improvement funded an engineer for a year!
		
		+ "In 2017, every tenth of a second improvement for Bing was worth $18 million in incremental annual revenue"
		
		+ At Amazon, a 100-millisecond slowdown experiment decreased sales by 1% (Linden 2006b, 10).

	- Amz: "searched for X bought item Y. -> this change increased Amazon’s overall revenue by 3% – hundreds of millions of dollars."

### How Long to Run An Experiment?

* **Bias toward active users**
	- smaller the measurement window -> greater the bias

* **Smaller the measurement window -> greater the chance of idiosyncratic day of the week effect, etc.**
	- e.g., measurement window coincided with a festival in India -> atypical people to come to the website
	- gift cards by holiday season

* **Equilibrium**
	- **Novelty effect:** New thing may cause clicks. Post discovery -> no clicks
		+ "The investigation showed that users were confused that Outlook.com did not open and clicked the link multiple times."
		+ "Phone ad with fake hair, hoping you'll swipe it off and click-through by mistake"
	- **Discovery/Adoption** may take time

### What to measure?

* Ways of thinking about metrics
	- LinkedIn categorizes metrics into three tiers: 1) Companywide 2) Product Specific 3) Feature Specific (Xu et al. 2015). 

	- Microsoft groups metrics into 1) Data quality 2) Overall Evaluation Criteria (OEC) 3) Guardrail 4) Local features/diagnostic

	- Business vs. operational metrics: Business metrics, such as revenue- per-user or daily active user (DAU), track the health of the business. Operational metrics, such as queries per second, track whether there are operational concerns.

	- Goal and driver metrics: 
		+ Goal metrics: Longer-term, e.g., long-term profits
		+ Driver metrics, also called sign post metrics, surrogate metrics, indirect or predictive metrics, tend to be shorter-term, faster-moving, and more-sensitive metrics than goal metrics. Driver metrics reflect a mental causal model of what it takes for the organization to succeed, that is, hypotheses on the drivers of success rather than just what success looks like.
			* The HEART framework (Happiness, Engagement, Adoption, Retention, and Task Success) (Rodden, Hutchinson and Fu 2010), Dave McClure’s PIRATE framework (AARRR! Acquisition, Activation, Retention, Referral, Revenue) (McClure 2007), or user funnels in general.
			* Netflix using bucketized watch hours as driver metrics because they are interpretable and indicative of long-term user retention (Xie and Aurisset 2016).

	- Can be computed at scale vs. metric of interest
		+ e.g., user-reported satisfaction. Validate. 
		
* Caveats
	* When measuring short-term, optimizing for the wrong thing is easy 
		- More ads -> more revenue in the short-term but fewer visits in the longer term			
			+ Ad experiments: Revenue per user should not be used as an OEC for search and ad experiments without adding other constraints.
			+ A common constraint is to restrict the average number of pixels that ads can use over multiple queries. Increasing revenue per search given this constraint is a constraint optimization problem
		- More marketing emails -> more revenue. But measure unsubscribes or open rate going down as people ignore.
			+ When Bing had a ranker bug that resulted in very poor results being shown to users in a Treatment, two key organizational metrics improved significantly: distinct queries per user went up over 10%, and revenue-per-user went up over 30%.		
	
	* Consider quality when defining goal or driver metrics. A click on a search result is a “bad” click if the user clicks the back button right away;

	* "Did we do the experiment correctly?" metrics
		- Sample mismatch ratio, etc.

	* Operational metrics
		- Backend latency, page size (network latency), errors, client crashes, etc. 

	* Diagnostic metrics (for problems with treatment, etc.)
		- Het. treat by segments
			+ Split by language (translation issues)
			+ Technical issues: split by browser, desktop/mobile, OS, average network latency, etc.

### How to measure

* Technical issues
	- Click tracking is typically done using web beacons (typically a 1x1 GIF sent to the server to signal a click), which is known to be lossy (i.e., not 100% of clicks are properly recorded). This is not normally an issue, as the loss is similar for all variants, but sometimes the Treatment can impact the loss rate, making low-activity users (e.g., those who only had a single click) appear at a different rate and cause an SRM. When the web beacon is placed in a different area of the page, timing differences will skew the instrumentation.

	- Never subtract client and server times, as they could be significantly off even after adjusting for time zones.
	
	- Server side logging more reliable than client side
	
* Skew
	- With ads revenue, it is common for a few outliers to have a disproportionally high influence on revenue, like clicks with very high cost-per-click. Solution ~ Winsorize. 
	
	- For example, assume a single very large outlier o in the data. When computing the t-statistics (see Equation 19.6): (19.6) the outlier will fall into one of the two variants and the delta of the means will be close to o/n (or its negation), as all the other numbers will be swamped by this outlier. The variance of the mean for that variant will also be close to , so the T value will be close to 1 or close to −1, which maps to a p-value of about 0.32.

* Variance
	* Pick a similar metric with lower variance. For example, the number of searches has a higher variance than the number of searchers;

### People Get It Wrong All The Time (+ What to keep in mind when working with people from other functions, etc.)

* "due to ease of implementation, the e-mails were first sent to Control users and then to Treatment users"
* "engaged users were classified as bots and removed from analysis."

### Caveats When Running Experiments

* Interference
	- "Say that your first version of the news recommender is a rules-based system that uses signals like how many people in your network have seen the news, how many people in total have read the news, the freshness of the news, etc., and sums up the signals in an arbitrary way to rank news items. Your second version uses the same signals but uses a supervised model to decide on the optimal weights."
		+ http://gojiberries.io/2019/04/01/a-b-testing-recommendation-systems/
		
	- Shared resources can cause interference. If the treatment leaks memory ...
	
* Triggering based on attributes that are changing over time
	- assume you run an e-mail campaign that triggers for users who have been inactive for three months. If the campaign is effective, those users become active and ...
				
* Solutions for technical issues
	- Run A/A tests

### Randomization Unit

* Websites have the following natural granularities: 
	- Page-level: Each new web page viewed on a site is considered a unit. 
	- Session-level: This unit is the group of webpages viewed on a single visit. A session, or visit, is typically defined to end after 30 minutes of inactivity.
	- User-level: All events from a single user is the unit. 

* When deciding, think about two things 
	- How important is the consistency of the user experience?
		+ As an extreme example, imagine that the experiment is on font color. If we use a fine granularity, such as page-level, then the font color could change with every page.
		+ Another example is an experiment that introduces a new feature; the feature may appear and disappear if the randomization is at the page-level or the session-level. These are potentially bad and inconsistent user experiences that can impact key metrics.
	- Which metrics matter?

* User level randomization
	- Note that a user is typically an approximation of a real user with web cookies or login IDs typically used. Cookies can be erased, or in-private/incognito browser sessions used, leading to overcounting of users. For login IDs, shared accounts can lead to undercounting, whereas multiple accounts (e.g., users may have multiple IDs) can lead to same user experiencing different treatments.

	- It is common for a user to access the same site via multiple devices and platforms, for example, desktop, mobile app, and mobile web. This can have two implications. 1. Different IDs may be available on different devices. As a result, the same user may be randomized into different variants on different

* Triggered Randomization can be more efficient

	* If you make a change to checkout, only trigger users who started checkout. If you make a change to collaboration, such as co-editing a document in Microsoft Word or Google Docs: only trigger when people start collaboration.
	
	*  Why?

		+ Bernoulli trial with p = 0.05. The standard deviation, σ. σ2 = 0.05(1 − 0.05) = 0.0475. You need at least: 16∗0.0475/(0.05⋅0.05)2 = 121,600 users.
		+ Assume that 10% of users initiate checkout, so that given the 5% purchase rate, half of them complete checkout, or p = 0.5. The variance σ2= 0.5(1 − 0.5)= 0.25. You therefore need at least ~ 6400 users

### Interpreting Results

* Simpson
	- Table 3.1 shows a simple example, where a website has 1 million visitors per day on two days: Friday and Saturday. On Friday, the experiment runs with 1% of traffic assigned to the Treatment. On Saturday that percentage is raised to 50%. Even though the Treatment has a conversion rate that is better on Friday (2.30% vs. 2.02%) and a conversion rate that is better on Saturday (1.2% vs. 1.00%),

### Wisdom

* Twyman’s law, perhaps the most important single law in the whole of data analysis… The more unusual or interesting the data, the more likely they are to have been the result of an error of one kind or another 

### Engineering System for Experiments

* Abstraction (Third is most common.)
	
	- The first architecture creates a code fork based on variant assignment: variant = getVariant(userId) If (variant == Treatment) then buttonColor = red Else buttonColor = blue 
	
	- The second architecture moves to a parameterized system, where any possible change that you want to test in an experiment must be controlled by an experiment parameter. You can either choose to continue to use code forks:
		```variant = getVariant(userId) If (variant == Treatment) then buttonColor = variant.getParam(“buttonColor”) Else buttonColor = blue 
		Or move to: 

		variant = getVariant(userId) … 
		buttonColor = variant.getParam(“buttonColor”)
		```

	- The third architecture removes even the getVariant() call. Instead, early in the flow, variant assignment is done, and a configuration with the variant and all parameter values for that variant and for that user are passed down through the remaining flow. 
	
	```
	buttonColor = config.getParam(“buttonColor”)
	```

* Two types of designs to abstract out experimentation systems
	- In a nested design, system parameters are partitioned into layers so that experiments that in combination may produce a poor user experience must be in the same layer and be prevented by design from running for the same user. For example, there might be one layer for the common UI elements (e.g., the header of the page and all information in the header), another layer for the body, a third layer for back-end systems, a fourth layer for ranking parameters, and so on.
	
	- A constraints-based design has experimenters specify the constraints and the system uses a graph-coloring algorithm to ensure that no two experiments that share a concern are exposed to the user.
	- Automated systems for detecting interactions

* Releasing on thin/thick client
	+ web server: 
	+ app
		* users have to update
		
		* More fine-grained parameterization can be used extensively to add flexibility in creating new variants without needing a client release. This is because even though new code cannot be pushed to the client easily, new configurations can be passed, which effectively creates a new variant if the client understands how to parse the configurations. For

		* To truly run a randomized controlled experiment on the new app as a whole, bundle both versions behind the same app and start some users -> app size
		
		* data cannot be uploaded whenever (wi-fi, battery)
		
		* When users open an app, their device could be offline. For consistency reasons, we should cache experiment assignment in case the next open occurs when the device is offline.
