%CREATE_SAMPLING_PORT
PARA_REG2{1,1}='port_name';
PARA_REG1{1,1}=0;
PARA_REG1{1,2}=8;
PARA_REG1{1,3}=0;
SYSTEM_CALL(21);

%write_port
PARA_REG1{1,1}=SAMPLING_PORT_ID;
PARA_REG1{1,2}=MESSAGE_ADDR;
PARA_REG1{1,3}=LENGTH;
SYSTEM_CALL(22);

%read_port
PARA_REG1{1,1}=SAMPLING_PORT_ID;
PARA_REG1{1,2}=DES_SAMPLING_PORT_ID;
PARA_REG1{1,3}=MESSAGE_ADDR;
SYSTEM_CALL(23);
%get_port_status
PARA_REG2{1,1}=SAMPLING_PORT_ID;
SYSTEM_CALL(24);
%get_port_id
PARA_REG1{1,1}=SAMPLING_PORT_NAME;
SYSTEM_CALL(25)