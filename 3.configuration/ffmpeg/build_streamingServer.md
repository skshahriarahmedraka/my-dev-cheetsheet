1. basic file system 

2. embeded data storage 

3. sub Process command 

4. simple web server

5. little web development 

## Basic Filesystem

1. recursive Crawling 

2. Detect Mime Type

3. Collect/continue

```
func ScanDir(path string) ([]MovieDirInfo,error){
    var listMovie []MovieDirInfo
    listItems,_:=ioutil.ReadDir(path)

    for _,item:=range listItems {
        detectedMovies,_ := Identify(path,item)
        listMovie =append(listMovie,detectMovies...)
    }
    return listMovie,nil
}
```

```
func Identify(basePath string,file os.FileInfo)([]MovieDirInfo,error){
    var listMovie []MovieDirInfo
    if file.IsDir(){
        listMovie, err := ScanDir(filepath.Join(basePath,file.Name()))
        return listMovie,err
    }
    if mime,validVideo := isVideo(filepath.Join(basePath,file.Name()));validVideo{
        listMovie = append(listMovie,MovieDirInfo{
                MovieFile: file.Name(),
                MimeType:mime,
            })
    }
    return listMovie, nil 
}
```

## Embeded Data Storage
self-contained, server-less, zero-configuration, transactional SQL database engine

| dir_path | dir_name | base_name | file_size | mime_type | is_prepared |
|----------|----------|----------|----------|----------|----------|
| /home/movies | bug duck bunny | big_duckbunny.mp4 | 5.51(MB) | video/mp4 | false |


```
func main() {
    dbConn,err := repository.OpenDB(getDBPath())
    if err !=nil {
        panic("Unable to create DB Connection")
    }
    defer dbConn.Close()
    repository.Migrate(dbConn)
    ...
    ...
}
```

```
import github.com/jinzhu/gorm 

func openDB(dbPath string) (*gorm.DB,error) {
    db,err := gorm.Open("sqlite3",dbPath)
    if err != nil {
        return nil ,err
    }
    return db, nil
}

func Migrate(db *gorm.DB) {
    db.AutoMigrate(&models.Movie{})
}

```
