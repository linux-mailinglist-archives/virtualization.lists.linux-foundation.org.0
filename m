Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4405846DF22
	for <lists.virtualization@lfdr.de>; Thu,  9 Dec 2021 00:57:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 978956074C;
	Wed,  8 Dec 2021 23:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKsfN0My3U7w; Wed,  8 Dec 2021 23:57:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9C753606C0;
	Wed,  8 Dec 2021 23:57:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23293C0038;
	Wed,  8 Dec 2021 23:57:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA22CC0012
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 23:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9766340350
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 23:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="IfsbUTD1";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="WaX1UX2t"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QMH0Ue3rZwm
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 23:57:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D9A94034D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 23:57:32 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8MiDB6008025; 
 Wed, 8 Dec 2021 23:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8de/Yira6OPwZTXyvFBofuTahjE9vmVRerPzzj06XYI=;
 b=IfsbUTD16fM/zprLk9Ax0syHZV3xGnZYuIo7LgNd/R9b/V5fmmeD1lfkoJhhnFMRwv1z
 3EpqNLX+KMlCqa3Cx86wulzjfJ0zlbNFmO56RpgSNUGt8PLXucdESO+ZyiKfUYj0Xnnx
 JBO3r1CyPkJIG1gVUGLXoeo7T3sL/cluguGXbJuT+FWzAGt0FF2Ds+c4szHUMhxqZpJO
 nnHwONJr4MXxLAZG/7617yIo16/4yjYPfps74ynmGGAoW9nwB5PCptSK/Xq8zJSTrPM2
 k87KNMOt3xTMa7ocuOTiiVpnNe2KbL91qGbdI71KZe2O8gEbgnpgsDZs2iPyA43pFLuB 2Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctt9msxd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Dec 2021 23:57:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B8NtSrJ151219;
 Wed, 8 Dec 2021 23:57:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3030.oracle.com with ESMTP id 3csc4vfmgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Dec 2021 23:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Izhs2Z9cgSzYMNevXKtcljc8/AzONAQN8p5E0HIUkDM693x8crS5GaEEUauCB9q4vUXvNd5XAOgIcKUID1qg5nlZ6puCpEUOJ3BZlgdhirx/PxhjKDsaWrrXQa6HWUcErQzT4796Hk1l1ebLCVPCnrEfbRPWG6yLjsEDk28Hj/2BLJ2tFbP8sndatRO1DVySV398DpKtv2E1zkrxHQWaecTgtMclh8Z2EBB1mVeD/5ncH9CV0E/MEa9X+9jjVA7RoQxqRK0lvcz8knWA8W9ZNah00j25j0Qtl/QZQYFoUPZ2dRCHTHvuc4oLs++iPQUPBqZ42c7JQF87pMktApMD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8de/Yira6OPwZTXyvFBofuTahjE9vmVRerPzzj06XYI=;
 b=MPvPiH2+fY42KL6MSr5yY7wumBPAhQvjpkqIISh31s8Bu4g90R3VuNX1FjAowYCjBEwlfpqP4FyRCNHsRLB3FGwKzJBUZ+tUHH/4sdvpbicTOpEwe2cYS1aBP7U+U8stwjxhwRPpwwTPrjPl9kaoH215jpHZnbYWMDnlOO5mjD6bZeV4jiD1hXS0pTquBTdy8P0EFWoP0D6vHDUWpghzZenKe07XKLz/RI1+6o2WiM44sqYvIZtTrgdUHgs2mVaIFSv1FBJh1acnEBz/jZ+IHXCzeAaN7xU80OvIh+T/hOuVtcXyvjBeahvZwF/GzFmm4IyAfIivWguYs3KqokTQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8de/Yira6OPwZTXyvFBofuTahjE9vmVRerPzzj06XYI=;
 b=WaX1UX2tnxkWreltfcOh3qs+ZpX4uFwQoR0m4eyMV4tbT6JZ0cCgJ+LK7ynwwPr/IQvKKv6b3dbxgvi3uPnILoQZNU1VlJVbZ/DWZD4LwlGiaP56j9PVvizxD5T+HCnap1rtLN1HVdhRPWaYCtpPtF0i/OUzT/6tcV0WieAACxs=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BYAPR10MB2936.namprd10.prod.outlook.com (2603:10b6:a03:84::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Wed, 8 Dec
 2021 23:57:28 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::7c7e:4a5e:24e0:309d]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::7c7e:4a5e:24e0:309d%3]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 23:57:28 +0000
