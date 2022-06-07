#!/usr/bin/env python3

import os
import urllib.request


class Package:

    def __init__(self, name, org, version):
        self._name = name
        self._org = org
        self._version = version

    def get_name(self):
        return self._name

    def get_github_path(self):
        return "{}/{}".format(self._org, self._name)

    def get_github_archive_url(self):
        gh_url = "https://github.com"
        return f"{gh_url}/{self.get_github_path()}/archive/{self._version}.tar.gz"

    def get_archive_name(self):
        return f"{self._name}-{self._version}.tar.gz"

    def save_archive(self, dest_dir):
        if not os.path.exists(dest_dir):
            os.makedirs(dest_dir)
        url = self.get_github_archive_url()
        fname = self.get_archive_name()
        target_path = os.path.join(dest_dir, fname)
        print(f"Downloading {url} to {target_path}")
        urllib.request.urlretrieve(url, target_path)


packages = [
    Package("ansible-telegraf", "yunionio", "1.0.0"),
    Package("ansible-bootstrap-python", "mrlesmithjr", "master"),
    Package("ansible-cboard", "yunionio", "v0.0.1-yn"),
    Package("ansible-role-jenkins", "yunionio", "v0.0.1-yn"),
    Package("ansible-influxdb", "yunionio", "v0.0.1-yn"),
    Package("ansible-rabbitmq", "yunionio", "v0.0.1-yn"),
    Package("ansible-role-redis", "yunionio", "v0.0.1-yn"),
    Package("ansible-redis", "DavidWittman", "1.2.8"),
    Package("ansible-role-postgresql", "geerlingguy", "3.2.1"),
    Package("ansible-role-nginx", "geerlingguy", "3.1.1"),
    Package("ansible-role-java", "geerlingguy", "2.1.0"),
    Package("ansible-role-mysql", "yunionio", "v0.0.3-yn"),
    Package("ansible-role-mongodb", "yunionio", "v0.0.2-yn"),
    Package("tomcat-ansible-role", "zaxos", "1.4.0")
]


if __name__ == '__main__':
    target_dir = os.getenv("CACHE_DIR")
    if not target_dir:
        raise Exception("CACHE_DIR must provided")
    for p in packages:
        p.save_archive(target_dir)

