function TEST()  
        
        %������״̬
        global PAR;
        global PRO;
        PAR=struct('PERIOD',0,'DURATION',0,'IDENTIFIER',1,'LOCK_LEVEL',0,'OPERATING_MODE',0,'START_CONDITION',3);
        PRO=struct('ID',4,'DEADLINE_TIME',10,'CURRENT_PRIORITY',1,'PROCESS_STATE',0,'PERIOD',10,'TIME_CAPACITY',5,'ENTRY_POINT',20,'STACK_SIZE',20,'BASE_PRIORITY',0,'DEADLINE',30,'NAME',747);
        %����������Ҫ��һЩ��������������ʹ�����֣���Ҫʹ���ַ�����        
        %ATTRIBUTE=struct('ID',4,'DEADLINE_TIME',10,'CURRENT_PRIORITY',1,'PROCESS_STATE',0,'PERIOD',10,'TIME_CAPACITY',5,'ENTRY_POINT',20,'STACK_SIZE',20,'BASE_PRIORITY',0,'DEADLINE',30,'NAME',747);    
        %CREATE_PROCESS(ATTRIBUTE);
        
        %�Ժ���Ҫ���Եĺ���д�����Test.m�ļ��У�
        %CREATE_SEMAPHORE(747,1,1000,1);
        %WAIT_SEMAPHORE( 1,1 );
        %SIGNAL_SEMAPHORE(1);
        %GET_SEMAPHORE_ID(747);
        GET_SEMAPHORE_STATUS(1);
        %

end

