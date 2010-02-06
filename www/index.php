
<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<?php

$domain=ereg_replace('[^\.]*\.(.*)$','\1',$_SERVER['HTTP_HOST']);
$group_name=ereg_replace('([^\.]*)\..*$','\1',$_SERVER['HTTP_HOST']);
$themeroot='http://r-forge.r-project.org/themes/rforge/';

echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en   ">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><?php echo $group_name; ?></title>
	<link href="<?php echo $themeroot; ?>styles/estilo1.css" rel="stylesheet" type="text/css" />
  </head>

<body>

<!-- R-Forge Logo -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="/"><img src="<?php echo $themeroot; ?>/images/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>


<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->

<?php if ($handle=fopen('http://'.$domain.'/export/projtitl.php?group_name='.$group_name,'r')){
$contents = '';
while (!feof($handle)) {
	$contents .= fread($handle, 8192);
}
fclose($handle);
echo $contents; } ?>

<!-- end of project description -->

<p> The <strong>project summary page</strong> you can find <a href="http://<?php echo $domain; ?>/projects/<?php echo $group_name; ?>/"><strong>here</strong></a>. </p>
<br/>
<strong>Installing and loading mmSAR</strong>
<br/>
<br/>
To install the <strong>mmSAR</strong> package directly within R type <code>install.packages("mmSAR",repos="http://R-Forge.R-project.org")</code>
<br/>
You will need an internet connexion and administrators privileges under linux to do this.

<br/>
<strong>SAR models in mmSAR</strong>
<br/>
<br/>
<strong>mmSAR</strong> proposes a comprehensive set of SAR models, including 4 convex models (power, exponential, negative exponential, and Monod) and 4 sigmoidal models (rational function, logistic, Lomolino, and cumulative Weibull). This includes convex, sigmoid, asymptotic, and nonasymptotic models, encompassing most of the shapes attributed to SARs in the literature.

<center>
<TABLE WIDTH=624 BORDER=1 BORDERCOLOR="#000000" CELLPADDING=4 CELLSPACING=0>
	<COL WIDTH=76>
	<COL WIDTH=202>
	<COL WIDTH=106>
	<COL WIDTH=111>
	<COL WIDTH=86>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">Name</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">Formula</FONT></P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">Number of
			parameters</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">Shape</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">Asymptotic
			nature</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">power</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">S = cA</FONT><SUP><FONT SIZE=2 STYLE="font-size: 10pt">z</FONT></SUP></P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">2</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">convex</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">no</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">exponential</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">S = c +
			zlog(A)</FONT></P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">2</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">convex</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">no</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">negative
			exponential</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">S = c(1 -
			exp(-zA))</FONT></P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">2</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">convex</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">yes</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">Monod</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">S = (cA) / (z
			+ A)</FONT></P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">2</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">convex</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">yes</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">rational
			function</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">S = (c + zA)
			/ (1 + fA)</FONT></P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">3</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">sigmoid</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">yes</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">logistic</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">S = c / (1 +
			exp(-zA+f)</FONT></P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">3</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">sigmoid</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">yes</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">Lomolino</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">S = c / 1 +
			(z</FONT><SUP><FONT SIZE=2 STYLE="font-size: 10pt">log(f/A)</FONT></SUP><FONT SIZE=2 STYLE="font-size: 10pt">)</FONT></P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">3</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">sigmoid</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">yes</FONT></P>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=76>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">cumulative
			Weibull</FONT></P>
		</TD>
		<TD WIDTH=202>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">S = c(1 -
			exp(-zA</FONT><SUP><FONT SIZE=2 STYLE="font-size: 10pt">f</FONT></SUP><FONT SIZE=2 STYLE="font-size: 10pt">))
			</FONT>
			</P>
		</TD>
		<TD WIDTH=106>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">3</FONT></P>
		</TD>
		<TD WIDTH=111>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">sigmoid</FONT></P>
		</TD>
		<TD WIDTH=86>
			<P ALIGN=CENTER><FONT SIZE=2 STYLE="font-size: 10pt">yes</FONT></P>
		</TD>
	</TR>
</TABLE>
</center>
<br/>
In mmSAR models are data objects. To load a particular model use the following sintax :
<br/>
<code>data(power) #loading the power model</code>
<br/>
this will have for effect to load the power model object in the R workspace. Particular elements of the model object are accessible using the <code>$</code> operator :
<br/>
<code>power$formula</code>
<br/>
return the following :
<br/>
<code>expression(s == c * a^z)</code>
<br/>
<br/><br/><br/>
</body>
</html>
