function Blink()
global z
global y
global on

global mf
global mb
global stp
global tl
global tr

global fileID
% global data.text2
% fopen(fileID);
%  f = openfig('imgprcing.fig');
%     data = guihandles(f); % initialize it to contain handles
%     guidata(f, data);
%     data = guidata(gcbo);
z=1;


% BlinkCount = zeros(1000);
%TStart = 0;

%Clear Screen
%Clear Variables
%Close figures
% a=imread('b.jpg');
%Preallocate buffer
data_blink = zeros(1,256);
%Comport Selection
portnum1 = 11;
%COM Port #
comPortName1 = sprintf('\\\\.\\COM%d', portnum1);
% Baud rate for use with TG_Connect() and TG_SetBaudrate().
TG_BAUD_115200 = 115200;
% Data format for use with TG_Connect() and TG_SetDataFormat().
TG_STREAM_PACKETS = 0;
% Data type that can be requested from TG_GetValue().
TG_DATA_BLINK_STRENGTH = 37;
%load ThinkGear dll
loadlibrary('thinkgear64.dll','ThinkGear.h');
%To display in Command Window
fprintf('thinkgear64.dll loaded\n');
% z = calllib('thinkgear64', 'TG_EnableBlinkDetection');
% disp(z);
%get dll version
% dllVersion = calllib('thinkgear64', 'TG_GetDriverVersion');
%To display in command window
% fprintf('ThinkGear DLL version: %d\n', dllVersion );
% Get a connection ID handle to ThinkGear
connectionId1 = calllib('thinkgear64', 'TG_GetNewConnectionId');
if ( connectionId1 < 0 )
error( sprintf( 'ERROR: TG_GetNewConnectionId returned %d.\n', connectionId1 ) );
end;
% Attempt to connect the connection ID handle to serial port "COM3"
errCode = calllib('thinkgear64', 'TG_Connect', connectionId1,comPortName1,TG_BAUD_115200,TG_STREAM_PACKETS );
if ( errCode < 0 )
error( sprintf( 'ERROR: TG_Connect() returned %d.\n', errCode ) );
end
fprintf( 'Connected. Reading Packets...\n' );
if(calllib('thinkgear64','TG_EnableBlinkDetection',connectionId1,1)==0)
disp('blinkdetectenabled');
end
i=1;
j=0;
i1 = 0;
j1 = 0;
k1 = 0;
T80 = tic;
T90 = tic;
T110 = tic;
blink_continuous = 0;
blink_tic = tic;
power1 = 0;
mov = 0;
turnR = 0;
turnL = 0;

% fileId=serial('COM12','BAUD', 9600);
% fopen(fileId); % put in 4blinks code afterwards
% TStart = tic;


fileId = tcpip('192.168.4.1',80, 'NetworkRole', 'client');
fopen(fileId);


% BlinkCount(1) = toc(TStart);
%To display in Command Window
disp('Reading Brainwaves');

while (true) % i < 20
    
    
    
    
    if((toc(T80)>1)&&toc((blink_tic))>1)
        if((i1>=4)&&(blink_continuous==4))
            disp('4 blinks');
            if(power1==0)
                power1=1;
                fwrite(fileId,'a');
%                 pause(2);
            else
                if(power1==1)
                    power1=0;
                    fwrite(fileId,'b');
%                     pause(2);
                end
            end
            
            %do 4 blink work
        i1 = 0; j1 = 0; k1 = 0; T80 = tic; T90 = tic; T110 = tic; blink_tic = tic; blink_continuous = 0;
        end
%         if((toc(blink_tic)>=1)&&(blink_continuous4>=4))
%             i1 = 0; j1 = 0; k1 = 0; T80 = tic; T90 = tic; T110 = tic; blink_continuous4 = 0; blink_continuous2 = 0;
%         end
        
        i1 = 0; 
        
        % continue;
        %code
    end 
    
    
    
    
    
    if((toc(T90)>1)&&((toc(blink_tic))>1)&&(power1==1))
        if((j1>=2)&&(blink_continuous==2))
            disp('2 blinks');
            if(mov==1)
                mov=0;
                turnR=1;
                % pause(8);
                fwrite(fileId,'c');
            else
                if((mov==0) && (turnL==0))
                    turnR=1;
