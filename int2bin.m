function s=int2bin(x,n)
%INT2BIN  Convert integer datatype to a binary string.
%   INT2BIN(X) returns the binary representation of X as a string. X must be an
%   integer datatype and non-negative. Unlike DEC2BIN, INT2BIN supports int64
%   and uint64 values of X greater than 2^52.
%   
%   INT2BIN(X,N) produces a binary representation with at least N bits.
%   
%   Example:
%       int2bin(intmax('uint64')-1) returns:
%       '1111111111111111111111111111111111111111111111111111111111111110'
%   
%   See also: BIN2INT, BIN2DEC, DEC2BIN.

%   Andrew D. Horchler, adh9 @ case . edu, Created 1-21-16
%   Revision: 1.0, 4-10-16


% Input checking
narginchk(1,2)
if isempty(x)
    s = '';
    return;
end

if ~isinteger(x)
    error('int2bin:InvalidIntegerArg','X must be an integer datatype.');
end
x = x(:);   % Make sure x is a column vector.
if any(x < 0)
    error('int2bin:MustBeNonNegative','X must be a non-negative.');
end

if nargin < 2
    n = 1;  % Need at least one digit even for 0.
else
    if ~isnumeric(n) || ~isscalar(n) || n < 0 || n ~= floor(n)
        error('int2bin:InvalidBitArg',...
              'N must be a non-negative integer value.');
    end
    n = round(double(n));   % Make sure n is an integer.
end

% Convert
e = double(nextpow2(max(x)));   % Number of digits to represent the numbers
s = [repmat('0',length(x),n-e) rem(bsxfun(@bitshift,abs(x),1-e:0),2)+'0'];