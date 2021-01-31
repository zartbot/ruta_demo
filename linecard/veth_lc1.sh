sudo ip link add veth0 type veth peer name veth1
sudo ip netns add vrf1234
sudo ip link set veth1 netns vrf1234
sudo ifconfig veth0 up
sudo ip netns exec vrf1234 ifconfig veth1 1.0.0.88/24 up
#sudo ip netns exec vrf1234 ping 1.0.0.1
