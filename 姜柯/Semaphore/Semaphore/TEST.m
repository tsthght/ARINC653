function TEST()  
        
        %以后需要测试的用例写在这个Test.m文件中！
        
        [SEMAPHORE_ID,RETURN_CODE] = CREATE_SEMAPHORE(747,1,1000,1)
        [SEMAPHORE_ID,RETURN_CODE] = CREATE_SEMAPHORE(320,0,500,1)
        
        [ RETURN_CODE ] = WAIT_SEMAPHORE( 2,1 )
        
        [ RETURN_CODE ] = SIGNAL_SEMAPHORE(2)
        
        [ SEMAPHORE_ID,RETURN_CODE ] = GET_SEMAPHORE_ID(747)
        [ SEMAPHORE_ID,RETURN_CODE ] = GET_SEMAPHORE_ID(320)
        
        [ SEMAPHORE_STATUS,RETURN_CODE  ] = GET_SEMAPHORE_STATUS(1)
        [ SEMAPHORE_STATUS,RETURN_CODE  ] = GET_SEMAPHORE_STATUS(2)
      

end

