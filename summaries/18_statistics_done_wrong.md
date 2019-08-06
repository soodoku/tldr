## Statistics Done Wrong

I am writing these notes w/ the purpose of making the points accessible to people who may not have done a ton of stats.

### Common Errors

1. **Sig. Testing**
    - What is it? 
        The p value is the probability, under the assumption that there is no true effect or no true difference, of collecting data that shows a difference equal to or more extreme than what you actually observed.
    
    - Caveats:
        - Doesn't capture importance of diff.
        - p = .05 not special. it is a convention. 
        - small p can be arrived at by:
            + measuring a large effect imprecisely
            + a small effect very precisely
        - p tracks sample size
        - Fisher thought of p-value as an informal assessment of how surprising the data are. Neyman and Pearson argued that people should specify a false positive rate that they are comfortable with and then sig. testing != judgment about 1 study but FP rate in the long run.
        - p = .032 doesn't mean 3.2% FP. FP is of a procedure not of a single experiment.
    
    - Confindence Interval
        + If we run 100 identical tests, CI will include true param 95% of the time.
        + Provide more info. than p values -> we know how much uncertainty
        + 

2. **Power**
    - Probability that we can successfully distinguish an effect of certain size from pure luck assuming a particular FP rate
    
    - Power is a function of
        + sample size
        + effect size
        + measurement error
        + FP rate

    - I don't have the power:
        + "In the prestigious journals Science and Nature, fewer than 3% of articles calculate statistical power before starting their study."
        
        + sample of studies published in prestigious medical journals between 1975 and 1990, more than four-fifths of randomized controlled trials that reported negative results didn’t collect enough data to detect a 25% difference in primary outcome between treatment groups. ...nearly two-thirds of the negative trials didn’t have the power to detect a 50% difference.
        
        + nearly two-thirds of the negative trials didn’t have the power to detect a 50% difference.
        
        + Each individual neuroscience study collects such little data that the median study only a 20% chance of being able to detect the effect it’s looking
        
        + 1960, Cohen: studies published in the Journal of Abnormal and Social Psychology8 [on average] had only a power of 0.48 for detecting medium-sized effects.
            * 1989 review showed that power had declined
    
    - Why Don't I have the power?
        + Math?
        + Multiple testing means something is significant. And if that is publishable, people don't care.

    - Consequences:
        + Stat. insig. doesn't mean much either.
        + Right turns on red
            * Because of oil crisis in 1973
            * study of 20 intersections. there were 308 accidents at the intersections; after, there were 337 in a similar length of time. But this difference was not statistically significant.
            * several studies found similar small increases but insig.
            * later studies showed: studies finally showed that among incidents involving right turns, collisions were occurring roughly 20% more frequently, 60% more pedestrians being run over, and twice as many bicyclists were being struck.
            
    - Potential Fixes: 
        - Perhaps power should be part of the IRB review. 
        - Use CI to see if measurement too imprecise to be useful
            + to place an upper bound
        - CI assurance --- how often should the CI beat the target width
            + Accuracy in Parameter Estimation (AiPE)

2. Multiple Testing

3.

### Consequences

1. People don't take scientists seriously.

2. Allow Drivers to Turn Right on Red:
    * Apparently low-powered studies and treating stat. non. sig. = no effect.

### Psych. and Stats

1. The first principle is that you must not fool yourself, and you are the easiest person to fool. --- Feynman

2. A bit of knowledge of stat. issues causes "I expect to see what Paul Graham calls “middlebrow dismissals” in response to any science news in the popular press. Rather than taking time to understand the interesting parts of scientific research, armchair statisticians snipe at news articles, using the vague description of the study regurgitated from **some overenthusiastic university press release** (GS: itself a problem in misinforming the public) to criticize the statistical design of the research."

### Why We Fail?

1. Low Quality Producers:
    * "A doctor who has taken one standard introductory statistics course would have sufficient knowledge to fully understand only about a fifth of research articles published in the New England Journal." Most doctors don't take even 1 course.
    * residents averag[e] less than 50% correct on tests of statistical methods commonly used. faculty at 75%


2. Low Quality Monitoring:
    * Few journals employ statisticians

3. 

### Fun Quotes

1. paul meehl on contributions of energetic but badly trained (motivated?) researchers to the body of knowledge: 

    "His true position is that of a potent-but-sterile intellectual rake, who leaves in his merry path a long train of ravished maidens but no viable scientific offspring."

2. As Bruce Thompson wrote, Statistical significance testing can involve a tautological logic in which tired researchers, having collected data on hundreds of subjects, then conduct a statistical test to evaluate whether there were a lot of subjects, which researchers already know, because they collected the data and know they are tired.

3. One journal editor noted that “p values are like mosquitoes” in that they “have an evolutionary niche somewhere and [unfortunately] no amount of scratching, swatting or spraying will dislodge them.”

