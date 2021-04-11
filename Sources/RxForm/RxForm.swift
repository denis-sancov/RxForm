import RxSwift

struct RxForm {
    var text = "Hello, World!"
}


enum SignUpIdentity: String {
    case one, second, third
}

extension SignUpIdentity: Identity {
}


let form = Form<SignUpIdentity> {
    Defaults<SignUpIdentity> { store in
        return .empty()
    }

    Observers<SignUpIdentity> {
        $0.observe(identities: .one)
        $0.observe(identities: .second, .third) { (store, identity) in
            return .empty()
        }
    }

//    Bindings {
//        BindingPair(identity: SignUpIdentity.one, binding: <#T##AnyBinding#>)
//    }
    

//    Resolver<TypeBindingStrategy, SignUpIdentity> {
//
////        ConcreteBinding(ids: [.one]) { (_, _) in
////
////        }
//    }

//    Resolver(strategy: ., builder: <#T##() -> [AnyBinding]#>)
//
//    Bindings<SignUpIdentity> {
//        SecBinding<SignUpIdentity>(row: SwitchRow.jn)
//    }
}

//let picker = TestBinding<PickerRow, SignUpIdentity>(ids: .one, .second) { id in
//    return .init(caption: "")
//}

//let resolver = KeyResolver {
////    PickerRow.self
////    TestBinding()
////    TestBinding()
//}

//resolver.resolve(identity: SignUpIdentity.one, params: <#T##Row.Params#>, store: <#T##Store<Identity>#>)

//let typeResolver = TypeResolver<SignUpIdentity> {
//
//}
