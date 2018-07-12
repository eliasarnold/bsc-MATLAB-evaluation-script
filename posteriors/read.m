fileID = fopen('posteriors.txt','r');
posterior_matrix = zeros(200,4);
methods = ["GROTRU","FCN","EGGER","DUMMY"]';
while ~feof(fileID)
    % get data of one row
    image_No = fscanf(fileID, 'test%u', 1);
    method = fscanf(fileID, '_%[EGGERFCNDUMMYOT]', 1);
    iteration_No = fscanf(fileID, '_iteration%u:', 1);
    posterior = fscanf(fileID, '%f', 1);
    fscanf(fileID, '\n', 1);

    % write data
    index = find(methods==method);
    posterior_matrix((20*image_No)+(iteration_No+1),index) = posterior;
end
% save the image data
save(fullfile('..','image_data','posterior_matrix.mat'),'posterior_matrix');

fclose(fileID);