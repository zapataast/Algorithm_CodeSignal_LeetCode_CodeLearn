CREATE PROCEDURE securityBreach()
BEGIN


    select *
    from users 
    /* 
    '\%' gedeg ni string d тэмдэгт биш 
    
    concat() дотор таслал ашиглан string үүдийг нийлүүлж байна. concat('hello',' ','world') гэвэл нийлээд hello world гэж харуулж байна
    */
    WHERE attribute LIKE CONCAT('__%', BINARY(first_name), '_', BINARY(second_name), '\%%');
    
    
    
    
    
END
