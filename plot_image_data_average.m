%h5disp('bfm/model2017-1_face12_nomouth.h5','/color/model/pcaVariance')
plot_data = zeros(20,32);
for image_No=0:9
    image_data = load(fullfile("image_data",strcat("test",num2str(image_No),"_data_matrix")));
    plot_data = plot_data + image_data.image_data_matrix;
end
plot_data = plot_data.*(1/10);
fig = figure("Name","average over 10 images");
annotation('textbox', [0 0.95 1 0.05], ...
    'String', 'Evaluation of the "micros"-dataset', ...
    'FontWeight', 'bold', ...
    'FontSize', 20, ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
titles = ["shape","color","expression","yaw","roll","pitch","environmentMap","posterior"];
iterations = 0:19;
%positions = {1,2,3,5,6,7,[4 8]};
for i=0:7
    subplot(2,4,i+1), plot(iterations,plot_data(:,1+i))
    hold on
    plot(iterations,plot_data(:,9+i))
    plot(iterations,plot_data(:,17+i))
    plot(iterations,plot_data(:,25+i))
    legend("GROUNDTRUTH","FCN","EGGER","NO MASK")
    title(titles(i+1))
    xlabel("iterations")
    if(i==7)
        ylabel("posterior")
    else
        ylabel("ave. error")
    end
    xlim([10 19])
    xticks([0 5 10 15 19])
    hold off
end