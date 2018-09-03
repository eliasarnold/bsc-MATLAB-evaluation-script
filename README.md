# bsc-MATLAB-evaluation-script

### USAGE
1. Copy the outputs of the fitting into the subfolders of `MATLAB_EVALUATION_SCRIPT`. A detailed description of this process can be found in the documentation of the corresponding thesis or in the "TODO.txt" files inside each folder. 
2. Create a folder named `image_data` inside the repository.
3. Follow the steps inside the `posteriors` folder.
4. Update the for-loop in both MATLAB-Scrips starting with `difference...`, to loop over all the files\(line 12\). Then run it.
5. Update the for-loop in the MATLAB-Script `plot_image_data_average.m` on line 4 to run over all the target images. Then run it to produce the errorplots.
6. Update line 2 in the MATLAB-Script `segmentation_fit_iteration.m`, then run it to produce a plot which shows the differences of the masks over time.

