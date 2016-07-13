classdef payment
        properties
            rate;
            term;
            principle;
        end

        methods
            function pay = payment(r, t, p)
                pay.rate = r;
                pay.term = t;
                pay.principle = p;
            end

            function disp(pay)
%                money = pay.principle * (1 + pay.rate)^pay.term;
               fprintf(' %f \n', pay.rate)
            end
        end
end