%                     pause(8);
                    fwrite(fileId,'d');
                else
                    if((mov==0) && (turnL==1))
                        turnL=0;
%                        pause(8);
                        turnR=1;
                        fwrite(fileId,'j');
                    end
                end
            
            %do 2 blink execution
        i1 = 0; j1 = 0; k1 = 0; T80 = tic; T90 = tic; T110 = tic; blink_tic = tic; blink_continuous=0;
            end
%          if((toc(blink_tic)>=1)&&(blink_continuous2>=2))
%             i1 = 0; j1 = 0; k1 = 0; T80 = tic; T90 = tic; T110 = tic; blink_continuous4 = 0; blink_continuous2 = 0;
%         end
        
        
        % continue;
        %code
        else
            if((j1>=3)&&(blink_continuous==3))
            disp('3 blinks');
            if(mov==1)
                mov=0;
                turnL=1;
%                 pause(1);
                fwrite(fileId,'h');
            else
                if((mov==0) && (turnR==0))
                    turnL=1;
%                     pause(1);
                    fwrite(fileId,'i');
                else
                    if((mov==0) && (turnR==1))
                        turnR=0;
%                         pause(0.5);
                        turnL=1;
                        fwrite(fileId,'k');
                    end
                end
            
            end 
            
            %do 2 blink execution
        i1 = 0; j1 = 0; k1 = 0; T80 = tic; T90 = tic; T110 = tic; blink_tic = tic; blink_continuous=0;
        
%          if((toc(blink_tic)>=1)&&(blink_continuous2>=2))
%             i1 = 0; j1 = 0; k1 = 0; T80 = tic; T90 = tic; T110 = tic; blink_continuous4 = 0; blink_continuous2 = 0;
%         end
            end
        
         
        % continue;
        %code
        end 
    end 
        
    
    if((toc(T110)>1)&&((toc(blink_tic))>1)&&(power1==1))
        if((k1>=1)&&(blink_continuous==1))
        disp('1 blink');
            if(mov==1)
                mov=0;
                fwrite(fileId,'e');
            else 
                if((turnR==1)||(turnL==1))
                    turnR=0;
                    turnL=0;
                    fwrite(fileId,'f');% stop
                else
                    if(data_blink(j)>100)
                    mov=1;
                    fwrite(fileId,'g'); % start
                    end
                end
            end
                    
        i1 = 0; j1 = 0; k1 = 0; T80 = tic; T90 = tic; T110 = tic; blink_tic = tic; blink_continuous = 0;
        end
        
       k1 = 0; 
        % continue;
        %code
    end
      
  
        if(toc(blink_tic)>1.2)
        blink_continuous = 0; i1 = 0; j1 = 0; k1 = 0; T80 = tic; T90 = tic; T110 = tic; blink_tic = tic;
        end
    
    
if (calllib('thinkgear64','TG_ReadPackets',connectionId1,1) == 1) %if a packet was read...
if (calllib('thinkgear64','TG_GetValueStatus',connectionId1,TG_DATA_BLINK_STRENGTH) ~= 0)
j = j + 1;
i = i + 1;
%Read attention Valus from ThinkGear packets
data_blink(j) = calllib('thinkgear64','TG_GetValue',connectionId1,TG_DATA_BLINK_STRENGTH );
%To display in Command Window

% BlinkCount(i) = toc(TStart);
% disp(BlinkCount(i)-BlinkCount(i-1));

% if(toc(T80<0.7))
%     i1 = i1 + 1;
% end
% if(toc(T90<0.7))
%     j1 = j1 + 1;
% end
% if(toc(T110<0.7))
%     k1 = k1 + 1;
% end

blink_tic = tic;
blink_continuous = blink_continuous+1;
disp(data_blink(j));

if(data_blink(j)>70)
    i1 = i1 + 1;
    T80 = tic;
    
end 

if(data_blink(j)>80)
    j1 = j1 + 1;
    T80 = tic;
    T90 = tic;
end 

if(data_blink(j)>80)
    k1 = k1 + 1;
    T80 = tic;
    T90 = tic;
    T110 = tic;
end 
    





% imshow(a); title('Blink Strength');
%Delay to display graph
% pause(1);
% close all;
end
end
end
%To display in Command Window
disp('Loop Completed')
%Release the comm port
calllib('thinkgear64', 'TG_FreeConnection', connectionId1 );