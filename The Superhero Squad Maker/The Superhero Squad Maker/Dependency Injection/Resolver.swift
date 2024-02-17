//
//  Resolver.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 15.02.24.
//

import Foundation
import Swinject

//@MainActor
//final class Resolver {
//    let container: Container = Container()
//    static let shared = Resolver()
//
//    private init() {
//        registerDependencies()
//    }
//
//    private func registerDependencies() {
//        let serviceAssemblies = ServiceAssembly.all
//        serviceAssemblies.forEach { $0.assemble(container: container) }
//
//        let moduleAssemblies = ModuleAssembly.all
//        moduleAssemblies.forEach { $0.assemble(container: container) }
//
//        let coordinatorAssemblies = CoordinatorAssembly.all
//        coordinatorAssemblies.forEach { $0.assemble(container: container) }
//
//        let networkAssemblies = NetworkAssembly.all
//        networkAssemblies.forEach { $0.assemble(container: container) }
//
//        let dataContainerAssembly = DataContainerAssembly.all
//        dataContainerAssembly.forEach { $0.assemble(container: container) }
//    }
//
//    func resolve<T>(_: T.Type) -> T {
//        container.resolve(T.self)!
//    }
//}

