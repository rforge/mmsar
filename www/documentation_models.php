<?php include('header.php'); ?> 
	<title>mmSAR - Documentation - Home</title>
</head>

<body id="top">

<?php include('head.php'); ?> 
<?php include('nav.php'); ?> 

<div id="content-wrapper">
	<div class="center-wrapper">
		
		<div class="content" id="content-two-columns">

			<div id="main-wrapper">
				<div id="main">

					<div class="post">

						<div class="post-title"><h1>Models</h1></div>

<br/>
						<div class="post-body">
<p align="center"><img src="doc_models.png" alt="" class="bordered" /></p>
<br/>


<p class="large">Currently, mmSAR handles 8 non linear SAR models such as the power SAR model and others :<br/>
<table class="data-table">
	<tr>
		<th>Name</td>
		<th>Formula</td>
		<th>Parameters</td>
		<th>Shape</td>
		<th>Asymptotic</td>
	</tr>
	<tr>
		<td>power</td>
		<td>S = cA<SUP>z</SUP></td>
		<td>2</td>
		<td>convex</td>
		<td>no</td>
	</tr>
	<tr>
		<td>exponential</td>
		<td>S = c + zlog(A)</td>
		<td>2</td>
		<td>convex</td>
		<td>no</td>
	</tr>
	<tr>
		<td>negative
			exponential</td>
		<td>S = c(1 -
			exp(-zA))</td>
		<td>2</td>
		<td>convex</td>
		<td>yes</td>
	</tr>
	<tr>
		<td>Monod</td>
		<td>S = (cA) / (z + A)</td>
		<td>2</td>
		<td>convex</td>
		<td>yes</td>
	</tr>
	<tr>
		<td>rational
			function</td>
		<td>S = (c + zA) / (1 + fA)</td>
		<td>3</td>
		<td>convex</td>
		<td>yes</td>
	</tr>
	<tr>
		<td>logistic</td>
		<td>S = c / (1 + exp(-zA+f)</td>
		<td>3</td>
		<td>sigmoid</td>
		<td>yes</td>
	</tr>
	<tr>
		<td>Lomolino</td>
		<td>S = c / 1 + (z<SUP>log(f/A)</SUP>)</td>
		<td>3</td>
		<td>sigmoid</td>
		<td>yes</td>
	</tr>
	<tr>
		<td>cumulative
			Weibull</td>
		<td>S = c(1 - exp(-zA<SUP>f</SUP>))
			
			</td>
		<td>3</td>
		<td>sigmoid</td>
		<td>yes</td>
	</tr>
</table>
</p>


							<p class="large">mmSAR handles SAR models as list-objects. A model is a list of 8 elements (examples ar given for the exponential model) :<br/>
<br/>
<ul>
	<li><b>$name</b> : a character string specifying the name of the model (ex: "expo")</li><br/>
	<li><b>$formula </b>: an R expression with named parameters (ex: expression(s == z * log(a) + c) )</li><br/>
	<li><b>$paramnumber</b> : a numeric specifying the numbers of parameters in the function (ex: 2)</li><br/>
	<li><b>$paramnames</b> : a vector of character string of length $paramnumber specifying the parameters names, as in $formula (ex: c("c","z") )</li><br/>
	<li><b>$parLim </b>: a vector of character string of length $paramnumber specifying the parameters limits from 'R' for (-&#8734;;+&#8734;), 'Rplus' for [0;+&#8734;) or 'unif' for [0;1] (ex: c("R","Rplus")) </li><br/>
	<li><b>$fun</b> : an R function corresponding to the model function (ex : function(par,data){if(length(data)>1) d=data[[1]] else d=data; s = par[2] * log(d) + par[1]; names(s)=c("s.expo"); as.vector(s)} )</li><br/>
	<li><b>$rssfun </b>    : an R function corresponding to the model Residual Sum of Squares function (ex : function(par,data,opt){if(opt)par=backLink(par,expo$parLim) ; sum(   (data[[2]] - (par[2] * log(data[[1]]) + par[1]) ) ^2     ) } )</li><br/>
	<li><b>$init </b>      : an R function corresponding to an initial values calculation for the fitting algorithm, this is a model specific function as $fun and $rssfun (ex: function(data){semilog.data = data.frame(log(data[[1]]),data[[2]]) ; names(semilog.data)=c("a","s") ; par=lm(s~a,semilog.data)$coefficients ; names(par)=c("c","z") ; par } )</li><br/>
</ul>
</p>
							
			<p class="large">To load a model, for example the exponential model use :</p>
			<div class="success">load(expo)</div>			
						</div>
						
					</div>

				</div>
			</div>

			<div id="sidebar-wrapper">
				<div id="sidebar">

					<?php include('doc_nav.php'); ?>
					<!--<div class="box">

						<div class="box-title">Screenshots</div>

						<div class="box-content">

							<div class="thumbnails">
								
								<a href="#" class="thumb"><img src="sample-thumbnail.jpg" width="64" height="64" alt="" /></a>
								<a href="#" class="thumb"><img src="sample-thumbnail.jpg" width="64" height="64" alt="" /></a>
								<a href="#" class="thumb"><img src="sample-thumbnail.jpg" width="64" height="64" alt="" /></a>
								<a href="#" class="thumb"><img src="sample-thumbnail.jpg" width="64" height="64" alt="" /></a>
								<a href="#" class="thumb"><img src="sample-thumbnail.jpg" width="64" height="64" alt="" /></a>
								<a href="#" class="thumb"><img src="sample-thumbnail.jpg" width="64" height="64" alt="" /></a>

								<div class="clearer">&nbsp;</div>

							</div>

						</div>
					
					</div>-->

					
				</div>
			</div>

			<div class="clearer">&nbsp;</div>

		</div>

	</div>
</div>



<?php include('footer.php'); ?> 
