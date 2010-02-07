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

						<div class="post-title"><h1>Installation</h1></div>

<br/>
						<div class="post-body">

	<p class="large">To install the mmSAR package directly within R type:</p>

<div class="success">install.packages("mmSAR", repos="http://R-Forge.R-project.org")</div>
														
		<p class="large">You need an internet connexion and administrators privileges under linux to do this.<br/><br/>Whenever you do not have admin rights on the system you are running R, you can install the package locally.<br/><br/>Assuming you own a directly located at 'myPackagesDirectoryPath', you can install the mmSAR package locally in the 'myPackagesDirectory' directory using the 'lib' argument of the 'install.packages' function :</p>

<div class="success">install.packages("mmSAR", repos="http://R-Forge.R-project.org", lib="myPackagesDirectoryPath")</div>

				<p class="large">After that when loading the mmSAR package, use the 'lib.loc' argument of the 'library' function to find the package :</p>

<div class="success">library(mmSAR, lib.loc="myPackagesDirectoryPath")</div>
										
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
