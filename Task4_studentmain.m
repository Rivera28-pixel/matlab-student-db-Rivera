%Author name:Blanca Rivera
%Email: rivera222@rowan.edu
%Course: Intro to Matlab/Solidworks
%Assignment: Midterm 
%Task 4 : Main 
%11/12/24

db = StudentDB();
%this is the samples for each student 
db= db.addStudent(Student('001','Aidan',25,3.7,'Nursing'));
db= db.addStudent(Student('002','Marcus',23,3.8,'Engineering'));
db= db.addStudent(Student('003','Bianca',19,3.6,'Environmental Science'));
db= db.addStudent(Student('004','Emma', 24,3.9,'Marine Biology'));
db= db.addStudent(Student('005','Bry',24,3.3,'Culinary'));

student=db.findStudentByID('001'); %find the student with the addressed Id in the parentheses
if ~isempty(student) %if statement that addressed if the student has this id to display it in the command window 
    student.displayInfo();
end 

%List of students by major
studentsByMajor=db.getStudentsByMajor('Nursing'); %lists students by major 
fprintf('Students in Nursing:\n'); %displays any students that are in the nursing major along with their info
for i=1:length(studentsByMajor)
    studentsByMajor{i}.displayInfo();
end 

%Saves a database to a file 
db.saveToFile('StudentDatabase.mat'); %saves that data to a file under the name within the parentheses 

%Loads a database to a file 
db= db.loadFromFile('StudentDatabase.mat'); %calls to load the data put into the previous saved file 

%Shows the different figure plots 
figure;
subplot(3,1,1)
db.plotGPADistribution(); %shows the figure for gpa distributions

subplot(3,1,2);
db.plotAverageGPAMajor();%shows the figure for avg.gpa by major distributions

subplot(3,1,3);
db.plotAgeDistribution(); %shows the figure for age  distributions

saveas(gcf, 'myFigure.fig'); %saves the figure as it's on matlab file 
