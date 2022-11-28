#!/bin/bash

#1. Which location has the maximum number of purchases been made?
echo "Question 1: Which location has the maximum number of purchases been made?"
awk -F ',' 'BEGIN{max = 0; result = 0}{count[$5]++} END {for (location in count) if (count[location] > max) 
{max = count[location]; result = location}} END {print "The location with the maximum number of purchases is " result ", where " max " purchases have been made."}' bank_transactions.csv
 
echo " "

#2 In the dataset provided, did females spend more than males, or vice versa?
echo "Question 2: In the dataset provided, did females spend more than males, or vice versa?"
awk -F ',' '{if($4 == "F") {sum1 += $9; numF++} else if($4 == "M") {sum2 += $9; numM++}} 
END {print "On average, females spend: " sum1/numF } END {print "On average, males spend: " sum2/numM}' bank_transactions.csv
echo "We can conclude that in the dataset provided females spend  more than males."

echo " "

#3 Report the customer with the highest average transaction amount in the dataset.
echo "Question 3: Report the customer with the highest average transaction amount in the dataset."
awk -F ',' '{totTrans[$2]+=$9; count[$2]++} 
END {for (costumer in totTrans) averages[costumer] = totTrans[costumer]/count[costumer]} 
END {for (costumer in averages) if (averages[costumer] > max) {max = averages[costumer]; result = costumer}} END {print "The highest average transactions amount in the dataset is " max " and was made by the customer with the ID " result "."}' bank_transactions.csv
 