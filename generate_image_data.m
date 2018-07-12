%Pfade k�nnen gefunden werden mit folgendem Befehl:
%h5disp('bfm/model2017-1_face12_nomouth.h5','/color/model/pcaVariance')

variance_shape = h5read('bfm/model2017-1_face12_nomouth.h5','/shape/model/pcaVariance');
variance_color = h5read('bfm/model2017-1_face12_nomouth.h5','/color/model/pcaVariance');
variance_expression = h5read('bfm/model2017-1_face12_nomouth.h5','/expression/model/pcaVariance');

PARAMETRIC_dir = fullfile("PARAMETRIC_rps_files");
POSTERIORS = load(fullfile('image_data','posterior_matrix.mat'));
POSTERIORS = POSTERIORS.posterior_matrix;
RPS_dir = fullfile("RPS");

for image_No=0:9
    image_data_matrix = zeros(20,32);
    PARAMETRIC_json = jsondecode(fileread(fullfile("PARAMETRIC_rps_files",strcat("test",num2str(image_No),".rps"))));
    for iteration_No=0:19
        GROTRU_json = jsondecode(fileread(fullfile(RPS_dir,strcat("test",num2str(image_No),"_GROTRU_",num2str(iteration_No),".rps"))));
        FCN_json = jsondecode(fileread(fullfile(RPS_dir,strcat("test",num2str(image_No),"_FCN_",num2str(iteration_No),".rps"))));
        EGGER_json = jsondecode(fileread(fullfile(RPS_dir,strcat("test",num2str(image_No),"_EGGER_",num2str(iteration_No),".rps"))));
        DUMMY_json = jsondecode(fileread(fullfile(RPS_dir,strcat("test",num2str(image_No),"_DUMMY_",num2str(iteration_No),".rps"))));
        
        image_data_matrix(iteration_No+1,1) = difference_weighted(GROTRU_json.momo.shape,PARAMETRIC_json.momo.shape,variance_shape);
        image_data_matrix(iteration_No+1,2) = difference_weighted(GROTRU_json.momo.color,PARAMETRIC_json.momo.color,variance_color);
        image_data_matrix(iteration_No+1,3) = difference_weighted(GROTRU_json.momo.expression,PARAMETRIC_json.momo.expression,variance_expression);
        image_data_matrix(iteration_No+1,4) = difference(GROTRU_json.pose.yaw,PARAMETRIC_json.pose.yaw);
        image_data_matrix(iteration_No+1,5) = difference(GROTRU_json.pose.roll,PARAMETRIC_json.pose.roll);
        image_data_matrix(iteration_No+1,6) = difference(GROTRU_json.pose.pitch,PARAMETRIC_json.pose.pitch);
        image_data_matrix(iteration_No+1,7) = difference(GROTRU_json.environmentMap.coefficients,PARAMETRIC_json.environmentMap.coefficients);
       
        image_data_matrix(iteration_No+1,9) = difference_weighted(FCN_json.momo.shape,PARAMETRIC_json.momo.shape,variance_shape);
        image_data_matrix(iteration_No+1,10) = difference_weighted(FCN_json.momo.color,PARAMETRIC_json.momo.color,variance_color);
        image_data_matrix(iteration_No+1,11) = difference_weighted(FCN_json.momo.expression,PARAMETRIC_json.momo.expression, variance_expression);
        image_data_matrix(iteration_No+1,12) = difference(FCN_json.pose.yaw,PARAMETRIC_json.pose.yaw);
        image_data_matrix(iteration_No+1,13) = difference(FCN_json.pose.roll,PARAMETRIC_json.pose.roll);
        image_data_matrix(iteration_No+1,14) = difference(FCN_json.pose.pitch,PARAMETRIC_json.pose.pitch);
        image_data_matrix(iteration_No+1,15) = difference(FCN_json.environmentMap.coefficients,PARAMETRIC_json.environmentMap.coefficients);
        
        image_data_matrix(iteration_No+1,17) = difference_weighted(EGGER_json.momo.shape,PARAMETRIC_json.momo.shape, variance_shape);
        image_data_matrix(iteration_No+1,18) = difference_weighted(EGGER_json.momo.color,PARAMETRIC_json.momo.color, variance_color);
        image_data_matrix(iteration_No+1,19) = difference_weighted(EGGER_json.momo.expression,PARAMETRIC_json.momo.expression, variance_expression);
        image_data_matrix(iteration_No+1,20) = difference(EGGER_json.pose.yaw,PARAMETRIC_json.pose.yaw);
        image_data_matrix(iteration_No+1,21) = difference(EGGER_json.pose.roll,PARAMETRIC_json.pose.roll);
        image_data_matrix(iteration_No+1,22) = difference(EGGER_json.pose.pitch,PARAMETRIC_json.pose.pitch);
        image_data_matrix(iteration_No+1,23) = difference(EGGER_json.environmentMap.coefficients,PARAMETRIC_json.environmentMap.coefficients);
        
        image_data_matrix(iteration_No+1,25) = difference_weighted(DUMMY_json.momo.shape,PARAMETRIC_json.momo.shape, variance_shape);
        image_data_matrix(iteration_No+1,26) = difference_weighted(DUMMY_json.momo.color,PARAMETRIC_json.momo.color, variance_color);
        image_data_matrix(iteration_No+1,27) = difference_weighted(DUMMY_json.momo.expression,PARAMETRIC_json.momo.expression, variance_expression);
        image_data_matrix(iteration_No+1,28) = difference(DUMMY_json.pose.yaw,PARAMETRIC_json.pose.yaw);
        image_data_matrix(iteration_No+1,29) = difference(DUMMY_json.pose.roll,PARAMETRIC_json.pose.roll);
        image_data_matrix(iteration_No+1,30) = difference(DUMMY_json.pose.pitch,PARAMETRIC_json.pose.pitch);
        image_data_matrix(iteration_No+1,31) = difference(DUMMY_json.environmentMap.coefficients,PARAMETRIC_json.environmentMap.coefficients);
    end
    image_data_matrix(:,[8 16 24 32]) = POSTERIORS((20*image_No+1):(20*image_No+20),:);
    save(fullfile("image_data",strcat("test",num2str(image_No),"_data_matrix")),"image_data_matrix")
end