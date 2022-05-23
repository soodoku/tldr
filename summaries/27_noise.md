### Noise

#### Types of Noise

* System noise = total error

* Occasion noise is the variability in judgments of the same case by the same person or group on different occasions.

* Level noise: some raters harder than others. 

* Pattern noise = idiosyncratic error (judge-case variation)

#### Judgy Professions

1. Doctors
2. Case workers
3. Judges
4. Underwriters
5. Patent examiners

#### Noisy Facts

1. More experienced patent examiners seem to grant patents at higher rates (about 10% higher). https://users.nber.org/~confer/2008/si2008/IPPI/lemley.pdf

2. Judges

    * "A study of cases that were randomly allotted to different judges found that one judge admitted 5% of applicants, while another admitted 88%." https://scholarship.law.georgetown.edu/cgi/viewcontent.cgi?article=2914&context=facpub

    * In 1977, for example, William Austin and Thomas Williams conducted a survey of forty-seven judges, asking them to respond to the same five cases, each involving low-level offenses. All the descriptions of the cases included summaries of the information used by judges in actual sentencing, such as the charge, the testimony, the previous record (if any), social background, and evidence relating to character. 

	5 cases: 38.3% guilty + 70.2% guilty + 87.2% guilty + (100% + 57.4%) guilty + 95.7% guilty ~> 74%
        https://scholarlycommons.law.northwestern.edu/cgi/viewcontent.cgi?article=6026&context=jclc

        sentencing varies more but harder to quantify the variation

    * Effect of sentencing commission: "According to another study, the expected difference in sentence length between judges was 17%, or 4.9 months, in 1986 and 1987. That number fell to 11%, or 3.9 months, between 1988 and 1993."

    * Judges more lenient on defendant's birthday ~ 1--3% in France. https://www.iast.fr/publications/clash-norms-judicial-leniency-defendant-birthdays (seems too big)
    
    * 16 hypothetical cases in which the defendant had been found guilty and was to be sentenced. The vignettes depicted either robberies or cases of fraud and differed on six other dimensions, including whether the defendant was a principal or an accomplice, prior criminal record, whether a weapon was used in the robbery, etc.

    Interviewed a national sample of 208 active federal judges. In the course of ninety minutes, the judges decided on 16 cases.
                
    For the average case, the mean sentence was 7.0 years, and the standard deviation around that mean was 3.4 years.

    Since mean absolute diff. = 1.13 SD if distribution is normal, mean absolute diff = 3.8 years.

    Level noise (some judges harsher than others): The standard deviation of the values in the rightmost column was 2.4 years.

    * Solution
        - Marvin Frankel and sentencing commission. sc overturned.

3. Underwriters + Claims adjusters
    * To prepare for the noise audit, executives of the company constructed detailed descriptions of five representative cases for each group (underwriters and adjusters). Employees were asked to evaluate two or three cases each, working independently. They were not told that the purpose of the study was to examine the variability of their judgments.
    * Most executives of the insurance company guessed 10%
    * Our noise audit found much greater differences. By our measure, the median difference in underwriting was 55%, about five times as large
    * For claims adjusters, the median ratio was 43%. We stress that these results are medians: in half the pairs of cases, the difference between the two judgments was even larger. 

4. Investors: They asked **forty-two** experienced investors in the firm to estimate the fair value of a stock (the price at which the investors would be indifferent to buying or selling). The investors based their analysis on a one-page description of the business; the data included simplified profit and loss, balance sheet, and cash flow statements for the past three years and projections for the next two. Median noise, measured in the same way as in the insurance company, was 41%.

5. Wine "experts": "When wine experts at a major US wine competition tasted the same wines twice, they scored only 18% of the wines identically" https://www.sjakes.com/wp-content/uploads/2009/07/Robert-Hodgson-Tasting-Unconsistent.pdf

6. cor(predictions based on hiring ratings, performance ratings) = .15 
    - when hiring ratings were given to 'doctoral-level psychologists'. linearly regressing perf. ratings on hiring ratings gives .32 
    - selecting on the dependent variable 

