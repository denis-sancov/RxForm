//
//  DepositReview.swift
//  RxForm
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

@testable import RxForm

enum DepositReviewRow : CaseIterable, Identity {
    case type,
         account,
         agency,
         amount,
         rate,
         term,
         openDate,
         autoRenewal,
         personalData,
         cardTerms,
         offer

    var caption: String? {
        switch self {
        case .type: return ""
        case .agency: return ""
        default:
            return nil
        }
    }
}


//func createForm() {
//    let form = Form<DepositReviewRow> {
//        Defaults<DepositReviewRow> {
//            $0.set(value: DepositReviewType.account, identity: .type)
//
//            $0.set(value: 100, identity: .amount)
//
//            $0.set(value: Date(), identity: .openDate)
//
//            $0.set(value: false, identity: .autoRenewal)
//            $0.set(value: false, identity: .personalData)
//            $0.set(value: false, identity: .cardTerms)
//            $0.set(value: false, identity: .offer)
//
//            return .just(())
//        }
//
//        Rules<DepositReviewRow> { store in
//            let ticks: [DepositReviewRow] = [.personalData, .offer]
//            let type = store.value(identity: .type, default: DepositReviewType.account)
//
//            //                            var isValid = if (type == DepositReviewType.NewCard) {
//            //                                ticks.add(DepositReviewRow.CardTerms)
//            //
//            //                                store.contains(DepositReviewRow.Agency)
//            //                            } else {
//            //                                store.contains(DepositReviewRow.Account)
//            //                            }
//            //
//            //                            isValid = isValid && ticks.firstOrNull { store.get<Boolean>(it) == false } == null
//
//
//            return .just(false)
//        }
//
//
//
//    }
//
//}
