//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Employee{
    var empId: Int = 0;
    var empName: String = "name";
    init(eId:Int, eName: String){
        self.empId = eId;
        self.empName = eName;
    }
    func details() -> String{
        return "\(empId): \(empName)";
    }
}
var em = Employee(eId: 200, eName: "Test Emp");
em.details();

extension String{
    func length() -> Int{
        return self.characters.count;
    }
}
var st: String = "test string";
st.length()

protocol MyProtocol{
    func function1();
    func function2()
}
class Test{}
class myClass: Test, MyProtocol{
    func function1(){}
    func function2() {
        
    }
}


func swap<T: Hashable>(_ val1: inout T, _ val2: inout T){
    let temp = val1;
    val1 = val2;
    val2 = temp;
}
var var1 = 20;
var var2 = 40;
swap(&var1, &var2);
print(var1, var2);//print swapped variables

var cources = ["java","Objective C", "Cocoa","Swift"];
let codes = cources.map({
    (course:String)-> String in
    return course.substring(to: course.index(course.startIndex, offsetBy:2)).uppercased()
});

codes;


