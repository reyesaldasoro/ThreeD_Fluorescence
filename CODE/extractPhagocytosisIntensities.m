% analysePhagoCytosis
if strcmp(filesep,'/')
    % Running in Mac
    baseDir             = '/Users/ccr22/Academic/work/neutrophils/sheffield/ClareMUIR/SingleSlice_mat_Or/';
    dir1                = dir (strcat(baseDir,'*.mat'));
    tracks              = readTracksXML('Cropped z7-14_Tracks.xml');
else
    % running in windows
    
end



%% Iterate over a track

selectTrack         = 1;
lengthTrack         = size(tracks{selectTrack},1);
for counterT = 201:2:lengthTrack
    % Load the data
    load(strcat(baseDir,dir1(tracks{selectTrack}(counterT,1)+1).name))
    channel_1       = double(mean(dataIn(:,:,1:2:end),3));
    channel_2       = double(mean(dataIn(:,:,2:2:end),3));
    channel_1       = double(max(dataIn(:,:,1:2:end),[],3));
    channel_2       = double(max(dataIn(:,:,2:2:end),[],3));
    
    rows            = tracks{selectTrack}(counterT,3);
    cols            = tracks{selectTrack}(counterT,2);
    
    channel_2(rows-12:rows-10,cols-10:cols+10) =8000; 
    channel_2(rows+10:rows+12,cols-10:cols+10) =8000; 
    channel_2(rows-10:rows+10,cols-12:cols-10) =8000; 
    channel_2(rows-10:rows+10,cols+10:cols+12) =8000; 
    
    imagesc(channel_2)
    title(num2str(counterT))
    drawnow
    pause(0.1)
    
    
    
    
end


%dataIn          = '/Users/ccr22/OneDrive - City, University of London/Acad/Research/Sheffield/ClareMUIR/MAX_Cropped z7-14. A1 07.03.2019 PHAkt GFP S cerv PH rhodo.mvd2 - 65mpi 2-2.tif';
% dataInfo        = imfinfo(dataIn);
% numFrames       = size(dataInfo,1);
% 
% 
% %%
% k=492;
% currData(:,:,1)        = double(imread(dataIn,k));
% currData(:,:,2)        = double(imread(dataIn,k+1));
% currData(:,:,1)        = currData(:,:,1)        /max(max(currData(:,:,1)));
% currData(:,:,2)        = currData(:,:,2)        /max(max(currData(:,:,2)));
% 
% 
% currData(1,1,3)         =0;
% 
% 
% 
%  imagesc(currData)
