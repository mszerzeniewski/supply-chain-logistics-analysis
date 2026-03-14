# Analiza Opóźnień Dostaw i Rentowności (DataCo)

## Cel projektu
Analiza wąskich gardeł w łańcuchu dostaw oraz identyfikacja produktów Klasy A najbardziej narażonych na opóźnienia.

## Wykorzystane technologie
* **SQL (MySQL):** Czyszczenie danych, tworzenie widoków, transformacja typów danych.
* **Power BI:** Modelowanie danych, DAX, wizualizacja (Dark Mode).

## Zakres prac
1. **Przygotowanie danych (SQL):** 
   - Konwersja dat z formatu tekstowego (`STR_TO_DATE`).
   - Obliczenie różnicy między planowaną a faktyczną dostawą (*shipping_gap*).
   - Stworzenie widoku `v_clean_orders` konsolidującego kluczowe metryki.
2. **Analiza i Wizualizacja (Power BI):**
   - Wdrożenie dynamicznej analizy Pareto (Klasyfikacja ABC) w celu wyłonienia najbardziej dochodowych produktów.
   - Stworzenie miar porównawczych rok do roku (YoY) dla przychodów i wskaźnika opóźnień.
   - Analiza trybów dostawy (Shipping Mode).

## Kluczowy wniosek
Analiza wykazała, że usługa **First Class** posiada wskaźnik opóźnień na poziomie **94,5%**, co stanowi krytyczny punkt zapalny dla produktów generujących najwyższy obrót (Klasa A).

## Pliki w repozytorium
* `data_cleaning.sql` - skrypt przygotowujący dane.
* `dashboard.png` - zrzut ekranu gotowego raportu.
