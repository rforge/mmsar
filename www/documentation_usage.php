<?php include('header.php'); ?>  
	<title>mmSAR - Documentation - Usage</title>
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

						<div class="post-title"><h1>mmSAR usage</h1></div>

<br/>
						<div class="post-body">

							<h2 class="quiet">Loading mmSAR</h2>
						
							<p class="large">After <a href="documentation_install.php">installation</a>, load mmSAR :</p>
		
<div class="success">library(mmSAR)</div><br/>

							<h2 class="quiet">Use case 1 : the simple case.</h2><br/>

<p align="center"><img src="doc_use1.png" alt="" class="bordered" /></p>
						
							<p class="large">Basic non linear SAR model fits are obtained with the <a href="documentation_functions.php">rssoptim</a> function, this function takes for arguments a <a href="documentation_models.php">model object</a> and a <a href="documentation_datasets.php">data set object</a>. Further arguments are available (see <a href="documentation_functions.php">'Functions'</a>). A basic run :</p>
		
<div class="success">#loading the exponential model<br/>
data(expo)<br/><br/>
#loading the Galapagos Islands plants data set (<a href="publications.php">Preston, 1962</a>)<br/>
data(data.galap)<br/><br/>
#fitting the exponential model to the Galapagos dataset<br/>
res <- rssoptim(expo,data.galap)<br/> </div><br/>

							<h2 class="quiet">Use case 2 : multimodel SARs.</h2><br/>

<p align="center"><img src="doc_use2.png" alt="" class="bordered" /></p>
						
							<p class="large">Multimodel SAR fits are obtained with the <a href="documentation_functions.php">multiSAR</a> function, this function takes for arguments a vector of character strings for model names and a <a href="documentation_datasets.php">data set object</a>. Further arguments are available (see <a href="documentation_functions.php">'Functions'</a>). A basic run :</p>
		
<div class="success">#loading all available models<br/>
data(power)<br/>data(expo)<br/>data(negexpo)<br/>data(monod)<br/>data(ratio)<br/>data(logist)<br/>data(lomolino)<br/>data(weibull)<br/><br/>
#loading the Galapagos Islands plants data set (<a href="publications.php">Preston, 1962</a>)<br/>
data(data.galap)<br/><br/>
#creating a vector of model names<br/>
mods <- c("power","expo","negexpo","monod","logist","ratio","lomolino","weibull")<br/><br/>
#fitting all the models to the Galapagos dataset and perform multimodel averaging<br/>
resAverage <- multiSAR(modelList=mods,data.galap)<br/> </div><br/>
											
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
