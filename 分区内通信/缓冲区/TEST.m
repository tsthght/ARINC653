global PARA_REG2
global PARA_REG1
%creat_buffer
PARA_REG2{1,1}='buffer1';
PARA_REG1{1,1}=8;
PARA_REG1{1,2}=4;
PARA_REG1{1,3}=1;
SYSTEM_CALL(32);

%send_buffer
PARA_REG1{1,1}=2;
PARA_REG1{1,2}=4;
PARA_REG1{1,3}=4;
PARA_REG1{1,4}=10;
SYSTEM_CALL(33);
%receive_buffer
PARA_REG1{1,1}='buffer_id';
PARA_REG1{1,2}=10;
PARA_REG1{1,3}=4;
SYSTEM_CALL(34);
%get_buffer_status
PARA_REG2{1,1}='buffer_id';
SYSTEM_CALL(35);
%get_buffer_id
PARA_REG1{1,1}='buffer_name';
SYSTEM_CALL(36);