7. Medicine
    * "An early study found that 31% of the time, physicians evaluating angiograms disagreed on whether a major vessel was more than 70% blocked"
    * https://www.ahajournals.org/doi/pdf/10.1161/01.CIR.53.4.627
    * but see also: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2569075/

### Reasons for 'noise'

1. Decision fatigue -> bias
    
    * book: "toward the end of the day, physicians are more likely to prescribe antibiotics and less likely to prescribe flu shots"
        paper 1: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4648561/

    * "In a large sample, the order rates of breast and colon screening tests were highest at 8 a.m., at 63.7%. They decreased throughout the morning to 48.7% at 11 a.m. They increased to 56.2% at noon—and then decreased to 47.8% at 5 p.m."

2. Hunger/Low blood glucose levels/etc.:
    "Our data consist of 1,112 judicial rulings, collected over 50 d in a 10-mo period, by **eight Jewish-Israeli judges** (two females) who preside over two different parole boards that serve four major prisons in Israel." https://www.pnas.org/doi/10.1073/pnas.1018033108#fig01
        see also: http://journal.sjdm.org/16/16823/jdm16823.html

3. Internal local smoothing
    "the chance that an asylum applicant will be admitted in the United States drops by 19% if the hearing follows two successful ones by the same judge."
        - need to find the paper

4. Social influence. Salganik, Macy, Muchnik, etc. 
    * Muchnik
        - "After seeing an initial up vote (and recall that it was entirely artificial), the next viewer became 32% more likely to give an up vote."
        - "After five months, a single positive initial vote artificially increased the mean rating of comments by 25%."
    * why is it conceptually problematic?
        - Responding to the first like generally means responding to too little data. 
        - Interesting thing = what is the perceived value of planting a like w/o watching the content? on twitter, like may mean cueing group love but on YT, not clear. The harm is that YT will recommend videos based on the like.
    
5. Anchoring
    * In a typical demonstration, you might be presented with a number of items whose price is not easy to guess, such as an unfamiliar bottle of wine. You are asked to jot down the last two digits of your Social Security number and indicate whether you would that amount for the bottle. Finally, you are asked to state the maximum amount you would be willing to pay for it. The results show that anchoring on your Social Security number will affect your final buying price. 
        - paper: https://academic.oup.com/qje/article-abstract/118/1/73/1917051?redirectedFrom=PDF

6. Other Cognitive biases
    * Order of information may matter as we form initial judgments quickly
        - The first "like" should not matter as it could happen by chance depending on who came before
    * Confirmation bias
    * Affect heuristic
        - The psychologist Paul Slovic terms this the affect heuristic: people determine what they think by consulting their feelings.
    * Not accounting for 'regression to the mean'

### Solutions

1. The crowd within: what percentage of the world’s airports are in the United States? "Vul and Pashler’s hypothesis was that the average of the two answers would be more accurate than either of the answers on its own. The data proved them right. In general, the first guess was closer to the truth than the second, but the best estimate came from averaging the two guesses." 
    paper: https://journals.sagepub.com/doi/10.1111/j.1467-9280.2008.02136.x

2. Wisdom of the crowds. 
    Galton
    Vul and Pashler: “You can gain about 1/10th as much from asking yourself the same question twice as you can from getting a second opinion from someone else.”

3. Use Superforecasters

4. Model:
    * A 2000 review of 136 studies confirmed unambiguously that mechanical aggregation outperforms clinical judgment.
    * Paul Hoffman, simple models beat human judgment
    * Goldberg: model of you beats you
        - need to look at the papers
    * Yu and kuncel
       - random linear model beats people <- with probably sig. constraints on 'random'  
    * Dawes: give equal weights to predictors. beats humans.
    * **Nice point by Dawes: “we do not need models more precise than our measurements.”**
    * Mullainathan et al.
        - Mullainathan’s team calculated, crime rates could be reduced by up to 24%, because the people behind bars would be the ones most likely to recidivate. Conversely, if the risk threshold is set to reduce the number of people denied bail as much as possible without increasing crime, the researchers calculated that the number of people detained could be reduced by up to 42%.

