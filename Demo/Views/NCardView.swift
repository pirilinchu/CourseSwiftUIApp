//
//  NCardView.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NCardView: View {
    let card: NCard

    var cardPrimaryColor: Color {
        Color.cyan.opacity(0.2)
    }

    var body: some View {
        switch card.type {
        case .small:
            CardSmallView()
        case .medium:
            CardMediumView()
        case .large:
            CardLargeView()
        }
    }

    @ViewBuilder
    func FavoriteButton() -> some View {
        Image(systemName: "heart")
            .foregroundStyle(Color.red)
    }

    @ViewBuilder
    func CardSmallView() -> some View {
        HStack {
            Text(card.title)
                .font(.headline)
                .lineLimit(2)
                .frame(width: 120)
                .padding(8)
                .background(cardPrimaryColor)
                .cornerRadius(8)
            Text(card.text)
                .font(.subheadline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            FavoriteButton()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
    }

    @ViewBuilder
    func CardMediumView() -> some View {
        VStack {
            HStack(alignment: .top) {
                Spacer()
                FavoriteButton()
            }
            Text(card.title)
                .font(.title2)
                .lineLimit(2)
                .padding(.vertical, 8)
                .padding(.horizontal, 30)
                .background(cardPrimaryColor)
                .cornerRadius(8)
            Text(card.text)
                .font(.body)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 150)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
    }

    @ViewBuilder
    func CardLargeView() -> some View {
        ZStack {
            VStack {
                ZStack(alignment: .bottom) {
                    cardPrimaryColor
                    Text(card.title)
                        .font(.title2)
                        .lineLimit(2)
                        .cornerRadius(8)
                        .padding(8)
                }
                ZStack {
                    Color.clear
                    Text(card.text)
                        .font(.body)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                }
            }
            VStack(alignment: .trailing) {
                HStack(alignment: .top) {
                    Spacer()
                    FavoriteButton()
                }
                Spacer()
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
        .frame(height: 200)
    }
}

#Preview {
    VStack {
        NCardView(
            card:
                NCard(title: "Grocery Shopping List",
                      text: "Milk, Bread, Eggs, Cheese, Apples, Carrots, and a few spices.",
                      type: .small
                     )
        )
        NCardView(
            card:
                NCard(title: "Meeting with Marketing Team",
                      text: "Discuss Q1 goals, review social media strategy, and allocate budgets for paid advertising.",
                      type: .small
                     )
        )
        NCardView(
            card:
                NCard(title: "Exercise Routine",
                      text: "Monday: Chest and Triceps\nTuesday: Back and Biceps\nWednesday: Legs and Core\nThursday: Shoulders\nFriday: Cardio and Abs",
                      type: .medium
                     )
        )
        NCardView(
            card:
                NCard(title: "Reading List for the Month",
                      text: "1. 'Atomic Habits' by James Clear\n2. 'The Pragmatic Programmer'\n3. 'SwiftUI Essentials' by Apple\n4. 'Clean Code' by Robert C. Martin",
                      type: .medium
                     )
        )
        NCardView(
            card:
                NCard(title: "Project Goals: Mobile App Launch",
                      text: """
                      Key objectives:
                      1. Complete UI/UX design by end of month.
                      2. Integrate authentication and payment features.
                      3. Conduct usability testing with at least 20 participants.
                      4. Prepare marketing materials for launch, including screenshots and video previews.
                      """,
                      type: .medium
                     )
        )
    }
    .padding()
}


