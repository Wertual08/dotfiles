#!/usr/bin/python3

from typing import override
from collections.abc import Iterable
import dbus
import json
import dataclasses


class EnhancedJSONEncoder(json.JSONEncoder):
    @override
    def default(self, o: Iterable[object]):
        if dataclasses.is_dataclass(o):
            return dataclasses.asdict(o)
        return super().default(o)


@dataclasses.dataclass
class Network(object):
    path: str
    name: str
    device: str
    variant: str
    strength: int


@dataclasses.dataclass
class KnownNetwork(object):
    path: str
    name: str
    variant: str
    hidden: bool
    auto_connect: bool
    last_connected_time: str


@dataclasses.dataclass
class State(object):
    device: str
    connected: Network
    networks: list[Network]
    known_networks: list[KnownNetwork]


ADAPTER_HANDLE = 'net.connman.iwd.Adapter'


bus = dbus.SystemBus()

manager = dbus.Interface(
    bus.get_object("net.connman.iwd", "/"),
    "org.freedesktop.DBus.ObjectManager",
)

def parse_adapters(manager: dbus.Interface):
    objects = manager.GetManagedObjects()

    adapter_paths = []
    for path, obj in objects.items():
        if ADAPTER_HANDLE not in obj:
            continue

        adapter_paths.append(path)

    adapters = {}
    for path, obj in objects.items():
        found = None
        for adapter_path in adapter_paths:
            if path.startswith(adapter_path):
                if adapter_path not in adapters:
                    adapters[adapter_path] = {}

                adapter = adapters[adapter_path]

                for key, value in obj.items():
                    adapter[key] = value

                break

    return adapters

adapters = parse_adapters(manager)
    
print(json.dumps(adapters, indent=2))
#def collect(objects):
#    Obj = collections.namedtuple('Obj', ['interfaces', 'children'])
#    tree = Obj({}, {})
#    for path in objects:
#        node = tree
#        elems = path.split('/')
#        subpaths = ['/'.join(elems[:s + 1]) for s in range(1, len(elems))]
#        for subpath in subpaths:
#            if subpath not in node.children:
#                node.children[subpath] = Obj({}, {})
#            node = node.children[subpath]
#        node.interfaces.update(objects[path])
#
#    return tree

#while True:
#    states = []
#    objects = manager.GetManagedObjects()
#
#    tree = collect(objects)
#    root = tree.children['/net'].children['/net/connman'].children['/net/connman/iwd']
#
#    for path, phy in root.children.items():
#        if 'net.connman.iwd.Adapter' not in phy.interfaces:
#            continue
#
#        for path2, device in phy.children.items():
#            if 'net.connman.iwd.Device' not in device.interfaces:
#                continue
#
#            state = State(
#                path2,
#                None,
#                [],
#                [],
#            )
#
#            for interface in device.interfaces:
#                if interface.rsplit('.', 1)[-1] != 'Station':
#                    continue
#
#                station = dbus.Interface(
#                    bus.get_object("net.connman.iwd", path2),
#                    'net.connman.iwd.Station',
#                )
#
#                properties = device.interfaces[interface]
#                if not properties["Scanning"]:
#                    station.Scan()
#
#                connected_network_path = properties["ConnectedNetwork"]
#
#                for path3, rssi in station.GetOrderedNetworks():
#                    properties2 = objects[path3]['net.connman.iwd.Network']
#
#                    network = Network(
#                        path3,
#                        properties2["Name"],
#                        properties2["Device"],
#                        properties2["Type"],
#                        rssi / 100,
#                    )
#
#                    if network.path == connected_network_path:
#                        state.connected = network
#                    else:
#                        state.networks.append(network)
#
#            states.append(state)
#
#    print(json.dumps(states, cls=EnhancedJSONEncoder))
#
#    time.sleep(1)
