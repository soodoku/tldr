## Statistics Done Wrong

I am writing these notes w/ the purpose of making the points accessible to people who may not have done a ton of stats.

### Common Errors

1. **Sig. Testing**
    - What is it? 
        The p-value is the probability, under the assumption that there is no true effect or no true difference, of collecting data that shows a difference equal to or more extreme than what you actually observed.
    
    - Caveats:
        - Doesn't capture the importance of diff.
        - p = .05 not special. it is a convention. 
        - small p can be arrived at by:
            + measuring a large effect imprecisely
            + a small effect very precisely
        - p tracks sample size
        - Fisher thought of p-value as an informal assessment of how surprising the data are. Neyman and Pearson argued that people should specify a false positive rate that they are comfortable with and then sig. testing != judgment about 1 study but FP rate in the long run.
        - p = .032 doesn't mean 3.2% FP. FP is of a procedure not of a single experiment.
    
    - Confidence Interval
        + If we run 100 identical tests, CI will include true param 95% of the time.
        + Provide more info. than p values -> we know how much uncertainty
        + 

2. **Power**
    - The probability that we can successfully distinguish an effect of certain size from pure luck assuming a particular FP rate
    
    - Power is a function of
        + sample size
        + effect size
        + measurement error
        + FP rate

    - I don't have the power:
        + "In the prestigious journals Science and Nature, fewer than 3% of articles calculate statistical power before starting their study."
        
        + sample of studies published in prestigious medical journals between 1975 and 1990, more than four-fifths of randomized controlled trials that reported negative results didn’t collect enough data to detect a 25% difference in the primary outcome between treatment groups. ...nearly two-thirds of the negative trials didn’t have the power to detect a 50% difference.
        
        + nearly two-thirds of the negative trials didn’t have the power to detect a 50% difference.
        
        + Each neuroscience study collects such little data that the median study only a 20% chance of being able to detect the effect it’s looking
        
        + 1960, Cohen: studies published in the Journal of Abnormal and Social Psychology8 [on average] had only a power of 0.48 for detecting medium-sized effects.
            * 1989 review showed that power had declined
    
    - Why Don't I have the power?
        + Math?
        + Incentives: Smaller is cheaper. And multiple testing means something is significant. And if that is publishable, people don't care.

    - Consequences:
        + Stat. insig. doesn't mean much either.
    
        + When low power, stat. sig. mostly reflects luck. And you will always overest. effect size. So type M (magnitude) error -> **Winner's curse**

        + In fast-moving fields such as genetics, the earliest published results often the most extreme because journals are most interested in publishing new and exciting results. 

        + Right turns on red
            * Because of the oil crisis in 1973
            * study of 20 intersections. There were 308 accidents at the intersections; after, there were 337 in a similar length of time. But this difference was not statistically significant.
            * several studies found similar small increases but insig.
            * later studies showed: studies finally showed that among incidents involving right turns, collisions were occurring roughly 20% more frequently, 60% more pedestrians being run over, and twice as many bicyclists were being struck.
        
        + Kanazawa claimed the most beautiful parents have daughters 52% of the time, but the least attractive parents have daughters only 44% of the time. The fixed analysis found that his data showed attractive parents were indeed 4.7% more likely to have girls—but the confidence interval stretched from 13.3% more likely to 3.9% less likely.

    - Funny examples
        + If you take school level averages, it can be the case that the smallest schools are the worst and the best performing.
        + Counties w/ the lowest rate of kidney cancer are the smallest midwest counties. Smallest midwest counties also have the highest rate of kidney cancer.

    - Potential Fixes: 
        - Perhaps power should be part of the IRB review. 
        
        - Use CI to see if measurement too imprecise to be useful
            + to place an upper bound
        
        - CI assurance --- how often should the CI beat the target width
            + Accuracy in Parameter Estimation (AiPE)
        
        - The fraction of positive votes in a comment thread or a review has the same issues. perhaps sort comments by the bottom of the CI

2. Pseudoreplication
    - What is it? Collecting data on the same people (or from same circumstance---ala fish from the same aquarium, etc.) and treating it as iid.
        + another variant: want to know if the song in dialect A more attractive than in dialect B. but use only one song. generalizability is limited.
        + data collected from one lab., machine, day, etc. 

    - Fixes:
        + avg. per person
        + cluster s.e.

