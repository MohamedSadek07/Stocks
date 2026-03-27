# Stocks App

An iOS app that displays real-time stock market data built with SwiftUI and MVVM architecture.

---

## Features

- Live stock list with name, price, and change %
- Auto-refresh every 8 seconds
- Search bar to filter stocks by name
- Detail screen for each stock

---

## Screens

**Stocks List**
- Fetches from `v2/markets/tickers`
- Shows name, price, and change %
- Auto-updates every 8 seconds
- Filter by name using the search bar

**Stock Detail**
- Fetches from `v1/markets/stock/modules`
- Shows country, city, phone, website, industry, and sector

---

## Architecture

MVVM with a Use Case layer.

```
View → ViewModel → UseCase → Repository → API
```

---

## Requirements

- iOS 16+
- Xcode 15+
- RapidAPI key for YH Finance
