#Droplet Buildpack

A proof-of-concept Cloud Foundry buildpack to allow uploading compiled droplets. For discussion puposes only, do not use this in production.

Additional information can be found [on the CloudCredo website](http://cloudcredo.com/a-droplet-of-value/).

##Options for creating a droplet

###Using the droplet endpoint

https://www.pivotaltracker.com/n/projects/966314/stories/95890146

###Using Diego's SSH-to-container functionality

Transfer your staged application out from a running container using https://github.com/cloudfoundry-incubator/diego-ssh .

###Using the Condenser

https://www.pivotaltracker.com/epic/show/1820828

###Using Cloud Rocker (preferred option at time of writing)

Follow [the Cloud Rocker installation instructions](https://github.com/CloudCredo/cloudrocker#tutorial).

Create a droplet from a sample app

```
$ git clone https://github.com/CloudCredo/cloudrocker
$ cd cloudrocker/sample-apps/go/
$ rock add-buildpack https://github.com/cloudfoundry/go-buildpack
$ rock up && rock off
```
Your compiled droplet should now be in ~/cloudrocker/droplet/ .

##Using the Droplet Buildpack

Change directory to your droplet's home
```
$ cd ~/cloudrocker/droplet/
```

Push your droplet to Cloud Foundry
```
$ cf push -b https://github.com/CloudCredo/droplet-buildpack test-go-app

...

Showing health and status for app test-go-app in org test / space test as admin...
OK

requested state: started
instances: 1/1
usage: 256M x 1 instances
urls: test-go-app.10.244.0.34.xip.io
last uploaded: Sun Jul 19 15:05:02 UTC 2015
stack: cflinuxfs2

     state     since                    cpu    memory       disk      details   
#0   running   2015-07-19 04:05:14 PM   0.0%   3M of 256M   0 of 1G      


```
View the app on the supplied URL


Note: this was tested with the Go buildpack buildpack version 1.3.1.

##Contributing

Please fork and pull request.

###Testing

With the [standard buildpack testing tools](https://github.com/cloudfoundry/ci-tools) in your PATH
```
buildpack-build online cf_spec
```
