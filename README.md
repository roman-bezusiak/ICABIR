# ICABIR

ICABIR - Identification of Clothes and Accessories Based on Image Recognition

## Configuration instructions

In [ICABIR.m]() file one should modify the lines to set the full path to the datasets:

```
%% Getting the data
% Full path of train images data set folder (subject to change)
trainImgFolder = fullfile();

% Full path of test images data set folder (subject to change)
testImgFolder = fullfile();
```

Reference on how to use "fullfile()": [MathWorks fullfile() documentation](https://se.mathworks.com/help/matlab/ref/fullfile.html)

### Remarks

1. "trainImgFolder" should point to ".../Datasets/Train"
2. "testImgFolder" should point to ".../Datasets/Test"
3. "Datasets" folder is optional 

## Installation instructions

1. Install the [ICABIR.m]()
2. Install the Fashion-MNIST dataset in .jpeg format from [Dropbox](https://www.dropbox.com/s/3sddmn90pf50zi6/Datasets.zip?dl=0)
3. Unzip the dataset
4. Follow configuration instructions

## Operating instructions

### Algorithm

1. User calls the ICABIR(x) function, while passing a singular integer value x, between 0 and 9 inclusively, which represents the object, NN should classify

```
0	T-shirt/top
1	Trouser
2	Pullover
3	Dress
4	Coat
5	Sandal
6	Shirt
7	Sneaker
8	Bag
9	Ankle boot
```

2. Importing layers of a convolutional neural network from digitsDAGnet.h5 modelfile. Layer structure is shown on [Fig. 1]()

## File manifest

### List

- **img** ( **_ _** )
	- correct_classification_result_ex.jpg
	- wrong_classification_result_ex.jpg
	- 
- **ICABIR.m**
- **README.md**

#### Total: **_ _** files

## Known bugs, problems and troubleshooting

None

## Credits and acknowledgments

### Authors:
- **Roman Bezusiak** - _Initial work_ - 
	[Roman Bezusiak ( GitHub profile )](https://github.com/roman-bezusiak)

### Used resources:
- **[Wikimedia Foundation Inc.](https://wikimediafoundation.org/wiki/Home), 
	Wikipedia** - _Encyclopedia materials_ - 
	[wikipedia.org](https://www.wikipedia.org/)
- **[]()**

### Used work:
- **Deep Learning Toolbox** - Base of the project - [chartjs.org](http://www.chartjs.org/)
- **mnist-csv-png** - Fashion-MNIST dataset convertion script - [jquery.com](https://jquery.com/)