3. The p-value and the base rate fallacy

    - What is it? Say you try 100 anti-cancer meds of which only 10 actually work. You set p = .05. And say power = .8. So you detect 8 out of 10. You also get 5 false positives because of the p-value (this is not quite right but fine). Your success rate = 8/13. False discovery rate ~ 38%.
    
        - If the base rate is low, FP is a serious concern
    
        - p = .0001 != 1 in 10k chance that the result is a fluke. Nope. Depends on the base rate. p = chance of seeing a result as extreme as this if null is true. it doesn't tell us the chance that the medication works.
    
    - Consequences
        + where base rate is low, likely that most p < .05 are false
        + classic breast cancer example

    - Measurement error w/ more opportunities for FPs than FNs ala misinformation, self-reported use of guns in self-defense, etc.
        + Be better at measuring rare phenomenon. A lot more care is needed.
        + "The NCVS also tries to detect misremembered dates (a common problem) by interviewing the same respondents periodically. If the respondent reports being the victim of a crime within the last six months, but six months ago they reported the same crime a few months prior, the interviewer can remind them of the discrepancy."

4. Correction for Multiple Testing
    
    - What is it? 
        - FP increases. Chance of atleast one FP if sig. = .05 and you conduct n independent tests = 1 - (1 - .05)^n
    
    - How Common?
        + A survey of medical trials in the 1980s found that the average trial made 30 therapeutic comparisons.

    - Fixes
        - Bonferroni - If you conduct n tests, divide sig. by n. So .05/n
            + Assumes all null hypotheses are true
        - Benjamini-Hochberg:
            + get p-value of each test.
            + sort in ascending order with order denoted by i
            + choose fdr --- q
            + number of tests = m
            + find largest p s.t. p \le iq/m
                * think about basically i/m as what you are pro-rating by

5. Diff. b/w Sig. and Non sig. may not be sig.
    - What it is?
        - See Gelman..
        - Explanation: 
            - dichotomization creates pathologies. .05 is sig. and .06 is not. It doesn't mean that one is diff. from the other.
        - Say two drugs have the same effects. Say power is B for both. The chance we will discover one effect and not another = B (1 - B) + B (1 - B) (2 drugs so you do it twice)
    
    - How Common?:
        + Neuroscientists screw up 50% of the time

    - Fixes
        + Use C.I.

6. Double Dipping into Data
    
    - What is it? Use data to pick which col. to look (e.g., neurons that fire at more than some base rate when exposed to visual stimuli) at and then see whether things diff. on that col. 
        When selecting the first set, we get some FP and then we are checking if things look diff. on those col.

    - GS: Tibshirani/Hastie used to make a similar point in the context of CV: var. selection can't be done before CV. Var. selection is part of the method.
    
    - How Common? Roughly 40% of neuroimaging studies.

7. Regression to the Mean
    - What is it? Extreme values reflect some luck. People w/ the highest blood pressure may have had a stressful week or businesses w/ highest profit may have had a lucky quarter w/ an unusually big order. Next time you measure -> closer to avg. 
        + ft. Galton
    
    - Funny bit
        + Horace Secrist wrote triumph of mediocrity in business -> unusually successful become less successful and vice-versa. 
        + Hotelling in reply wrote you can argue exactly the opposite w/ data:
            * Start from a period before biz. became successful.

8. Overprecision
    - "Huff agrees that expressing the result as a mortality ratio is perfectly proper but states: It does have an unfortunate result: it makes it appear that we now know the actual mortality ratio of two kinds of groups right down to a decimal place." Huff's main point was about beta without CI and just p, which makes it hard to know but there is a Gelmanesque point.

9. Don't Eyeball CI to see if diff. is sig.
    - CI can overlap and still diff. can be stat sig.
    - If comparing to 0 or fixed, then CI overlap -> non stat sig.
    - If eyeballing, look for Gabriel C.I., etc.

10. Sig. Stopping:
    - What is it? Stop the trial when sig.
    - Consequences:
        + Avg. exaggeration in effects ~ 29% in medical trials stopped early.

