classdef Student
    properties %lists the properties that should make up the list info required from each student 
        student_id
        first_name
        student_age
        student_gpa
        student_major
    end 

    methods 
        function obj=Student(student_id,first_name,student_age,student_gpa,student_major) %renames the properties as objectives
            if nargin > 0
                obj.student_id= student_id;
                obj.first_name= first_name;
                obj.student_age= student_age;
                obj.student_gpa= student_gpa ;
                obj.student_major= student_major;
            end 
        end 

        function displayInfo(obj) %displays the students information
            fprintf('ID;%s\nName: %s\nAge: %d\nGPA: %.2f\nMajor: %s\n',obj.student_id,obj.first_name, obj.student_age,obj.student_major);
        end 

        function obj = updateGPA(obj, newGPA) %this is used to update the GPA 
            obj.student_gpa= newGPA;
        end 
    end 
end 
