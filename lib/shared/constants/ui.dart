const double tabletBreak = 1024;
const double mobileBreak = 550;
const double barrierOpacity = 0.64;

double calculateRatio(double screenWidth) {
  // Define the two data points
  double width1 = 500;
  double ratio1 = 0.7;
  double width2 = 550;
  double ratio2 = 0.55;

  // Calculate the slope and y-intercept
  double slope = (ratio2 - ratio1) / (width2 - width1);
  double yIntercept = ratio1 - (slope * width1);

  // Calculate the ratio for the given screenWidth
  double ratio = (slope * screenWidth) + yIntercept;

  return ratio;
}
