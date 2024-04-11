
%{
- This program convert and Store iHGS-MHI-BLOCKS image into .mat format
- This program process one gesture at time for each 100 classes
- 2nd Image processing step of iHGS-MHI-BLOCKS algorithm


Dataset inform:
- 100 classes
- 20 sample per class
- G1 is gesture_1 refer to the 1st sample of a class
%}


%Constant
blockName = 'G_1.mat';
path = 'C:\Users\User\OneDrive\Documents\GitHub\Database\BLOCK_MHI_IMAGE\G1\';
addpath(path);

for i=1:100
    
    %load folder
    b = sprintf('%d',i);
    foldername = strcat(path,b);
    disp(foldername);
    addpath(foldername);
    
    %read image
    fileList = dir(fullfile(foldername, '*.jpg'));
    fileName = {fileList.name};
    
    %Resize dataset dimension from 640x480 to 224x224
    blockSize = size(fileList,1);
    disp("Processing......");
    block = zeros(224,224,blockSize,'uint8');
    
    
    %Store image into block
    for x=1:size(fileList)
        getFilename = sprintf('Block_%d.jpg',x);
        block(:,:,x) = imread(getFilename);
    end
    
    %Save Block MHI in .mat format
    fpath= 'C:\Users\User\OneDrive\Desktop\Unit Test\2_Generating Block MHI to mat\BLOCK_MHI_MAT\';
    count= sprintf('%d',i);
    fname= strcat(fpath,count);
    save(blockName,'block');
    
    bname = blockName;
    
    movefile(bname,fname,'f');
    
    
    
end