# Step 2:

*K8S Awesomeness*: Write a Kubernetes StatefulSet to run the above (step 1), using persistent volume claims and resource limits.

# What Kubernetes yaml file does:
- Use image created in last step with name `energi3:latest`
- Set a resource limit of 2 CPUs and 4 GB of RAM (as per Linux vps docs)
- Create a persistent volume of directory `/home/energi/.energicore` which is the data directory (as per Ubuntu migration docs)
- *Quick note: Just at this point I realise that username should be `nrgstaker` instaed of `energi3` like I created in previous step 1.*

# References:
- https://wiki.energi.world/docs/guides/linux-vps
- https://wiki.energi.world/docs/guides/upgrade-ubuntu-20-to-22
- https://kubernetes.io/docs/tasks/configure-pod-container/assign-cpu-resource/
- https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/