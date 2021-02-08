import UIKit

class RootViewController: UIViewController {
   
    @IBOutlet weak var countryTableView: UITableView!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "세계 날씨"
        
        countryTableView.delegate = self
        countryTableView.dataSource = self
       
    }


}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension RootViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherManager.countryName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = countryTableView.dequeueReusableCell(withIdentifier: Constants.cellNames.cellIdentifierForCountry, for: indexPath)
        
        cell.imageView?.image = weatherManager.countryImage[indexPath.row]
      
        cell.textLabel?.text = weatherManager.countryName[indexPath.row]
        
        return cell
    }
    
    
    
    
    
}
