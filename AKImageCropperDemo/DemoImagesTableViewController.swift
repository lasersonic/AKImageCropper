//
//  DemoImagesTableViewController.swift
//  AKImageCropperDemo
//  GitHub: https://github.com/artemkrachulov/AKImageCropper
//
//  Created by Krachulov Artem
//  Copyright (c) 2015 Krachulov Artem. All rights reserved.
//  Website: http://www.artemkrachulov.com/
//

import UIKit

class DemoImagesTableViewController: UITableViewController {
    
    // MARK: - Demo images
    //         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
    
    let images = [
        ["Attractive-girl","Autumn-background", "Colorful-pillows"],
        ["Cupcakes","Funnel-cake-stand", "Image-of-earth"]
    ]
    
    // MARK: - Table view data source
    //         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return section == 0 ? "Large" : "Small"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return images.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return images[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "image", for: indexPath) 
        
        let name = images[indexPath.section][indexPath.row]
        let image = UIImage(named: name)

        // Configure the cell...
        cell.textLabel!.text = name.components(separatedBy: "-").joined(separator: " ")
        cell.detailTextLabel?.text = String(format: "Size %0.1f x %0.1f", image?.size.width as CGFloat!, image?.size.height as CGFloat!)
        
        return cell
    }
    
    // MARK: - Navigation
    //         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedPath = tableView.indexPathForSelectedRow as IndexPath!

        if let vc = segue.destination as? CropperViewController {
            
            vc._image = UIImage(named: images[(selectedPath?.section)!][(selectedPath?.row)!])
        }
    }
    
    // MARK: - Actions
    //         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
    
    @IBAction func closeBtn(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
