function x=bin2int(s,dtype)
%BIN2INT  Convert binary string to an integer datatype.
%   BIN2INT(S) returns the integer value represented by the binary string S. The
%   class of the output is the minimum unsigned integer class that supports the
%   number of bits in the binary string. Unlike BIN2DEC, BIN2INT supports binary
%   strings with up to 64 bits.
%   
%   If S is a character array, or a cell array of strings, each row is
%   interpreted as a binary string.
%   
%   BIN2INT(S,DATATYPE) optionally specifies the integer class of the output:
%   'int8', 'uint8', 'int16', 'uint16', 'int32', 'uint32', 'int64', or 'uint64'.
%   The length of the binary string S must be less than or equal than the number
%   of bits supported by DATATYPE.
%   
%   Embedded spaces are removed and leading spaces are converted to zeros.
%   
%   Example:
%       s = '1111111111111111111111111111111111111111111111111111111111111110';
%       bin2int(s) returns: 18446744073709551614
%       
%   See also: INT2BIN, DEC2BIN, BIN2DEC.

%   Andrew D. Horchler, horchler @ gmail . com, Created 4-10-16
%   Revision: 1.0, 4-10-16


% Input checking
narginchk(1,2)
if iscellstr(s) 
    s = char(s); 
elseif ~ischar(s)
    error('bin2int:InvalidInput',...
          'Input must be string or a cell array of strings.');
end
[m,n] = size(s);
if isempty(s)
    x = zeros(m,0,'uint8');
    return;
end
if n > 64
    error('bin2int:InvalidLength','Binary string must be 64 bits or less.'); 
end

if nargin < 2
    if n <= 8
        dtype = 'uint8';
    elseif n <= 16
        dtype = 'uint16';
    elseif n <= 32
        dtype = 'uint32';
    else
        dtype = 'uint64';
    end
    isSigned = false;
else
    types = {'int8','uint8','int16','uint16','int32','uint32','int64','uint64'};
    idx = strcmp(dtype,types);
    if ~any(idx)
        str = [sprintf('%s, ',types{1:end-1}) 'or ' types{end}];
        error('bin2int:InvalidDatatype',...
              'Datatype must be a valid integer class: %s.',str); 
    end
    bits = [8 8 16 16 32 32 64 64];
    b = bits(idx);
    if n > b
        error('bin2int:InvalidRange',...
              'Input is %u bits, but %s only supports %u bits.',n,dtype,b);
    end
    isSigned = (n==b && any(strcmp(dtype,types(1:2:end))));
end

% Remove spaces
for i = 1:m
    si = s(i,:);
    idx = (si==' ' | si==0);
    if any(idx)
        si(idx) = '';
        s(i,:) = [repmat('0',1,nnz(idx)) si];
    end
end

% Check for invalid binary strings
if any(s(:)~='0' & s(:)~='1')
    error('bin2int:InvalidString',...
          'Binary string must consist only of characters 0 and 1.');
end

% Convert
v = cast(s-'0',dtype);
n = cast(n,dtype);
if isSigned
    x = (1-2*v(:,1)).*sum(v(:,2:end).*repmat(2.^(n-2:-1:0),m,1),2,'native');
else
    x = sum(v.*repmat(2.^(n-1:-1:0),m,1),2,'native');
end