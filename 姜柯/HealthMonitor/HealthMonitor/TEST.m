function TEST()  
        
        %������״̬
        global PAR;
        global PRO;
        PAR=struct('PERIOD',0,'DURATION',0,'IDENTIFIER',1,'LOCK_LEVEL',0,'OPERATING_MODE',0,'START_CONDITION',3);
        PRO=struct('ID',1,'DEADLINE_TIME',10,'CURRENT_PRIORITY',31,'PROCESS_STATE',0,'PERIOD',10,'TIME_CAPACITY',5,'ENTRY_POINT',20,'STACK_SIZE',20,'BASE_PRIORITY',0,'DEADLINE',30,'NAME',999);
        
        %����������Ҫ��һЩ��������������ʹ�����֣���Ҫʹ���ַ�����        
        %ATTRIBUTE=struct('ID',4,'DEADLINE_TIME',10,'CURRENT_PRIORITY',1,'PROCESS_STATE',0,'PERIOD',10,'TIME_CAPACITY',5,'ENTRY_POINT',20,'STACK_SIZE',20,'BASE_PRIORITY',0,'DEADLINE',30,'NAME',747);    
        %CREATE_PROCESS(ATTRIBUTE);
        
        %�Ժ���Ҫ���Եĺ���д�����Test.m�ļ��У�
        %REPORT_APPLICATION_MESSAGE(10,10);
        %CREATE_ERROR_HANDLER(4,7);
        %GET_ERROR_STATUS();
        %RAISE_APPLICATION_ERROR(1,34,45);
        %

end

