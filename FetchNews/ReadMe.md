# ReadMe

<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

## Overview

<!--@START_MENU_TOKEN@-->Text<!--@END_MENU_TOKEN@-->

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->

 l
 #IOS Test Assessment
  ## Task Description:
 ### Problem Description: Develop a straightforward iOS application that retrieves data from a public API endpoint and presents it in a paginated list format. However, the API response contains a substantial dataset, and each list item necessitates intensive computation to display additional details. Your objective is to optimize the application using iOS development best practices, ensuring efficient rendering and data management.
  
## Requirements:
 ### 1. Data Fetching and Rendering:
    - Fetch data from the provided API endpoint `https://jsonplaceholder.typicode.com/posts` with support for pagination.
    - Display the fetched data in a UITableView or UICollectionView component with pagination.
    - Each item in the list should present the fetched data, including the `id` and `title` fields.
 ### 2. Pagination:
    - Implement pagination to fetch and display data in batches, enhancing user experience and optimizing performance.
    - Load more data as the user scrolls through the list.
 ### 3. Heavy Computation Optimization:
    - list item requires intensive computation to display additional details. Implement optimized algorithms to handle heavy computation efficiently.
    - Log the time taken for the heavy computation process. Each
 ### 4. Callback Memorization:
    - Develop a detailed view for each list item that reveals additional information upon selection.
    - Pass necessary data from the selected item to the detailed view using segues or other appropriate mechanisms.
    - Employ memorization of callback functions to prevent unnecessary re-computation or re-rendering.
 
 ## Purpose:
 This task aims to evaluate your iOS development skills, encompassing data fetching, pagination, optimization techniques, and adherence to best practices.
 Submission:
 Please complete the task on your local iOS development environment and record a brief demo video demonstrating your solution. Subsequently, upload your code to a public GitHub repository and furnish us with the link alongside the demo video.
 API Documentation:
 JSONPlaceholder API Documentation: [JSON Placeholder API] (https://jsonplaceholder.typicode.com/)
 follow this documentation
 https://github.com/typicode/json-server/tree/v0?tab=readme-ov-file
 For Example :
 1) https://jsonplaceholder.typicode.com/posts?_page=1&_limit=10 ( Page 1 with limit 10) 

