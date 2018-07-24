%h5disp('bfm/model2017-1_face12_nomouth.h5','/color/model/pcaVariance')
plot_data_first5 = zeros(20,32);
plot_data_6_to_50 = zeros(20,32);
for image_No=0:9
    image_data_first5 = load(fullfile("image_data",strcat("test",num2str(image_No),"_data_matrix_first5")));
    plot_data_first5 = plot_data_first5 + image_data_first5.image_data_matrix;
    image_data_6_to_50 = load(fullfile("image_data",strcat("test",num2str(image_No),"_data_matrix_6_to_50")));
    plot_data_6_to_50 = plot_data_6_to_50 + image_data_6_to_50.image_data_matrix;
end
plot_data_first5 = plot_data_first5.*(1/10);
plot_data_6_to_50 = plot_data_6_to_50.*(1/10);

fig = figure("Name","average over 10 images");
annotation('textbox', [0 0.95 1 0.05], ...
    'String', 'Evaluation of the "hands-random"-dataset (first 5 parameters solid, others dotted)', ...
    'FontWeight', 'bold', ...
    'FontSize', 20, ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
titles = ["shape","color","expression","yaw","roll","pitch","environmentMap","posterior"];
iterations = 0:19;
for i=0:7
    subplot(2,4,i+1), plot(iterations,plot_data_first5(:,1+i),'-b')
    hold on
    plot(iterations,plot_data_first5(:,9+i),'-r')
    plot(iterations,plot_data_first5(:,17+i),'-g')
    plot(iterations,plot_data_first5(:,25+i),'-m')
    
    if(i<=3)
        plot(iterations,plot_data_6_to_50(:,1+i),':b')
        plot(iterations,plot_data_6_to_50(:,9+i),':r')
        plot(iterations,plot_data_6_to_50(:,17+i),':g')
        plot(iterations,plot_data_6_to_50(:,25+i),':m')
        legend("GROUNDTRUTH","FCN","EGGER","NO MASK")
    end
    
    legend("GROUNDTRUTH","FCN","EGGER","NO MASK")
    title(titles(i+1))
    xlabel("iterations")
    if(i==7)
        ylabel("posterior")
    else
        ylabel("ave. error")
    end
    xlim([0 19])
    xticks([0 5 10 15 19])
    hold off
end