5. Rankings > Ratings
    - People can do ratios well also. 
        "S. S. Stevens discovered the surprising fact that people share strong intuitions about the ratios of intensity of many subjective experiences and attitudes. They can adjust a light so that it appears “twice as bright” as another, and they agree the emotional significance of a ten-month prison sentence is not nearly ten times as bad as that of a sentence of one month." etc.

6. Break decisions into constituent portions evaluated separately. Come up with weights upfront.

7. Train people. Gigerenzer/Boosting--- teach people statistical literacy

8. Statistical Prediction Than Clinical
    - pattern matching. we forget to use base rates.

9. Using simple scoresheets like BI-RADS

### Callouts

1. book: "when the same software developers were asked on two separate days to estimate the completion time for the same task, the hours they projected differed by 71%, on average."
    paper: "In this paper, we report from an experiment where **seven** experienced software professionals estimated the same sixty software development tasks over a period of three months. Six of the sixty tasks were estimated twice. We found a high degree of inconsistency in the software professionals’ effort estimates. The mean difference of the effort estimates of the same task by the same estimator was as much as 71%. The correlation between the corresponding estimates was 0.7." https://www.sciencedirect.com/science/article/abs/pii/S0164121207000714

2. The word 'noise' is used inconsistently in the book. 
   In the equation they write: Overall Error (MSE) = Bias2 + Noise2
   But in many places, by noise, authors just mean the MSE.

3. Effect of mood on decision making
    * good mood causes greater use of stereotypes
        paper: https://philosophy.rutgers.edu/docman-lister/adobe-pdf-documents/195-limateforgas-she-just-doesnt-look-like-a-philosopher-affective-influences-on-the-halo-effect-2011/file

    * good mood causes greater receptivity to bullshit

4. "When calories are on the left, consumers receive that information first and evidently think “a lot of calories!” or “not so many calories!” before they see the item. Their initial positive or negative reaction greatly affects their choices. By contrast, when people see the food item first, they apparently think “delicious!” or “not so great!” before they see the calorie label. Here again, their initial reaction greatly affects their choices. This hypothesis is supported by the authors’ finding that for Hebrew speakers, who read right to left, the calorie label has a significantly larger impact.."
    paper: https://psyarxiv.com/23asd/ "We show that if the effect sizes in Dallas et al. (2019) are representative of the populations, a replication of the six studies (with the same sample sizes) has a probability of only 0.014 of producing uniformly significant outcomes."

5. When people disagree on made-up cases, you can imagine that in the real world people get opportunity to get additional data that allows them to narrow their disagreements. 

6. chapter 25 cites three things and one of them is (no data here): https://sloanreview.mit.edu/article/a-structured-approach-to-strategic-decisions/ 
the second one is https://www.jstor.org/stable/255641 (it analyzes data at a group level and there are 60 groups and 3 treatment conditions.) The third citation is to an entire book ('Fear of judging...'). Citations to think pieces in Harvard Business Review (10 citations in total based on a keyword search) and books like 'Work Rules!' dot other chapters.

7. cor(predictions based on hiring ratings, performance ratings) = .15 
    - selecting on the dependent variable here so probably one reason why cor is low here.

8.  Hunger/Low blood glucose levels/etc.:
    "Our data consist of 1,112 judicial rulings, collected over 50 d in a 10-mo period, by **eight Jewish-Israeli judges** (two females) who preside over two different parole boards that serve four major prisons in Israel." https://www.pnas.org/doi/10.1073/pnas.1018033108#fig01
        see also: http://journal.sjdm.org/16/16823/jdm16823.html

### Why does 'noise' go unnoticed in the insurance company?

1. Motivated reasoning: 
    * others are looking to agree and storytell why the number we see makes sense
    * False-consensus effect---we believe others will agree so we don't actively solicit opinions from others
2. Principal agent problem --- managers don't really care
3. Managers are busy. Don't read carefully.
4. Managers 'anchor' their estimate on the number they read.
5. Customers don't complain. They probably get a single quote per company and attribute cross-company variation as 'X company is better'. 

### Fun Facts

* In 2015, Deloitte calculated that it was spending 2 million hours each year evaluating its sixty-five thousand people.
