# 🎬 MovieListing App with MVVM and SwiftUI

The MovieListing App is a simple iOS application built using SiftUI and follows the MVVM (Model-View-ViewModel) architecture pattern. It lists the top 250 movies using the IMDB API. Users can able to get the details of each movie in the detail screen which includes cast, rating and geners. This project demonstrates a scalable, maintainable, and testable architecture, leveraging dependency injection, protocol-oriented programming and separation of concerns.

<img width="603" height="1311" alt="Simulator Screenshot - iPhone 16 Pro - 2025-07-16 at 09 52 47" src="https://github.com/user-attachments/assets/d5e91bde-cb81-4b0f-9872-5fe3c1cc7c27" />
<img width="603" height="1311" alt="Simulator Screenshot - iPhone 16 Pro - 2025-07-16 at 09 53 03" src="https://github.com/user-attachments/assets/cbc715bf-8dac-45df-9789-07b549e39699" />

## 📦 Features
- Top 250 Movies List
- Detail Screen with Cast, Summary, and Rating
- Async Image loading
- SwiftUI + MVVM + SPM
- SwiftLint integration

## Project Structure

The project is organized into distinct layers, each responsible for specific concerns:

## Model: 

 -**Movie.swift**: Contains the data model Struct Movie conforming to Codable protocol.

## View:

 -**ContentView.swift**: List the top 250 movies.
 -**MovieDetailView.swift**: Display the movie poster, rating, summary, genres and cast.
 
## ViewModel: 

 -**MovieViewModel.swift**: Contains the business logic to fetch the movie list.
 -**MovieDetailsViewModel.swift**: Contains the business logic to show the movie details.
 
## 🚀 Getting Started

1. Clone the repo:
```bash
git clone https://github.com/Nathiya1/MovieListing.git
