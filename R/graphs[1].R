## graphs

library(readxl)
df_province_con <- read_excel("trend_provinces.xlsx", sheet=1)
df_province_try <- read_excel("trend_provinces.xlsx", sheet=2)
df_region_con <- read_excel("trend_regions.xlsx", sheet=1)
df_region_try <- read_excel("trend_regions.xlsx", sheet=2)
df_ratio <- read_excel("urban_rural_ratio.xlsx", sheet=2)

library(reshape2)
df_province_con <- melt(df_province_con)
df_province_try <- melt(df_province_try)
names(df_province_con) <- c("region", "Year", "Proportion")
names(df_province_try) <- c("region", "Year", "Proportion")

library(ggplot2)
library(gcookbook)
library(showtext)
font_add("tmr", "C:\\Windows\\Fonts\\times.ttf")
showtext_auto()

shapes <- c(1, 2, 3, 4, 5)
colorchip <- c("#FF607F", "#0A6ECD")

#도별 청소년 알코올 소비 비율의 변화
ggplot(df_province_con, aes(x=Year, y=Proportion, group=region)) +
  geom_line(aes(color = region), linewidth=1) +
  geom_point(aes(color = region, shape=as.factor(region), size=as.factor(region))) +
  scale_color_discrete(breaks=c("Gyeonggi", "Gangwon", "Chungcheong", "Jeolla", "Gyeongsang")) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1), text=element_text(family = "tmr")) +
  ylab("Proportion (%)") +
  scale_shape_manual(values=c(17, 16, 15, 18, 20)) +
  scale_size_manual(values = c(4, 4, 4, 4, 4))

#도별 청소년 알코올 구매 시도 비율의 변화
ggplot(df_province_try, aes(x=Year, y=Proportion, group=region)) +
  geom_line(aes(color = region), linewidth=1) +
  geom_point(aes(color = region, shape=as.factor(region), size=as.factor(region))) +
  scale_color_discrete(breaks=c("Gyeonggi", "Gangwon", "Chungcheong", "Jeolla", "Gyeongsang")) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1), text=element_text(family = "tmr")) +
  ylab("Proportion (%)") +
  scale_shape_manual(values=c(17, 16, 15, 18, 20)) +
  scale_size_manual(values = c(4, 4, 4, 4, 4))

#지역별 청소년 알코올 소비 비율의 변화
ggplot(df_region_con, aes(x=Period, y=Proportion, group=region, fill=region, shape=region, color=region)) +
  geom_line(aes(color=region), position=position_dodge(0.2), size=1) +
  geom_point(aes(color=region), position=position_dodge(0.2), size=3) +
  geom_errorbar(aes(color=region, ymin=min, ymax=max), position="dodge", width=0.2, size=1) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1), text=element_text(family = "tmr")) +
  xlab("Year") +
  ylab("Proportion (%)") +
  scale_color_manual(values=colorchip) +
  scale_shape_manual(values=c(15, 17))

#지역별 청소년 알코올 구매 시도 비율의 변화
ggplot(df_region_try, aes(x=Period, y=Proportion, group=region, fill=region, shape=region, color=region)) +
  geom_point(position=position_dodge(0.2), size=3) +
  geom_line(position=position_dodge(0.2), size=1) +
  geom_errorbar(aes(ymin=min, ymax=max), position="dodge", width=0.2, size=1) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1), text=element_text(family = "tmr")) +
  xlab("Year") +
  ylab("Proportion (%)") +
  scale_color_manual(values=colorchip) +
  scale_shape_manual(values=c(15, 17))

#도별 도시 및 시골의 비율
ggplot(df_ratio, aes(x=Provinces, y=Proportion, fill=region)) +
  scale_x_discrete(limits=c("Gyeonggi", "Gangwon", "Chungcheong", "Jeolla", "Gyeongsang")) +
  geom_col(position=position_stack(reverse=TRUE)) +
  geom_text(aes(label=scales::percent(Proportion)), position=position_stack(.5, reverse=TRUE)) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1), text=element_text(family = "tmr")) +
  ylab("Proportion (%)") +
  scale_fill_manual(values=colorchip)

