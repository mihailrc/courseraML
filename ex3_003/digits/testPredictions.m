tdata  = csvread('test.csv'); % training data stored in arrays X, y
Xt = tdata(2:28001,:);
pred = predictOneVsAll(all_theta, Xt);

for i = 1:length(pred)
   if pred(i) ==10
      pred(i) = 0;
   end
end

save 'test_predictions_lambda.csv' pred;