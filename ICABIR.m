function [] = ICABIR(objectLabel)
    %% Importing the TensorFlow-Keras Layers
    layers = importKerasLayers('digitsDAGnet.h5');

    %% Getting the data
    % Full path of train images data set folder (subject to change)
    trainImgFolder = fullfile( ...
        'C:', 'DATA', 'University', '2nd', ...
        'Basics of Mathematical Software, MATLAB', 'ICABIR', ...
        'Datasets', 'Train' ...
    );

    % Full path of test images data set folder (subject to change)
    testImgFolder = fullfile( ...
        'C:', 'DATA', 'University', '2nd', ...
        'Basics of Mathematical Software, MATLAB', 'ICABIR', ...
        'Datasets', 'Test' ...
    );

    % Creating container object for all train images and their labels
    imdsTrain = imageDatastore( ...
        %{
            Passing folder with train images data set
        %}
        trainImgFolder, ...
        ...
        %{
            Enabling subfolder inclusion
        %}
        'IncludeSubfolders', true, ...
        ...
        %{
            Enabling label acquisition from foldernames
        %}
        'LabelSource', 'foldernames' ...
    );

    % List of names of all images of the chosen type
    imageToClassifyNameList = dir( ...
        fullfile( ...
            %{
                Passing folder with test images data set
            %}
            testImgFolder, ...
            ...
            %{
                Convertion to UTF char of the object index,
                examples:
            
                    0 -> '0', 1 -> '1'
            %}
            char(objectLabel + 48), ...
            ...
            %{
                Choosing only all .png files
            %}
            '*.png' ...
        ) ...
    );

    % Name of a random image of the chosen type
    imageToClassifyName = imageToClassifyNameList( ...
        %{
            Choosing a random row
        %}
        randperm( ...
            %{
                Getting the number of elements in the vertical matrix
            %}
            numel(imageToClassifyNameList), ...
            ...
            %{
                Choosing only 1 random element
            %}
            1 ...
        ), ...
        ...
        %{
            In a vertical matrix amount of columns is always 1
        %}
        1 ...
    ).name; % Accessing the name property of a random data unit
    
    % Container of the random image of the chosen type
    imageToClassify = imread( ...
        fullfile( ...
            %{
                Passing folder with test images data set
            %}
            testImgFolder, ...
            ...
            %{
                Convertion to UTF char of the object index,
                examples:
            
                    0 -> '0', 1 -> '1'
            %}
            char(objectLabel + 48), ...
            ...
            %{
                Passing the name of the image to classify
            %}
            imageToClassifyName ...
        ) ...
    );

    %% Setting NN training options
    options = trainingOptions( ...
        %{
            Setting the stochastic gradient descent with momentum
            optimizer
        %}
        'sgdm', ...
        ...
        %{
            Setting max amount of epochs
        %}
        'MaxEpochs', 2, ...
        ...
        %{
            Setting the learning rate
        %}
        'InitialLearnRate', 0.001 ...
    );

    %% Training the NN
    NN = trainNetwork(imdsTrain, layers, options);
    
    %% Classifying the chosen image
    classificationResult = classify(NN, imageToClassify);
    
    %% Output figure settings
    %{
        Initializing object names in the increasing label corresonding*
        order

        * - all the labels are less by 1, than their index in the array,
        because the array starts with 1 and ends with 10
    %}
    objectNames = { ...    % Corresponding labels in the data set:
        'T-shirt/top', ... % 0
        'Trouser', ...     % 1
        'Pullover', ...    % 2
        'Dress', ...       % 3
        'Coat', ...        % 4
        'Sandal', ...      % 5
        'Shirt', ...       % 6
        'Sneaker', ...     % 7
        'Bag', ...         % 8
        'Ankle boot' ...   % 9
    };

    %{
        'classificationResult' value lies between 1 and 10 inclusively
    
        'classifiedObjectLabel' value has to lie between 0 and 9
        inclusively, because it represents labels in the data set
        
    %}
    classifiedObjectLabel = int8(classificationResult) - 1;
    classifiedObjectName  = char(objectNames{classifiedObjectLabel + 1});
    
    %{
        'objectLabel' value lies between 0 and 9 inclusively
    %}
    objectName  = char(objectNames{objectLabel + 1});
    objectLabel = char(objectLabel);
    
    titleText = ...
        %{
            Represents user input
        %}
        'User: ' + objectName + ' (' + objectLabel + ') | ' + ...
        ...
        %{
            Represents output of the NN classification
        %}
        'NN: ' + classifiedObjectName + ' (' + classifiedObjectLabel + ')';
    
    figure( ...
        'Name', 'Project ICABIR', ... % Setting the window name
        'Color', 'black' ...          % Setting the background colour
    );
    imshow( ...
        %{
            Passing the classified image
        %}
        imageToClassify, ...
        ...
        %{
            Scaling the image to be 10 times bigger
        %}
        'InitialMagnification', 1000 ...
    );
    title( ...
        titleText, ...       % Passing the title text
        'Color', 'white' ... % Setting text colour
    );
end