## Introduction to Statistical Learning

### Ch. 1. History

* 1800s --- Linear Reg. by Legendre and Gauss
* 1936  --- LDA by Fisher
* 1940s --- Logistic Regression by Berskon, Wilson and Worcester, see also Cox and Theil
* 1970s --- GLM by Nedler/Wedderburn
* 1980s --- CART by Breiman, Friedman, Olshen, Stone
* 1986  --- GAMs by Hastie and Tibshirani

### Ch. 2. Stat. Learning Basics.

Assume the data generation process =
$Y = f(X) + e$

Stat. Learning problem is to approximate f(X)
$\hat{Y} = \hat{f}(X)$

e = irreducible error
reducible error = $\hat{f}(X)$ -> f(X)

$E(Y - \hat{Y})^2 = (f(X) - \hat{f}(X))^2 + Var(\epsilon)$

#### Parametric models use two steps:

1. specify the functional form ~ liner, etc.
2. estimate the params. that 'best' fit the data

### Binary

* Bayes error --- same as irreducible error

#### Bias variance trade-off

* Ideally we want to optimize on some metric on the test data but if the test data are not available, reducing train MSE is not optimal as you can end up memorizing as much of train as df will allow you
	* U-shaped curve on the test data is common

* Test-MSE = 
	$E(y - \hat{f}(x))^2 = \text{Var}(\hat{f}(x)) + \text{Bias}(\hat{f}(x))^2 + \text{Var}(e)$
	* need low bias and low variance to reduce test mse
	* Variance = how much would \hat{f} change if it were learned on a different dataset
		$\text{Variance} = \frac{1}{n} \sum_{i=1}^{n} (\text{np.mean}(y_{\text{pred}}) - y_{\text{test},i})^2$
	* Var(e) = irreducible error
	* Bias = 
		$\text{Bias} = \frac{1}{n} \sum_{i=1}^{n} (y_{\text{test},i} - \text{np.mean}(y_{\text{pred}}))^2$

### Linear Regression

* $\beta_1 = \frac{{\text{Cov}(X, Y)}}{{\text{Var}(X)}}$

* Unbiased estimate of $\beta$

* Big data OLS
	- beta = average of multiple betas

* s.e.(\beta) = sd(Y)/sd(X) if error is uncorrelated with common variance, which is estimated by residual standard error = sqrt(RSS/(n -2))
	- lower s.e. if range of X is more spread out

* $R^2 = \frac{(TSS - RSS)}{TSS}$

* F-test
	- all betas are 0. Alternative is that at least one beta is non-zero
		- $\frac{\frac{(TSS - RSS)}{p}}{\frac{RSS}{n - p - 1}}$
	
	- if q betas are 0, calculate RSS without q and with q.
	- F-test that takes out one variable is the same as t-test

* Assumptions
	* Homoscedastic errors
	* Corr. of error terms

* Leverage
	* High leverage point: far away from the density of the data (on X)
		$h_i = \frac{1}{n} + \frac{(x_i - \bar{x})^2}{\Sum_k (x_k - \bar{x})^2}$
		* Leverage is really **potential** leverage. If a leverage point sits on the predicted regression line, it won't change the coef. However, a leverage point will inflate the strength of the regression relationship by both the statistical significance (reducing the p-value to increase the chance of a significant relationship) and the practical significance (increasing r-square).
	
	* Leverage statistic is between 1/n and 1. Average is (p + 1)/n. If you are far from that, high leverage.

	* Influence is when a point has a large impact on coef.

		* ${\widehat {\boldsymbol {\beta }}}-{\widehat {\boldsymbol {\beta }}}^{(-i)}={\frac {(\mathbf {X} ^{\top }\mathbf {X} )^{-1}{\boldsymbol {x}}_{i}{\widehat {e}}_{i}}{1-h_{ii}}}$

		* Self-influence. How much does yhat for i change when you add the ith point.
			$h_{ii}= \frac {\partial {\widehat {y\,}}_{i}}{\partial y_{i}}$.

		* Cook's distance

			$D_{i}={\frac {\sum _{j=1}^{n}\left({\widehat {y\,}}_{j}-{\widehat {y\,}}_{j(i)}\right)^{2}}{ps^{2}}}$
			
			where p is the rank of the model and ${\widehat {y\,}}_{j(i)}$ is the fitted response value obtained when excluding i $s^{2}={\frac {\mathbf {e} ^{\top }\mathbf {e} }{n-p}}$ is the mean squared error of the regression model

	* See also https://online.stat.psu.edu/stat462/node/171/

* Collinearity
	* Corr. matrix
	* Multicollinearity -> VIF
		* ratio of variance of beta hat when fitting the full model divided by variance of beta hat if fit on its own.
		* Where $R_{j}$  of X_j on all other predictors $\frac {1}{1-R_{j}^{2}}$

### Linear Discriminant Analysis


### Resampling

* LOOCV
	* Simple formula for OLS
		* $\text{LOOCV}_{\text{MSE}} = \frac{1}{n} \sum_{i=1}^{n} \left( \frac{y_i - \hat{y}_i}{1 - h_i} \right)^2$
	* Variance of LOOCV > Variance of k-fold if k < n. k-fold also more accurate generally.

### Regularization

* Ridge 
	* can produce more accurate estimates than OLS because of bias-variance
		* See more at pg. 218/Ch. 6/Figure 6.5
	* Alternate ways of thinking
		* constrained optimization problem with sum of beta square less than s
		* Bayesian interpretation

### PCR and PLS

### Non-Linear

* Splines
	* Piecewise fitting of polymonial splines but with constraints that at the knots the 1st and 2nd derivative are continuous

* Regression splines

* Smoothing splines
	* Knot at each point
	* Penalty for the second derivative
	* Use LOOCV for picking the right lambda

* Local Regression
	* Decide on neighborhood and weights
	* Fit the regression

* Generalized Additive Models


