classdef StudentDB
    properties 
       Students = {};
    end 

    methods
        %adds new students 
        function obj= addStudent(obj,student)
            obj.Students{end+1}= student;
        end 

    %used to find student based on their student id
        function student= findStudentByID(obj,student_id)
            student =[];
            for i=1:length(obj.Students)
                if strcmp(obj.Students{i}.student_id, student_id) %if statement given that looks for the student id called for by the function 
                    student=obj.Students{i}; 
                    return;
                end
            end 
            if isempty(student)
                fprintf('Student with ID %s not found. \n ',ID); %if the id is not given within the students information given this is what would display in the command window 
            end 
        end 

        % identifies student by major 
        function studentsByMajor= getStudentsByMajor(obj,student_major) 
            studentsByMajor={};
            for i= 1:length(obj.Students)
                if strcmp(obj.Students{i}.student_major,student_major) %if statement given that looks for the major called for by the function 
                    studentsByMajor{end+1}= obj.Students{i};
                end 
            end 
        end

        %saves the data base 
        function saveToFile(obj,filename) %saves this to a file under the file name prompted
            try 
                save(filename, 'obj');
                fprintf('Database saved to %s\n', filename);
            catch 
                fprintf('Error saving to file.\n');
            end 
        end 

        %loads a database from a file 
        function obj = loadFromFile(obj,filename) %loads it under the file name prompted
            try 
                loadedData= load(filename,'obj');
                obj=loadedData.obj;
                fprintf('Database loaded from %s/n', filename);
            catch 
                fprintf('Error loading from file.\n')
            end 
        end 

        % plots a GPA distribution histogram 
        function plotGPADistribution(obj)
            gpas= cellfun(@(s) s.student_gpa, obj.Students); %addresses which cells the information that is needed for the chart is contained in 
            histogram(gpas);
            title('GPA Distribution'); %labels the title 
            xlabel('GPA'); %labels the x axis 
            ylabel('Number of Students'); %labels the y axis 
        end 

        %this plots the average Gpa by major 
        function plotAverageGPAMajor(obj)
            majors= unique(cellfun(@(s)s.student_major,obj.Students, 'UniformOutput',false)); %addresses which cells the information that is needed for the chart is contained in 
            avgGPA= zeros(length(majors),1);
            for i= 1: length(majors)
                 majorGpas=cellfun(@(s) s.student_gpa, obj.getStudentsByMajor(majors{i}));
                 avgGPA(i)=mean(majorGpas);
            end 
            bar(categorical(majors), avgGPA);
            title('Average GPA by Major'); %labels the title 
            xlabel('Age'); %labels the x axis
            ylabel('Number of Students'); %labels the y axis 
        end 

            % plots age distribution
        function plotAgeDistribution(obj)
         ages = cellfun(@(s)s.student_age, obj.Students); %addresses which cells the information that is needed for the chart is contained in 
         histogram(ages);
         title('Age Distribution');  %labels the title 
         xlabel('Age');  %labels the x axis
         ylabel('Number of Students'); %labels the y axis 
        end  
    end 
end



