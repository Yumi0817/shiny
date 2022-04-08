#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)



#第7章 分享你的應用程序
#分享 Shiny 應用程序時，您有兩個基本選擇：

#將您的 Shiny 應用程序共享為 R 腳本。這是共享應用程序的最簡單方法，但僅當用戶在自己的電腦上安裝了 R。用戶就可以使用這些腳本從他們自己的 R 語言程式中啟動應用程序。
#將您的 Shiny 應用程序分享到網頁。這絕對是分享 Shiny 應用程序最佳的方式。用戶可以使用 Web 瀏覽器通過 Internet 到您的應用程序。

#共享 R 語言
#任何使用 R 語言程式的人都可以運行您的 Shiny 應用程序。

#要將文件發送給其他用戶，請通過電子郵件發送文件（可能以壓縮檔文件的形式。

#您的用戶可以將文件放入其工作目錄中的 app 目錄中。他們可以使用您在電腦上使用的相同命令在 R 語言中啟動應用程序。

# install.packages("shiny")
library(shiny)
runApp("app.R")

#Shiny 具有三個內置命令，可以輕鬆使用在線託管的文件：runUrl、runGitHub和runGist.
