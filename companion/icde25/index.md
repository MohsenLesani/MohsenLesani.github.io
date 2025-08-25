<div class="right"> 
 | [Home](../../index.html) | [Projects](../../index.html#projects) | [Papers](../../index.html#papers) |
</div>

**************************************************
<ul class="airlist">
- **Hamava: Fault-tolerant Reconfigurable Geo-Replication on Heterogeneous Clusters**
- ICDE '25 (IEEE International Conference on Data Engineering)
- Tejas Mane, Xiao Li, Mohsen Lesani, Mohammad Sadoghi
</ul>

Fault-tolerant replicated database systems consume significantly less energy than the compute-intensive proof-of-work blockchain. Thus, they are promising technologies for the building blocks that assemble global financial infrastructure. To facilitate global scaling, clustered replication protocols are essential in orchestrating nodes into clusters based on proximity. However, the existing approaches often assume a homogeneous and fixed model in which the number of nodes across clusters is the same and fixed, and often limited to a fail-stop fault model. This paper presents heterogeneous and reconfigurable clustered replication for the general environment with arbitrary failures. In particular, we present Hamava, a fault-tolerant reconfigurable geo-replication that allows dynamic membership: replicas are allowed to join and leave clusters. We formally state and prove the safety and liveness properties of the protocol. Furthermore, our replication protocol is consensus-agnostic, meaning each cluster can utilize any local replication mechanism. In our comprehensive evaluation, we instantiate our replication with both HotStuff and BFT-SMaRt. Experiments on geo-distributed deployments on Google Cloud demonstrate that members of clusters can be reconfigured without affecting transaction processing, and that heterogeneity of clusters may significantly improve throughput.

<ul class="airlist">
- \[[Paper](ICDE25.pdf)\]
- \[[BibTex](paper.bib)\]
</ul>

**************************************************
