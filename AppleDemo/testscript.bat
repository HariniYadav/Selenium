cd PycharmProjects\Training\AppleDemo\TestSuite
robot --outputdir Results TestCases.robot
cd Results
robotmetrics --logo Apple-Logo.png -M regression_metrics.html
cd C:\Users\Home