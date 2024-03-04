classdef msed_base
    %MSED_BASE Summary of this class goes here
    %   Detailed explanation goes here

    properties
        base_objects
        no_of_objects
        base_sum
        base_complexities
        base_complexities_product
        mean_vals
    end

    methods
        function obj = msed_base(X)
            %MSED_BASE Construct an instance of this class
            %   Detailed explanation goes here
            obj.base_objects = X;
            obj.no_of_objects = size(X,1);
            obj.base_sum = sum(X,1);
            obj.base_complexities = obj.complexity(X);
            cp = cumprod(obj.base_complexities);
            obj.base_complexities_product = cp(obj.no_of_objects);
            obj.mean_vals = sum(X,1) ./ obj.no_of_objects;
        end

        function result = msed(obj, Y)
            %Y can be an array of data, each row of which is assessed
            %against the pre-formed base
            noOfVals = obj.no_of_objects + 1;

            %M is also an array of data, each row is the overall mean
            M = (Y + obj.base_sum) ./ (noOfVals);
            %topLine is a column vector
            topLine = obj.complexity(M);

            %cprod is a scalar
            cprod = obj.base_complexities_product;
            %newComp is a column vector
            newComp = obj.complexity(Y);
            %product is a column vector
            product = newComp .* cprod;

            %bottomLine is a column vector
            bottomLine = product .^ (1/noOfVals);

            %result is a column vector
            result = (1 / (noOfVals - 1)) .* ((topLine ./ bottomLine) - 1);
        end

        function C = complexity(obj, X)
            %X is an array, C is a column vector where each cell is the complexity of
            %that row of X

            %problem is that X may contain zeros
            % so replace the 0s with 1s, then the log of that is zero anyway!
            % X(X == 0) = 1;
            %which is a neat trick but turns out to halve the speed!!! who
            %could have guessed that....?!

            logs = log(X);
            hs = X .* logs;
            cs = -sum(hs,2,'omitnan');
            % % cs = -sum(hs,2);
            C = exp(cs);
        end
    end

end

