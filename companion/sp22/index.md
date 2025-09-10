<div class="right"> 
 | [Home](../../index.html) | [Projects](../../index.html#projects) | [Papers](../../index.html#papers) |
</div>

**************************************************
<ul class="airlist">
- **Hamraz: Resilient Partitioning and Replication**
- S&P'22 (IEEE Symposium on Security and Privacy)
- Xiao Li, Farzin Houshmand, Mohsen Lesani
</ul>

Inter-organizational systems where subsystems with partial trust need to cooperate are common in healthcare, finance and military. In the face of malicious Byzantine attacks, the ultimate goal is to assure end-to-end policies for the three aspects of trustworthiness: confidentiality, integrity and availability. In contrast to confidentiality and integrity, provision and validation of availability has been often sidestepped. This paper guarantees end-to-end policies simultaneously for all the three aspects of trustworthiness. It presents a security-typed object-based language, a partitioning transformation, an operational semantics, and an information flow type inference system for partitioned and replicated classes. The type system provably guarantees that well-typed methods enjoy noninterference for the three properties, and that their types quantify their resilience to Byzantine attacks. Given a class and the specification of its end-to-end policies, the Hamraz tool applies type inference to automatically place and replicate the fields and methods of the class on Byzantine quorum systems, and synthesize trustworthy-by-construction distributed systems. The experiments show the resiliency of the resulting systems; they can gracefully tolerate attacks that are as strong as the specified policies.

<ul class="airlist">
- \[[Paper](SP22.pdf)\]
- \[[Type System Code](https://github.com/XiaoLi0614/Secure_Partition)\]
- \[[Runtime Code](https://github.com/fhoushmand/bft-library)\]
</ul>

```bibtex
@inproceedings{li2022hamraz,
  title={Hamraz: Resilient partitioning and replication},
  author={Li, Xiao and Houshmand, Farzin and Lesani, Mohsen},
  booktitle={2022 IEEE Symposium on Security and Privacy (SP)},
  pages={2267--2284},
  year={2022},
  organization={IEEE}
}
```

**************************************************
