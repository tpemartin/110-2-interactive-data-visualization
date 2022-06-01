
plot_ly(data=sf_electionsByYears$`2012`) |>
  add_sf(
    name=~地區,
    color=~`勝黨得票率區間2`,
    colors=twoPartyPals,
    alpha=1,
    line=list(color="white", width=0.4)
  ) -> plt
plt
buttonLegend = function(){
  list(
    label="Toggle legend",
    method= 'relayout',
    args=list(
      list(showlegend=F)
    ),
    args2=list(
      list(showlegend=T)
    )
  )
}
pltWithUpdateMenus = function(...){
  plt |> plotly::layout(
    updatemenus=list(
      list(
        type="buttons",
        buttons=list(...)
      )
    )
  )

}
pltWithUpdateMenus(buttonLegend())

# update election by years ------------------------------------------------

plt |> plotly_build() -> p

p |> View()
plt |> View()

pt=PlotlyTools()
pt$query_trace$Scatter()
pt$query_Scatter("fillcolor")
p[["x"]][["data"]][[1]][["fillcolor"]]
plt
plt |>
  plotly::style(
    fillcolor="red",
    traces=1
  )

# try to modify trace fillcolor -------------------------------------------


buttonRed = list(
  label="red",
  method='restyle',
  args=list(
    list(fillcolor=c("red", "yellow")),
    list(0,1)
  )
)

# 找出圖面上trace的地區名 ----------------------------------------------------------


purrr::map_chr(1:19, ~p$x$data[[.x]]$name)->
  tracenames
tracenames


fillcolor2016 = sf_electionsByYears$`2016`$得票率顏色
names(fillcolor2016) <- sf_electionsByYears$`2016`$地區


# 取出三年各縣市色碼 ---------------------------------------------------------------


purrr::map(1:3,
  ~{
    fillcolorx=sf_electionsByYears[[.x]]$得票率顏色
    names(fillcolorx) <- sf_electionsByYears[[.x]]$地區
    fillcolorx
  }) -> list_fillcolors
names(list_fillcolors) <- c(2012, 2016, 2020)
list_fillcolors$`2012`[tracenames]


# 定義buttons ---------------------------------------------------------------


button2012=list(
  label="2012",
  method="restyle",
  args=list(
    list(fillcolor=list_fillcolors$`2012`[tracenames])
  )
)
button2016=list(
  label="2016",
  method="restyle",
  args=list(
    list(fillcolor=list_fillcolors$`2016`[tracenames])
  )
)
button2020=list(
  label="2020",
  method="restyle",
  args=list(
    list(fillcolor=list_fillcolors$`2020`[tracenames])
  )
)
pltWithUpdateMenus(button2012, button2016, button2020)
