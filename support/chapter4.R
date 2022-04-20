dashboard0 <- function(){
  dashboardPage(
    dashboardHeader(
      title="經濟數據儀表板"
    ),
    dashboardSidebar(),
    dashboardBody()
  )
}
dashboard1 <- function(){
  dashboardPage(
    dashboardHeader(
      title="經濟數據儀表板"
    ),
    dashboardSidebar_custom(),
    dashboardBody_custom()
  ) -> tagUI
  tagUI |> econIDV::showWidget() # save time to show result
  invisible(tagUI) # return value only if there is a binding
}
dashboardBody_custom <- function(){
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
        h2("Dashboard tab content")
      ),
      tabItem(tabName = "widgets",
        h2("Widgets tab content")
      )
    )
  )
}