Message-ID: <ff8cdad8-cfbd-1d7a-545f-acda1e51a360@oracle.com>
Date: Wed, 8 Dec 2021 15:57:21 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1 1/7] vdpa: Provide interface to read driver features
Content-Language: en-US
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org
References: <20211208201430.73720-1-elic@nvidia.com>
 <20211208201430.73720-2-elic@nvidia.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20211208201430.73720-2-elic@nvidia.com>
X-ClientProxiedBy: SN4PR0501CA0153.namprd05.prod.outlook.com
 (2603:10b6:803:2c::31) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
Received: from [10.159.159.125] (138.3.200.61) by
 SN4PR0501CA0153.namprd05.prod.outlook.com (2603:10b6:803:2c::31) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 23:57:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 911bc3c3-e65a-4476-4cc4-08d9baa67d5e
X-MS-TrafficTypeDiagnostic: BYAPR10MB2936:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB29369FDE984EB2AAE6507C04B16F9@BYAPR10MB2936.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUUbaKehCxnsO2+Ajx8NeZZ1cNL8LbMOUOeiojNAE+Si45hXdIljyDBXpHI19OyPVfS0RYjRJVgyA2n5OJmB6IkX6WH6ypqBO3lBZnY7repPVuofPYM0u/4B9dVe5UVhVKOLqb56J4LqNqWmGRJEqyMNXRIZ9VpkhOjqVG37azDV+zNATdFJ5X/w0+lZF4sUOTr2FUMFIxwCJa0bpG/nTHO3RFEmMwnSZkp3p1fyjB3NyGTK+clOS5cMAMbEtkBhVQ8QcqhDG4Z8TSCSyTIqOTY9jw3DKxP70XfKrOh12poM/+JHhGxmOr836aLypW0D2z1hLSGmvFnIyJIUI3MvqnvOeCnY0y9vv5l737Yj99Fo2NvThQBNOVLfmQprLJ/hlmNc9f1T+QGAdNJzEXMrUOWRC6YA4bBBiR1ys956+bjTvVCFCMndFEDLadAvUlh3LCS/Gdc0ugTC9PkXilAyDa3x5fYx9SsfcmlykVv9qiFbQhclyi5MNaGngAaDiR5ETtLs06+BIF7F0UK3B8bPYJRxfWZVEY6f0+4rEEMtS118ZLqn00aQPcJq/GGAsA/NfKViMcgcl7QejcLloGZOCioU/RDTbrocrMZ/tVcGbl4YMrgevqkYCVAiGdo1jcpYvTgKq5uXK3vVKwjZ3rj/0yPTGVM9OaNyJcwnqUBy7uJeRvJKq9OVO3WHIthvfIPaDn3rWFvRBbogTpPrul4HXUFZqHzM2Bf9werAkKfF1P8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(38100700002)(86362001)(956004)(36916002)(4326008)(186003)(83380400001)(2616005)(26005)(53546011)(16576012)(6486002)(30864003)(31686004)(316002)(8676002)(66946007)(66476007)(2906002)(66556008)(508600001)(8936002)(31696002)(5660300002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW5VTXF1V1FqNWNaU2ZZS0grYjBBVDMvZGFCMzU1cWRNS2RqTVoxQ3hMRFM1?=
 =?utf-8?B?VFRTdEtSWjB6Q0tDZlB0OC9UdTIzR2swcXpoUUFGaTZMbUFYYWRBQXFabUFp?=
 =?utf-8?B?K0NIaU00WDNrajZlVmJIc2Y0ZUszM3IzY3JYcDdKMUJGKzAyYUU5RzArd0lk?=
 =?utf-8?B?SzJsSmtjN1lyWDFBQTg0VEtUTkdZM2FoUkZLVC80ekN3WFg3RnBnNG5jVXg3?=
 =?utf-8?B?aWVDZHFxTXBxQlBPZTlPSmNZdVpwVWRMS3pVN01qME1IRTZBSWdUa1hqV2JK?=
 =?utf-8?B?K2FZcVYraXdhS3pJSTlPOGJSNlNCK0pyMGo0b0ZObTRVRlduUlI3OFQ3Vno4?=
 =?utf-8?B?QnVmSEJCeXo0bXU0b3dacXVnRWZESG1uVW5GaENTWEZmTFc1RUVrMHBkYWNm?=
 =?utf-8?B?QjVpMHlEaTNXeXI5cmoyblJ3aUY5YUMrM1FEZ1hPSjloOEFFSUtkQlZkV2Vz?=
 =?utf-8?B?Zm9hdWFDV2JjTUJJTTcySk1lc3RmSG1zZlJ3bU1KR0JKRTllcm5vUnJ2QWhR?=
 =?utf-8?B?OVpsRHFtYlI3M1l2NlhyUy94bFdLMTAzVTdMNFp1QVdOY2svNThLZDFWaG9m?=
 =?utf-8?B?U0Q4bEhUdXAvdHpRcTlOTEZLeTlxY1NZQms3Tlp2Z294ejVNSmQxNExlSGtz?=
 =?utf-8?B?TnQ4Qy9wYlVBSGFsWFhZcjU4NWljY1l2dmNaV0h2YUhiMktpbVlpbzdzVUt3?=
 =?utf-8?B?bjJMMGpEQmtYalhub1EyQ1IvaGttMHFhYStNS3VDTGRlaDdOTURQUTlMNFpU?=
 =?utf-8?B?Y3BoUDNrdlRNMkxTcTJQZiticzh1MGpMdkhhZ2Z4NjhxcnkvQTVabk9xYnlh?=
 =?utf-8?B?YTFiSEN0TTkrQWFxQTRuY1ZlWG1MTzNWUE95ZXpBaEhkU1hSZDR1bTJ2K0xO?=
 =?utf-8?B?bHlhRDJSVlArL0loRm0wZ1BxTE43VXhSa3p1eHp3bU1nVklyT1FRZXM1S1NM?=
 =?utf-8?B?VVFtY1lldzdINS9YRkMvblI2b0NGaEUrY0ZhKzVtZmhVczl3ZERHdVhXZkQ4?=
 =?utf-8?B?OHdVY0p5ZHA5MS9aeTZ1bVVuZXkxQVdhVGx4NXZvRVFmRytPeEdjRjdESHcz?=
 =?utf-8?B?WVBDOENwZkEwRVdPaklHbkVOSUk0ekhPS0Q4L1JXL2Y5dHlHWGxhWTRtRzcr?=
 =?utf-8?B?VWtaelRxNXB1ZFhOWk54VEJtOU1YTWJiMzh6SUUrQlZ4MDJ4VTZrVElhcHBF?=
 =?utf-8?B?LzBEVk5tZG9uL0kybXhLT1NsVEJRR3g3elBUaVlsaUNtSldXclp6UzlPQ1pJ?=
 =?utf-8?B?QVdzZ2h1V2RBZmVkczRKenhnbmFOaWxJVjN3M3ozVWo2RnZuUkVDZm0zV2Zn?=
 =?utf-8?B?OTF3Y2R6akF3TUlhVGV2bThTN0VyZEZJWW5IZnJ0NnJDU3Z3TlZ4YmoxNHFE?=
 =?utf-8?B?MVVTMWxwSk5ETkFEcC9BVkhLY3Y5WnVpQ1ZLNVNEWnpXNi9FRG55U1VORWtn?=
 =?utf-8?B?ZE5vdlhLRlNmNUtGV2djd05qMjdhbmRBbUx5Uy92d3JiQnZRODJVVDJtalpi?=
 =?utf-8?B?MVRublpSR3FPS1NjeE9jcCtxakVsUXVZb2RRNkowRDBaWkpJRmdxb2ZlNE1k?=
 =?utf-8?B?bUN5d3lyZ2dHdGlwanZzRFVNR0tIVFhUbXBZek9MZ0lOUWExRk5jS1F0ZW9l?=
 =?utf-8?B?Z25KUGl3T2x6eitTSWVEL28zQVIweTJlRTBXazB2WmpvT2xOd1gzeUhIb2w1?=
 =?utf-8?B?VThjaFlxSW9rM010Zm5tNGNDRHhBS3AvK3YzVFA2MXZLcEdQN1BpZjFSVGU3?=
 =?utf-8?B?R1dGN3ZPaDJ3eGRlV1ZhbHkzdGJISDVtWWNkL1Izb2RqVkZvL1cxVUMyU0pU?=
 =?utf-8?B?OWNvZGRUMCtYcDJ4TDcrMEtTRzhScUVvRkh2b2VsQ3NScjVRMUZlNDhkRk02?=
 =?utf-8?B?N1J2SDA3SmI0NkxpbWU0dVpGdStNNnhXME5vWTZ2VFhTRjNBaFBJdFV4dGha?=
 =?utf-8?B?a3pQSjRyU2l6WHRlbjJSTHQ2MmhRNDY3KzAwdzkvTE91OWlndlEvcXFnU0Y3?=
 =?utf-8?B?dmx4SzFnMG0zbzFGcU12c3ZjK3Z3R3dyNXhHT01QM3NIYlFzc2p3ejRMNzJP?=
 =?utf-8?B?NGRwNVc3KzZaTVYyVHM3ODlXMFoveFRLWW9tbE9NOUtTUlorcm1yNkN5T3NO?=
 =?utf-8?B?NWVIeklJN2E1eDVHMW1TWDUxbVJxd1FDZklCRnNWVXp2Yk0wajh5cG1WZzdR?=
 =?utf-8?Q?X1XLJSLUUTUjcsNSPigrLaw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911bc3c3-e65a-4476-4cc4-08d9baa67d5e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 23:57:28.1711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVBBCSvY9PGoWTG2OAAKR3jgQ6fI6ZdWXBV63oq1S0TVJ03TllBagcid8z8MmzcuAKY0LfSrgF1Tsd53XztvHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2936
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10192
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080130
X-Proofpoint-GUID: NV9zo2xEMhKhbOY40vYkih3kIY0mzY01
X-Proofpoint-ORIG-GUID: NV9zo2xEMhKhbOY40vYkih3kIY0mzY01
Cc: lvivier@redhat.com, eperezma@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



On 12/8/2021 12:14 PM, Eli Cohen wrote:
> Provide an interface to read the negotiated features. This is needed
> when building the netlink message in vdpa_dev_net_config_fill().
>
> Also fix the implementation of vdpa_dev_net_config_fill() to use the
> negotiated features instead of the device features.
Are we sure the use of device feature is a bug rather than expected 
behavior? How do users determine the configured number of queue pairs at 
any point in case of a non-multiqueue supporting guest/driver or that 
the device is being reset (where actual_features == 0)? Maybe we should 
differentiate the static device config against driver/device running 
state here. I thought the change to vdpa_dev_net_config_fill() in this 
patch would break vdpa tool user's expectation that the value of max_vqp 
config is a fixed value since the vdpa creation time.

Perhaps worth adding another attribute to represent the running state 
(cur_max_qps) based on the negotiated features.

-Siwei

>
> To make APIs clearer, make the following name changes to struct
> vdpa_config_ops so they better describe their operations:
>
> get_features -> get_device_features
> set_features -> set_driver_features
>
> Finally, add get_driver_features to return the negotiated features and
> add implementation to all the upstream drivers.
>
> Signed-off-by: Eli Cohen <elic@nvidia.com>
> ---
>   drivers/vdpa/alibaba/eni_vdpa.c    | 16 ++++++++++++----
>   drivers/vdpa/ifcvf/ifcvf_main.c    | 16 ++++++++++++----
>   drivers/vdpa/mlx5/net/mlx5_vnet.c  | 16 ++++++++++++----
>   drivers/vdpa/vdpa.c                |  2 +-
>   drivers/vdpa/vdpa_sim/vdpa_sim.c   | 21 +++++++++++++++------
>   drivers/vdpa/vdpa_user/vduse_dev.c | 16 ++++++++++++----
>   drivers/vdpa/virtio_pci/vp_vdpa.c  | 16 ++++++++++++----
>   drivers/vhost/vdpa.c               |  2 +-
>   drivers/virtio/virtio_vdpa.c       |  2 +-
>   include/linux/vdpa.h               | 14 +++++++++-----
>   10 files changed, 87 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
> index 3f788794571a..ac0975660f4d 100644
> --- a/drivers/vdpa/alibaba/eni_vdpa.c
> +++ b/drivers/vdpa/alibaba/eni_vdpa.c
> @@ -58,7 +58,7 @@ static struct virtio_pci_legacy_device *vdpa_to_ldev(struct vdpa_device *vdpa)
>   	return &eni_vdpa->ldev;
>   }
>   
> -static u64 eni_vdpa_get_features(struct vdpa_device *vdpa)
> +static u64 eni_vdpa_get_device_features(struct vdpa_device *vdpa)
>   {
>   	struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
>   	u64 features = vp_legacy_get_features(ldev);
> @@ -69,7 +69,7 @@ static u64 eni_vdpa_get_features(struct vdpa_device *vdpa)
>   	return features;
>   }
>   
> -static int eni_vdpa_set_features(struct vdpa_device *vdpa, u64 features)
> +static int eni_vdpa_set_driver_features(struct vdpa_device *vdpa, u64 features)
>   {
>   	struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
>   
> @@ -84,6 +84,13 @@ static int eni_vdpa_set_features(struct vdpa_device *vdpa, u64 features)
>   	return 0;
>   }
>   
> +static u64 eni_vdpa_get_driver_features(struct vdpa_device *vdpa)
> +{
> +	struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> +
> +	return vp_legacy_get_driver_features(ldev);
> +}
> +
>   static u8 eni_vdpa_get_status(struct vdpa_device *vdpa)
>   {
>   	struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> @@ -401,8 +408,9 @@ static void eni_vdpa_set_config_cb(struct vdpa_device *vdpa,
>   }
>   
>   static const struct vdpa_config_ops eni_vdpa_ops = {
> -	.get_features	= eni_vdpa_get_features,
> -	.set_features	= eni_vdpa_set_features,
> +	.get_device_features = eni_vdpa_get_device_features,
> +	.set_driver_features = eni_vdpa_set_driver_features,
> +	.get_driver_features = eni_vdpa_get_driver_features,
>   	.get_status	= eni_vdpa_get_status,
>   	.set_status	= eni_vdpa_set_status,
>   	.reset		= eni_vdpa_reset,
> diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
> index 6dc75ca70b37..6a6a0a462392 100644
> --- a/drivers/vdpa/ifcvf/ifcvf_main.c
> +++ b/drivers/vdpa/ifcvf/ifcvf_main.c
> @@ -169,7 +169,7 @@ static struct ifcvf_hw *vdpa_to_vf(struct vdpa_device *vdpa_dev)
>   	return &adapter->vf;
>   }
>   
> -static u64 ifcvf_vdpa_get_features(struct vdpa_device *vdpa_dev)
> +static u64 ifcvf_vdpa_get_device_features(struct vdpa_device *vdpa_dev)
>   {
>   	struct ifcvf_adapter *adapter = vdpa_to_adapter(vdpa_dev);
>   	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
> @@ -187,7 +187,7 @@ static u64 ifcvf_vdpa_get_features(struct vdpa_device *vdpa_dev)
>   	return features;
>   }
>   
> -static int ifcvf_vdpa_set_features(struct vdpa_device *vdpa_dev, u64 features)
> +static int ifcvf_vdpa_set_driver_features(struct vdpa_device *vdpa_dev, u64 features)
>   {
>   	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
>   	int ret;
> @@ -201,6 +201,13 @@ static int ifcvf_vdpa_set_features(struct vdpa_device *vdpa_dev, u64 features)
>   	return 0;
>   }
>   
> +static u64 ifcvf_vdpa_get_driver_features(struct vdpa_device *vdpa_dev)
> +{
> +	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
> +
> +	return vf->req_features;
> +}
> +
>   static u8 ifcvf_vdpa_get_status(struct vdpa_device *vdpa_dev)
>   {
>   	struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);
> @@ -443,8 +450,9 @@ static struct vdpa_notification_area ifcvf_get_vq_notification(struct vdpa_devic
>    * implemented set_map()/dma_map()/dma_unmap()
>    */
>   static const struct vdpa_config_ops ifc_vdpa_ops = {
> -	.get_features	= ifcvf_vdpa_get_features,
> -	.set_features	= ifcvf_vdpa_set_features,
> +	.get_device_features = ifcvf_vdpa_get_device_features,
> +	.set_driver_features = ifcvf_vdpa_set_driver_features,
> +	.get_driver_features = ifcvf_vdpa_get_driver_features,
>   	.get_status	= ifcvf_vdpa_get_status,
>   	.set_status	= ifcvf_vdpa_set_status,
>   	.reset		= ifcvf_vdpa_reset,
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 63813fbb5f62..ce2e13135dd8 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -1880,7 +1880,7 @@ static u64 mlx_to_vritio_features(u16 dev_features)
>   	return result;
>   }
>   
> -static u64 mlx5_vdpa_get_features(struct vdpa_device *vdev)
> +static u64 mlx5_vdpa_get_device_features(struct vdpa_device *vdev)
>   {
>   	struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
>   	struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
> @@ -1972,7 +1972,7 @@ static void update_cvq_info(struct mlx5_vdpa_dev *mvdev)
>   	}
>   }
>   
> -static int mlx5_vdpa_set_features(struct vdpa_device *vdev, u64 features)
> +static int mlx5_vdpa_set_driver_features(struct vdpa_device *vdev, u64 features)
>   {
>   	struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
>   	struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
> @@ -2339,6 +2339,13 @@ static int mlx5_get_vq_irq(struct vdpa_device *vdv, u16 idx)
>   	return -EOPNOTSUPP;
>   }
>   
> +static u64 mlx5_vdpa_get_driver_features(struct vdpa_device *vdev)
> +{
> +	struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
> +
> +	return mvdev->actual_features;
> +}
> +
>   static const struct vdpa_config_ops mlx5_vdpa_ops = {
>   	.set_vq_address = mlx5_vdpa_set_vq_address,
>   	.set_vq_num = mlx5_vdpa_set_vq_num,
> @@ -2351,8 +2358,9 @@ static const struct vdpa_config_ops mlx5_vdpa_ops = {
>   	.get_vq_notification = mlx5_get_vq_notification,
>   	.get_vq_irq = mlx5_get_vq_irq,
>   	.get_vq_align = mlx5_vdpa_get_vq_align,
> -	.get_features = mlx5_vdpa_get_features,
> -	.set_features = mlx5_vdpa_set_features,
> +	.get_device_features = mlx5_vdpa_get_device_features,
> +	.set_driver_features = mlx5_vdpa_set_driver_features,
> +	.get_driver_features = mlx5_vdpa_get_driver_features,
>   	.set_config_cb = mlx5_vdpa_set_config_cb,
>   	.get_vq_num_max = mlx5_vdpa_get_vq_num_max,
>   	.get_device_id = mlx5_vdpa_get_device_id,
> diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
> index 7332a74a4b00..c37d384c0f33 100644
> --- a/drivers/vdpa/vdpa.c
> +++ b/drivers/vdpa/vdpa.c
> @@ -733,7 +733,7 @@ static int vdpa_dev_net_config_fill(struct vdpa_device *vdev, struct sk_buff *ms
>   	if (nla_put_u16(msg, VDPA_ATTR_DEV_NET_CFG_MTU, val_u16))
>   		return -EMSGSIZE;
>   
> -	features = vdev->config->get_features(vdev);
> +	features = vdev->config->get_driver_features(vdev);
>   
>   	return vdpa_dev_net_mq_config_fill(vdev, msg, features, &config);
>   }
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> index 41b0cd17fcba..ddbe142af09a 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> @@ -399,14 +399,14 @@ static u32 vdpasim_get_vq_align(struct vdpa_device *vdpa)
>   	return VDPASIM_QUEUE_ALIGN;
>   }
>   
> -static u64 vdpasim_get_features(struct vdpa_device *vdpa)
> +static u64 vdpasim_get_device_features(struct vdpa_device *vdpa)
>   {
>   	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
>   
>   	return vdpasim->dev_attr.supported_features;
>   }
>   
> -static int vdpasim_set_features(struct vdpa_device *vdpa, u64 features)
> +static int vdpasim_set_driver_features(struct vdpa_device *vdpa, u64 features)
>   {
>   	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
>   
> @@ -419,6 +419,13 @@ static int vdpasim_set_features(struct vdpa_device *vdpa, u64 features)
>   	return 0;
>   }
>   
> +static u64 vdpasim_get_driver_features(struct vdpa_device *vdpa)
> +{
> +	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
> +
> +	return vdpasim->features;
> +}
> +
>   static void vdpasim_set_config_cb(struct vdpa_device *vdpa,
>   				  struct vdpa_callback *cb)
>   {
> @@ -613,8 +620,9 @@ static const struct vdpa_config_ops vdpasim_config_ops = {
>   	.set_vq_state           = vdpasim_set_vq_state,
>   	.get_vq_state           = vdpasim_get_vq_state,
>   	.get_vq_align           = vdpasim_get_vq_align,
> -	.get_features           = vdpasim_get_features,
> -	.set_features           = vdpasim_set_features,
> +	.get_device_features    = vdpasim_get_device_features,
> +	.set_driver_features    = vdpasim_set_driver_features,
> +	.get_driver_features    = vdpasim_get_driver_features,
>   	.set_config_cb          = vdpasim_set_config_cb,
>   	.get_vq_num_max         = vdpasim_get_vq_num_max,
>   	.get_device_id          = vdpasim_get_device_id,
> @@ -642,8 +650,9 @@ static const struct vdpa_config_ops vdpasim_batch_config_ops = {
>   	.set_vq_state           = vdpasim_set_vq_state,
>   	.get_vq_state           = vdpasim_get_vq_state,
>   	.get_vq_align           = vdpasim_get_vq_align,
> -	.get_features           = vdpasim_get_features,
> -	.set_features           = vdpasim_set_features,
> +	.get_device_features    = vdpasim_get_device_features,
> +	.set_driver_features    = vdpasim_set_driver_features,
> +	.get_driver_features    = vdpasim_get_driver_features,
>   	.set_config_cb          = vdpasim_set_config_cb,
>   	.get_vq_num_max         = vdpasim_get_vq_num_max,
>   	.get_device_id          = vdpasim_get_device_id,
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index c9204c62f339..1e65af6ab9ae 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -573,14 +573,14 @@ static u32 vduse_vdpa_get_vq_align(struct vdpa_device *vdpa)
>   	return dev->vq_align;
>   }
>   
> -static u64 vduse_vdpa_get_features(struct vdpa_device *vdpa)
> +static u64 vduse_vdpa_get_device_features(struct vdpa_device *vdpa)
>   {
>   	struct vduse_dev *dev = vdpa_to_vduse(vdpa);
>   
>   	return dev->device_features;
>   }
>   
> -static int vduse_vdpa_set_features(struct vdpa_device *vdpa, u64 features)
> +static int vduse_vdpa_set_driver_features(struct vdpa_device *vdpa, u64 features)
>   {
>   	struct vduse_dev *dev = vdpa_to_vduse(vdpa);
>   
> @@ -588,6 +588,13 @@ static int vduse_vdpa_set_features(struct vdpa_device *vdpa, u64 features)
>   	return 0;
>   }
>   
> +static u64 vduse_vdpa_get_driver_features(struct vdpa_device *vdpa)
> +{
> +	struct vduse_dev *dev = vdpa_to_vduse(vdpa);
> +
> +	return dev->driver_features;
> +}
> +
>   static void vduse_vdpa_set_config_cb(struct vdpa_device *vdpa,
>   				  struct vdpa_callback *cb)
>   {
> @@ -720,8 +727,9 @@ static const struct vdpa_config_ops vduse_vdpa_config_ops = {
>   	.set_vq_state		= vduse_vdpa_set_vq_state,
>   	.get_vq_state		= vduse_vdpa_get_vq_state,
>   	.get_vq_align		= vduse_vdpa_get_vq_align,
> -	.get_features		= vduse_vdpa_get_features,
> -	.set_features		= vduse_vdpa_set_features,
> +	.get_device_features	= vduse_vdpa_get_device_features,
> +	.set_driver_features	= vduse_vdpa_set_driver_features,
> +	.get_driver_features	= vduse_vdpa_get_driver_features,
>   	.set_config_cb		= vduse_vdpa_set_config_cb,
>   	.get_vq_num_max		= vduse_vdpa_get_vq_num_max,
>   	.get_device_id		= vduse_vdpa_get_device_id,
> diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
> index e3ff7875e123..97285bc05e47 100644
> --- a/drivers/vdpa/virtio_pci/vp_vdpa.c
> +++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
> @@ -53,14 +53,14 @@ static struct virtio_pci_modern_device *vdpa_to_mdev(struct vdpa_device *vdpa)
>   	return &vp_vdpa->mdev;
>   }
>   
> -static u64 vp_vdpa_get_features(struct vdpa_device *vdpa)
> +static u64 vp_vdpa_get_device_features(struct vdpa_device *vdpa)
>   {
>   	struct virtio_pci_modern_device *mdev = vdpa_to_mdev(vdpa);
>   
>   	return vp_modern_get_features(mdev);
>   }
>   
> -static int vp_vdpa_set_features(struct vdpa_device *vdpa, u64 features)
> +static int vp_vdpa_set_driver_features(struct vdpa_device *vdpa, u64 features)
>   {
>   	struct virtio_pci_modern_device *mdev = vdpa_to_mdev(vdpa);
>   
> @@ -69,6 +69,13 @@ static int vp_vdpa_set_features(struct vdpa_device *vdpa, u64 features)
>   	return 0;
>   }
>   
> +static u64 vp_vdpa_get_driver_features(struct vdpa_device *vdpa)
> +{
> +	struct virtio_pci_modern_device *mdev = vdpa_to_mdev(vdpa);
> +
> +	return vp_modern_get_features(mdev);
> +}
> +
>   static u8 vp_vdpa_get_status(struct vdpa_device *vdpa)
>   {
>   	struct virtio_pci_modern_device *mdev = vdpa_to_mdev(vdpa);
> @@ -415,8 +422,9 @@ vp_vdpa_get_vq_notification(struct vdpa_device *vdpa, u16 qid)
>   }
>   
>   static const struct vdpa_config_ops vp_vdpa_ops = {
> -	.get_features	= vp_vdpa_get_features,
> -	.set_features	= vp_vdpa_set_features,
> +	.get_device_features = vp_vdpa_get_device_features,
> +	.set_driver_features = vp_vdpa_set_driver_features,
> +	.get_driver_features = vp_vdpa_get_driver_features,
>   	.get_status	= vp_vdpa_get_status,
>   	.set_status	= vp_vdpa_set_status,
>   	.reset		= vp_vdpa_reset,
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 29cced1cd277..6d087a4fb581 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -262,7 +262,7 @@ static long vhost_vdpa_get_features(struct vhost_vdpa *v, u64 __user *featurep)
>   	const struct vdpa_config_ops *ops = vdpa->config;
>   	u64 features;
>   
> -	features = ops->get_features(vdpa);
> +	features = ops->get_device_features(vdpa);
>   
>   	if (copy_to_user(featurep, &features, sizeof(features)))
>   		return -EFAULT;
> diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
> index f85f860bc10b..a84b04ba3195 100644
> --- a/drivers/virtio/virtio_vdpa.c
> +++ b/drivers/virtio/virtio_vdpa.c
> @@ -308,7 +308,7 @@ static u64 virtio_vdpa_get_features(struct virtio_device *vdev)
>   	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
>   	const struct vdpa_config_ops *ops = vdpa->config;
>   
> -	return ops->get_features(vdpa);
> +	return ops->get_device_features(vdpa);
>   }
>   
>   static int virtio_vdpa_finalize_features(struct virtio_device *vdev)
> diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
> index c3011ccda430..db24317d61b6 100644
> --- a/include/linux/vdpa.h
> +++ b/include/linux/vdpa.h
> @@ -169,14 +169,17 @@ struct vdpa_map_file {
>    *				for the device
>    *				@vdev: vdpa device
>    *				Returns virtqueue algin requirement
> - * @get_features:		Get virtio features supported by the device
> + * @get_device_features:	Get virtio features supported by the device
>    *				@vdev: vdpa device
>    *				Returns the virtio features support by the
>    *				device
> - * @set_features:		Set virtio features supported by the driver
> + * @set_driver_features:	Set virtio features supported by the driver
>    *				@vdev: vdpa device
>    *				@features: feature support by the driver
>    *				Returns integer: success (0) or error (< 0)
> + * @get_driver_features:	Get virtio features in action
> + *				@vdev: vdpa device
> + *				Returns the virtio features accepted
>    * @set_config_cb:		Set the config interrupt callback
>    *				@vdev: vdpa device
>    *				@cb: virtio-vdev interrupt callback structure
> @@ -276,8 +279,9 @@ struct vdpa_config_ops {
>   
>   	/* Device ops */
>   	u32 (*get_vq_align)(struct vdpa_device *vdev);
> -	u64 (*get_features)(struct vdpa_device *vdev);
> -	int (*set_features)(struct vdpa_device *vdev, u64 features);
> +	u64 (*get_device_features)(struct vdpa_device *vdev);
> +	int (*set_driver_features)(struct vdpa_device *vdev, u64 features);
> +	u64 (*get_driver_features)(struct vdpa_device *vdev);
>   	void (*set_config_cb)(struct vdpa_device *vdev,
>   			      struct vdpa_callback *cb);
>   	u16 (*get_vq_num_max)(struct vdpa_device *vdev);
> @@ -395,7 +399,7 @@ static inline int vdpa_set_features(struct vdpa_device *vdev, u64 features)
>   	const struct vdpa_config_ops *ops = vdev->config;
>   
>   	vdev->features_valid = true;
> -	return ops->set_features(vdev, features);
> +	return ops->set_driver_features(vdev, features);
>   }
>   
>   void vdpa_get_config(struct vdpa_device *vdev, unsigned int offset,

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
