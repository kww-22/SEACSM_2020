# SEACSM 2020
R code for my abstract submitted to the 2020 annual meeting of the southeast chapter of the American College of Sports Medicine

**Title**: *Humeral Segment Energy and its Relationship to Clinical Glenohumeral Measures in Youth Baseball Pitchers* <br/>
**Authors**: Kyle Wasserberger, Jessica Downs, Gretchen Oliver

Sports Medicine & Movement Lab <br/> 
School of Kinesiology <br/>
Auburn University <br/>
Last updated: 10 December, 2019 <p/> 
<br/>
## Files <br/>
packages.R <br/>
- R script used for loading frequently used packages
- Should be run first to ensure you have all necessary packages installed and loaded <p/>

SEACSM_analysis.R
  - R script used for statistical analyses
  - Run before *SEACSM_plots.R* to ensure all model variables are in global environment

SEACSM_plots.R
  - R script used for data visualization and model diagnostics
  - *SEACSM_analysis.R* should be run previously to ensure all model variables are in global environment
