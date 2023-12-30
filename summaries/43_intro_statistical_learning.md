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

* $\beta_1 = \frac{{\text{{Cov}}(X, Y)}}{{\text{{Var}}(X)}}$

* Unbiased estimate of $\beta$

* Big data OLS
	- beta = average of multiple betas

* s.e.(\beta) = sd(Y)/sd(X) if error is uncorrelated with common variance, which is estimated by residual standard error = sqrt(RSS/(n -2))
	- lower s.e. if range of X is more spread out

* R^2 = (TSS - RSS)/TSS

* F-test
	- all betas are 0. Alternative is that at least one beta is non-zero
		- $\frac{\frac{(TSS - RSS)}{p}}{\frac{RSS}{n - p - 1}}$
	
	- if q betas are 0, calculate RSS without q and with q.
	- F-test that takes out one variable is the same as t-test

* Assumptions
	* Homoscedastic
	* Corr. of error terms
	* Outlier: where y is far from predicted value 
	* High leverage point: far away from the density of the data (on X)






