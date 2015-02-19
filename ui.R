library(shiny)
shinyUI(pageWithSidebar(
headerPanel("Central Limit Theorem Demo"),
sidebarPanel(
sliderInput("n",
"Number of samples:",
min = 1,
max = 2500,
value = 100),
sliderInput("bins",
"Number of bins:",
min = 1,
max = 100,
value = 20),
withMathJax(),
uiOutput('population_mean'),
uiOutput('sample_means_mean'),
uiOutput('population_sd'),
uiOutput('sample_means_mean_sd'),
h4("Documentation"),
helpText("The app allows you to see the Central Limit Theorem in action. This is a key concept for statistics & statistical modeling."),
helpText("Check out how the values change as you alter the number of samples and the number of bins."),
mainPanel(
plotOutput("distPlot", height = "300px", width="80%"),
plotOutput("sampleDistPlot", height = "300px", width="80%")
)
))
