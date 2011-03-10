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

						<div class="post-title"><h1>mmSAR Functions</h1></div>

<br/>
						<div class="post-body">

							<p align="center"><img src="doc_functions.png" alt="" class="bordered" /></p>
<br/>
							<h2 class="quiet">model fitting</h2>
						
							<p class="large"><b>rssoptim</b> : function (model, data, norTest = "lillie", verb = T)</p>
							
							<h2 class="quiet">multimodel averaging & confidence intervals</h2>
						
							<p class="large"><b>multiSAR</b> : function (modelList = c("power","expo","weibull"), data = data.galap, nBoot = 1000, verb = T, 
    crit = "Bayes")</p>
																		
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
