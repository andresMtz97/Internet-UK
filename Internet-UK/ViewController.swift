//
//  ViewController.swift
//  Internet-UK
//
//  Created by DISMOV on 08/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    var internetMonitor = InternetMonitor()
    var image: UIImageView!
    var actI: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Crear objeto UIImagge y centrarlo en la vista
        image = UIImageView(frame: view.bounds)
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "apple.logo")
        self.view.addSubview(image)
        
        actI = UIActivityIndicatorView()
        actI.center = view.center
        self.view.addSubview(actI)
        actI.hidesWhenStopped = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if internetMonitor.isConnected {
            //Si hay conexión a internet, descarga la imagen
            let urlStr = "https://apod.nasa.gov/apod/image/2406/abell2744_jwst1024.png"
            if let url = URL(string: urlStr){
                self.actI.startAnimating()
                /*let datos = try Data(contentsOf: url)
                image.image = UIImage(data: datos)*/
                let request = URLRequest(url: url)
                let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
                let task = session.dataTask(with: request) { data, response, error in
                    DispatchQueue.main.async {
                        self.actI.stopAnimating()
                        if error == nil {
                            // todo ok, cargar la imagen en el imageview
                            self.image.image = UIImage(data: data!)
                        }
                    }
                }
                task.resume()
            }
//            image.image = UIImage(systemName: "apple.logo")
        } else {
            image.image = UIImage(systemName: "wifi.exclamationmark")
        }
    }


}

