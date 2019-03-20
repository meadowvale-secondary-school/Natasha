/*:
 ## App Exercise - Complex Fitness Calculations
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 If you completed the Fitness Calculations exercise, you calculated an average heart rate to display to the user. However, using proper order of operations you can do this in fewer steps. Create three separate heart rate constants, all of type `Double`, with values between 60 and 100. Then create a constant equal to the average heart rate. If you use correct order of operations you can do the heart calculation in one line.
 */
let heartRate1: Double = 60
let heartRate2: Double = 80
let heartRate3: Double = 90

let averageHeartRate: Double = ((heartRate1 + heartRate2 + heartRate3)/3)
print(averageHeartRate)

//: [Previous](@previous)  |  page 6 of 8  |  [Next: Exercise - Numeric Type Conversion](@next)
