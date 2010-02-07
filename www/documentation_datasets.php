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

						<div class="post-title"><h1>Data sets</h1></div>

<br/>
						<div class="post-body">

							<p align="center"><img src="doc_datasets.png" alt="" class="bordered" /></p>
<br/>
<div class="notice">A description of available example data sets is expected shortly. The example data sets names are :<br/>
data.arr<br/>
data.atl<br/>
data.galap<br/>
data.glea<br/>
data.gleas<br/>
</div>
							<p class="large">mmSAR handle SAR data sets as list-objects. A data set is a list of 2 elements :
<br/>
<ul>
	<li><b>$name</b> : a character string specifying the name of the data set</li><br/>
	<li><b>$data</b> : a R data.frame object with 2 columns :<br/><br/>
		<ul>
			<li><b>$a</b> : a numeric vector of areas</li><br/>
			<li><b>$s</b> : a numeric vector of species richness</li>
		</ul>
	</li>
</ul></p>
<br/>
<p class="large">mmSAR provide some example data sets, for example to load a species-area dataset describing the plants of the Galapagos Islands (<a href="publications.html">Preston, 1962</a>) use : </p>

<div class="success">load(data.galap)</div>



					</div>
						
					</div>

				</div>
			</div>

			<div id="sidebar-wrapper">
				<div id="sidebar">

					<?php include('doc_nav.php'); ?>
					<div class="box">

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
					
					</div>

					
				</div>
			</div>

			<div class="clearer">&nbsp;</div>

		</div>

	</div>
</div>

<div id="footer-wrapper">

	<div class="center-wrapper">

		<div id="footer">

			<div class="left">
				<a href="index.html">Home</a> <span class="text-separator">|</span> <a href="documentation_home.html">Documentation</a><span class="text-separator">|</span><a href="publications.html">Publications</a><span class="text-separator">|</span>
			</div>

			<div class="right">
				<a href="#">Top ^</a>
			</div>
			
			<div class="clearer">&nbsp;</div>

		</div>

	</div>

</div>

<div id="bottom">

	<div class="center-wrapper">

		<div class="left">
			&copy; 2009 François Guilhaumon - mmSAR is GPL feel free to use it and contribute to it.<span class="text-separator">|</span>
		</div>

		<div class="right">
			<a href="http://templates.arcsin.se/">Website template</a> by <a href="http://arcsin.se/">Arcsin</a> 
		</div>
		
		<div class="clearer">&nbsp;</div>

	</div>

</div>

</body>
</html>
