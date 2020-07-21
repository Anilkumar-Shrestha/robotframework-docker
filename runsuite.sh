#!/bin/bash
echo "started to run robot script........" &&
robot --outputdir testresults/ googletest.robot &&
robotmetrics -M outputReportMetrics.html --inputpath ./testresults/ --output output.xml --log log.html &&
echo "........... completed."
