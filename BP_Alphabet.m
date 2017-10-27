prompt = 'What is the number on Segment(1-10)?';
comment = '1 to 9 => One to Nine & 10 => Zero';

disp(comment)
number = input(prompt)

 round = 0.5;

 %Backprogation to pattern recognition problem (Alphabet).

 [Al,T]=prprob;

 net=newff(minmax(Al),[1 37],{'logsig','purelin'},'traingdx');
 net.trainParam.epochs=1000
 net.trainParam.goal=0.0001
 net.trainParam.show=1

 %train
 net = train(net,Al,T);

 %Test = Al(:,11);

 %plotchar(Test)
 %output=sim(net,Al(:,11));
 %[m,A_Id]=max(output)

 while round>0 
 %test for Seg with noise generated
 SegNoise=Al(:,number)+round*randn(size(Al(:,number)));

 figure
 plotchar(SegNoise)
 output=sim(net,SegNoise);
 [m,A_Id]=max(output)

 round = round - 0.025;
 end

 %test for Seg with the same training data
 Seg = Al(:,number);

 figure
 plotchar(Seg)
 output=sim(net,Al(:,number));
 [m,A_Id]=max(output)



