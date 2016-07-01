%function RETURN_CODE_TYPE_FUNCTION
global RETURN_CODE_TYPE
RETURN_CODE_TYPE.NO_ERROR = 0;   % request valid and operation performed */
RETURN_CODE_TYPE.NO_ACTION = 1;  % status of system unaffected by request */
RETURN_CODE_TYPE.NOT_AVAILABLE = 2;   % resource required by request unavailable */
RETURN_CODE_TYPE.INVALID_PARAM = 3;   % invalid parameter specified in request */
RETURN_CODE_TYPE.INVALID_CONFIG = 4;  % parameter incompatible with configuration */
RETURN_CODE_TYPE.INVALID_MODE = 5;    % request incompatible with current mode */
RETURN_CODE_TYPE.TIMED_OUT = 6;       % time-out tied up with request has expired */
%end