11. Needless Categorization
    - Consequences:
        - If you separate 10--20 in 10--15 and 16--20, you are putting 10--15 beta on 15 and 16--20 beta on 16.
        - Categorization reduces power. In general loss of power/precision ~ throwing away 1/3 of the data
        - Reduces the ability to control for confounding variables

12. Generalization Error cannot be lower than measurement error

13. Simpson's Paradox:
    ft. Karl Pearson and Udny Yule. Stigler's law of eponymy (discovered by Merton).
    - What is it? Trend in data caused by a confounding variable can be eliminated by splitting data into 'natural' groups.
    - Famous e.g.: Berkeley grad.
        + 44% male applicants accepted while only 35% female applicants
        + split by grad. department, 4 of 101 departments showed stat. sig. bias and 6 showed bias against men
        + Men and women didn't apply to departments in same proportion and not all departments equally selective
            * women applied to departments where the number of qualified departments that applied was a lot but w/ little funding
    - Another example:
        + kidney stones --- success of percutaneous nephrolithotomy > open surgery
            * but caused by open surgery being used for harder surgeries

14. Irreproducible research + closed data
    
    - What is it?
        + Don't report on all outcomes
        + Not enough detail about how the measurement was done, choices made, etc. is released.
    
    - Fixes:
        + Automate
        + Make it easily reproducible
        + Release as much info. on instruments, etc., as possible.
        + Mandatory disclosure via clinicaltrials.gov etc. but there too compliance is low. 40% of protocols registered after the first data had been collected.
            * only 25% obey results of publishing results via ClinicalTrials.gov

### Consequences of Sloppy Stats. in Science

1. People don't take scientists seriously.

### Psych. and Stats

1. The first principle is that you must not fool yourself, and you are the easiest person to fool. --- Feynman

2. A bit of knowledge of stat. issues causes "I expect to see what Paul Graham calls “middlebrow dismissals” in response to any science news in the popular press. Rather than taking time to understand the interesting parts of scientific research, armchair statisticians snipe at news articles, using the vague description of the study regurgitated from **some overenthusiastic university press release** (GS: itself a problem in misinforming the public) to criticize the statistical design of the research."

3. Measurements of physical constants, such as the speed of light or subatomic particle properties, tend to cluster around previous measurements rather than finally accepted 'truth' -> search for errors till the accepted value

### Research Design Basics

    * What do I measure?
    * Which variables do I adjust for?
    * Which cases do I exclude?
    * How do I define groups?
    * What about missing data?
    * How much data should I collect?

### Why We Fail?

1. Low-Quality Producers:
    * "A doctor who has taken one standard introductory statistics course would have sufficient knowledge to fully understand only about a fifth of research articles published in the New England Journal." Most doctors don't take even 1 course.
    * residents averag[e] less than 50% correct on tests of statistical methods commonly used. faculty at 75%

2. Low-Quality Monitoring:
    * Few journals employ statisticians
    * Don't compare exp. to original protocols
    * Publishing standard don't involve reporting on all outcome variables

3. Bad Incentives
    * see #2
    * incentives to public sig., surprising results, etc.
    * journals don't mandate easy reproducibility, the release of all data, etc.

### General Fixes

1. Education
    * Peer education, etc.
    * More courses

2. Checklist before pub.
    - CONSORT Checklist

3. Forced disclosure, etc.
    - release code + data before pub. etc.

### Fun Quotes

1. paul meehl on contributions of energetic but badly trained (motivated?) researchers to the body of knowledge: 

    "His true position is that of a potent-but-sterile intellectual rake, who leaves in his merry path a long train of ravished maidens but no viable scientific offspring."

2. As Bruce Thompson wrote, Statistical significance testing can involve a tautological logic in which tired researchers, having collected data on hundreds of subjects, then conduct a statistical test to evaluate whether there were a lot of subjects, which researchers already know, because they collected the data and know they are tired.

3. One journal editor noted that “p values are like mosquitoes” in that they “have an evolutionary niche somewhere and [unfortunately] no amount of scratching, swatting or spraying will dislodge them.”
