# alcohol_trend
알코올 소비 관련 트렌드 분석 논문 관련 코드 파일

## Usage
* beta coefficient, beta difference, OR, rOR 등 계산
* baseline characteristics
* trend 및 proportion 시각화

## Time
* 2023

## Prerequisite
* dplyr (characteristics.R)
* gcookbook (graphs.R)
* ggplot2 (graphs.R)
* readxl (graphs.R)
* reshape2 (graphs.R)
* showtext (graphs.R)

## Directories & Files
* SAS: beta coefficient, beta difference, OR, rOR 등을 계산해 출력하는 코드 및 관련 데이터
  * merging_final_weight.sas: SAS 코드
  * trend_analysis_code.sas: SAS 코드
  * 참고_syntax.pdf: 코드 이해를 위한 설명
  * 변수 Codebook.xlsx:  변수 이해를 위한 codebook
* R: baseline characteristics와 trend 시각화 코드 및 관련 데이터
  * characteristics.R: baseline characteristics을 위한 R 코드
  * graphs.R: trend 및 proportion 시각화를 위한 R 코드
  * trend_provinces.xlsx: province 별 trend 분석을 위한 데이터 table
  * trend_regions.xlsx: region 별 trend 분석을 위한 데이터 table
  * urban_rural_ratio.xlsx: province 별 urban과 rural의 비율을 시각화하기 위한 데이터 table
