# EvalTree: Evaluating Peak-Capturing Performance of Time Series Forecasting Algorithms

## Introduction

**EvalTree** is a method developed as part of a research project titled "Evaluating Peak-Capturing Performance of Time Series Forecasting Algorithms." This method was originally created as part of a thesis titled [Evaluating Peak-Capturing Performance of Time Series Forecasting Algorithms](https://ndltd.ncl.edu.tw/cgi-bin/gs32/gsweb.cgi/login?o=dnclcdr&s=id=%22108NTHU5836014%22.&searchmode=basic).

Time series forecasting plays a crucial role in various domains, from predicting peak electricity usage to forecasting tourism demand during peak seasons. Accurate forecasting during peak or dip periods is of paramount importance, as inaccuracies can lead to significant consequences, such as blackouts, financial losses, or health risks. Traditional time series forecasting evaluation metrics, such as RMSE, MAE, and MAPE, focus on overall model performance and often fall short in assessing peak performance accurately.

**EvalTree** addresses this limitation by introducing an innovative evaluation approach designed specifically for measuring forecasting performance during peak periods. It leverages the power of regression trees to automatically identify the periods, including peaks and dips, that are the most challenging for forecasting methods. This approach allows analysts to evaluate and compare forecasting models effectively, especially when dealing with time series data containing known peak periods.

## Key Features

- **Peak-Centric Evaluation:** EvalTree's primary focus is on evaluating and comparing forecasting models based on their performance during peak or dip periods, rather than just overall accuracy.

- **Automatic Period Detection:** The method employs regression trees to automatically identify the periods that pose the greatest forecasting challenges for each model, making it easy to pinpoint areas for improvement.

- **Performance Comparison:** EvalTree generates comparison tables of performance measures for different forecasting models, highlighting their strengths and weaknesses on the most challenging periods identified by the tree.

## Getting Started

This section will guide you through the process of using **EvalTree** in your projects. Please note that the initial implementation of **EvalTree** is in R, but we are actively working on a Python implementation to make this method accessible to a wider audience across various fields.

### Prerequisites

- R (for the original R implementation)
- [Python (forthcoming)](link_to_python_implementation)

### Usage

- Detailed usage instructions, sample code, and examples will be provided in the project's documentation. Please refer to the documentation for comprehensive guidance on utilizing **EvalTree** effectively.

## Contributing

We welcome contributions from the community to enhance and expand the capabilities of **EvalTree**. If you have ideas, bug reports, or feature requests, please create an issue on this GitHub repository.

## License

This project is licensed under the MIT License. For more information, please refer to the [LICENSE](LICENSE) file.

## Acknowledgments

We would like to express our gratitude to the contributors of the M4 forecasting competition for providing valuable data that helped in the development and validation of **EvalTree**.

## Contact

For any inquiries or collaboration opportunities, please contact [Will Kuan](mailto:will.kuan@iss.nthu.edu.tw).

---

Thank you for your interest in **EvalTree**. We look forward to your contributions and hope that this method proves valuable in your time series forecasting endeavors.

