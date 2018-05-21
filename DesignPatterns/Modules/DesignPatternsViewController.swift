//
//  DesignPatternsViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/2/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

private enum CatalogOfDesignPatterns: Int {
    case creational, structural, behavioral
}

private enum CreationalDesignPatterns: Int {
    case factoryMethod, abstractFactory, builder, prototype, singleton
}

private enum StructuralDesignPatterns: Int {
    case adapter, composite, decorator, facade, bridge, proxy, flyweight
}

private enum BehavioralDesignPatterns: Int {
    case command, strategy, iterator, observer, templateMethod, state, mediator, chainOfResponsibility, memento, visitor
}

class DesignPatternsViewController: UITableViewController {
    private var selectedIndexPath: IndexPath?
    
    private var url: URL? {
        guard let selectedIndexPath = selectedIndexPath else {
            return nil
        }
        
        var urlString: String?
        
        switch selectedIndexPath.section  {
        case CatalogOfDesignPatterns.creational.rawValue:
            switch selectedIndexPath.row  {
            case CreationalDesignPatterns.factoryMethod.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/factory-method/structure.png"
            case CreationalDesignPatterns.abstractFactory.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/abstract-factory/structure.png"
            case CreationalDesignPatterns.builder.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/builder/structure.png"
            case CreationalDesignPatterns.prototype.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/prototype/structure.png"
            case CreationalDesignPatterns.singleton.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/singleton/structure.png"
            default:
                break
            }
        case CatalogOfDesignPatterns.structural.rawValue:
            switch selectedIndexPath.row  {
            case StructuralDesignPatterns.adapter.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/adapter/structure-object-adapter.png"
            case StructuralDesignPatterns.bridge.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/bridge/structure-en.png"
            case StructuralDesignPatterns.composite.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/composite/structure.png"
            case StructuralDesignPatterns.decorator.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/decorator/structure.png"
            case StructuralDesignPatterns.facade.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/facade/structure.png"
            case StructuralDesignPatterns.flyweight.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/flyweight/structure.png"
            case StructuralDesignPatterns.proxy.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/proxy/structure.png"
            default:
                break
            }
        case CatalogOfDesignPatterns.behavioral.rawValue:
            switch selectedIndexPath.row  {
            case BehavioralDesignPatterns.chainOfResponsibility.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/chain-of-responsibility/structure.png"
            case BehavioralDesignPatterns.command.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/command/structure.png"
            case BehavioralDesignPatterns.iterator.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/iterator/structure.png"
            case BehavioralDesignPatterns.mediator.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/mediator/structure.png"
            case BehavioralDesignPatterns.memento.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/memento/structure1-2x.png"
            case BehavioralDesignPatterns.observer.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/observer/structure.png"
            case BehavioralDesignPatterns.state.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/state/structure.png"
            case BehavioralDesignPatterns.strategy.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/strategy/structure.png"
            case BehavioralDesignPatterns.templateMethod.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/template-method/structure.png"
            case BehavioralDesignPatterns.visitor.rawValue:
                urlString = "https://refactoring.guru/images/patterns/diagrams/visitor/structure.png"
            default:
                break
            }
        default:
            break
        }
        
        guard urlString != nil else {
            return nil
        }
        
        return URL(string: urlString!)
    }
    
    // MARK: - View controller lifecycle
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let structureViewController = segue.destination as? StructureViewController else {
            return
        }

        structureViewController.url = url
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        selectedIndexPath = indexPath
        
        performSegue(withIdentifier: SegueIdentifier.toStructure, sender: self)
    }
}
