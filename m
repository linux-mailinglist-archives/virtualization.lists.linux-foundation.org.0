Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A179F4F72C1
	for <lists.virtualization@lfdr.de>; Thu,  7 Apr 2022 05:15:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E0A86080A;
	Thu,  7 Apr 2022 03:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJW6eFqCi03M; Thu,  7 Apr 2022 03:15:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1FD4360782;
	Thu,  7 Apr 2022 03:15:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DF11C0012;
	Thu,  7 Apr 2022 03:15:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00F80C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E23C960782
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7Y4U89hr7et
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:15:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5655E60759
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:15:32 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2372avAj024455; 
 Thu, 7 Apr 2022 03:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/31Aq/ogkEv3D7v1WrDP1er8ISBaDWd1x7R1AJi/49Y=;
 b=fkJ2mbsXZbZ0/3/iFv1zlTG9gEFJm0maqWl06jukCCkr2AnJ0aM0Ey5INnLidVbzeSht
 eXDlf9+L3fzcP+hS32NxnQonQ6Mq2pS2JyyXWG4rU6upIYmgHesXCCyeBw4UIrvQAUqh
 mjpGELWXKLQpFVTUxeLMLabmeSf7uXpGtjGRpVnQBl/dx4ezIQrlpX3lX72A7GUmgtIJ
 8aX1qOjWiZ1wh4s1WZyMbpZvxwvqiqYSnj9NSpDnc0boGLa8RowHe6IR9MUHbhTq90Ev
 x6nQ8TFJ/4GM/IhE5D91uWWUoXJ9KKPTEovSaX75FkTKjv7uVI6igk5wKZ673/zU4di9 qQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6f1tarf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:15:26 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23735a9N024750; Thu, 7 Apr 2022 03:15:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f97tstrnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:15:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4+xx59Hv1djusoKEVk4AgRRfjJouSAPkkiq8XHi2smufb9cVyJZjOskKFFza+OENkntQg4r38siTa/H0Oqp8pr9ZApM1ccNxocR9MPhtx1gtIfeD+ryF3cmi+wYIYRupz/AzPspopV8l8BG7EtCwZqDyf7KTLSBjmki9vTE7phT0sQXYsYGoKihk2QgRfFzwoBfUUGN/0g44JDaaO7utgssXMCtiGyfCjwefbFdPhZQ4hwZbubNrYv38j6dKoOM+8uoPM9q+p7w6ZRk4tmM8C3AJ0D6eh+LlAZ7M+3rMSXnmKbVwhcd1aaTPTyZ170M1anUuHWwmIpZn7289qkjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/31Aq/ogkEv3D7v1WrDP1er8ISBaDWd1x7R1AJi/49Y=;
 b=Q9az3qJnJ/6VFGlF5T8ZpnK7+v2+1vmdjEqp7g2RCmkKhTUcbB758KTxmLPHw3j7ctltdA23sLSnT7Ss970Cmuo1kz/LrzQ6yfwzhrkD/bpuoKi4Tq6CUHAYvHwx5WYUp2dpbSfA/ucJp7K1aDi8tqHOFdGVCKIAVskfwSH4znhcEQ2HinXrGBPG53tj4e5nearyqwccWDagDoT2eY9gCwFcYoH7AdbggSuvQSwaWZdlvuK1kjCqQ5FS/xH7y7WeLHv7fSZjRR6hU6lHQiywybDPEvgRNLFDqk4FwBcLY+VnCIzL7Naj1GfZOJVZAuPamPRsp9ADEeZ6p8jMm5ckIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/31Aq/ogkEv3D7v1WrDP1er8ISBaDWd1x7R1AJi/49Y=;
 b=i+KpI7mYp8/WZWk6IU6ucB70P75atPwgoZ8Tk6F2tAKFbOihQA4Qr/xa8Yrmw9HHrWWp6CVvAmgjgO7JPGKHmTQWntgTaH2nN0U8vv37fssQi5E+G2T6k11o6QLPfksx0s8mG1BX3krn37m8TMB828FvYDxRGffASS1NgAMRbAU=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by MWHPR10MB1711.namprd10.prod.outlook.com (2603:10b6:301:a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 03:15:23 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:15:23 +0000
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 14/27] block: add a
 bdev_max_zone_append_sectors helper
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1a6cxk2io.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-15-hch@lst.de>
Date: Wed, 06 Apr 2022 23:15:21 -0400
In-Reply-To: <20220406060516.409838-15-hch@lst.de> (Christoph Hellwig's
 message of "Wed, 6 Apr 2022 08:05:03 +0200")
X-ClientProxiedBy: BYAPR07CA0057.namprd07.prod.outlook.com
 (2603:10b6:a03:60::34) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4633d708-a1a2-4a74-c466-08da1844dafa
X-MS-TrafficTypeDiagnostic: MWHPR10MB1711:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1711503F5A0BB2B0A400CFDE8EE69@MWHPR10MB1711.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4FiugFGeFbmb8PnjvBwaJ3cJzRDELCyJpKHCvmnkE9UifUQvtFOE9jpuffFklqEBxT2nOLbgIbcGsKuaPc03l+WeG7LZT12eCdWPYC/N3H4m1it5zxnChG55xziGjbUu3O0x6wjyxuIqifeGbOKFt8iZ31k+ed0BTPxJJ3o0mqTjAboiQTt6p2C9ZAvz9EzdfuMZHfyU5ePJV1sll71j155LElen4hzdJ2TWJVR8Ia4+ZmwhycQyRgLt1qqyS9qyB/9tcYTCyCKT4a8by00nBHziSInPwv6+UyWpG1pEnomwxpPOphlOzBCsh2jB/LFojDh8aR5hy3kuxHDC6/KAIYtWsr3wyaeukYTgK2pLlWZ5NWVJq+ZhznPcnzeaFnNtK5N4SNt3EN+sQPw/ap3j0RLnc14ouWvPPIoMjAnKZRFF8m8tp8tquk43Nq3Ei+n8+fnY1a//u3BeIXFiaHJBXcnzEOxgzM4UmITtMuaUu2WgiwIECluy6IMnrYVr7722GhrOpZxvyi3QM7ecgw6N3/wDNPUVkEbAelL/M4ah73PM/LrSmkfIY4ntwoYSvc8+K49oqRTTxXNehZYvA3B8wRq6mZDT6lcz7azc3QvA92khUlSvEgX15iJA622ZnzptQWWc+CcFkxcFKxfMNLRjH7OlaxkkBKvn5+sRBu4k0wSQxiOf98HSEkQfXYGGwA5rH66Ovk1Nw7Ha9epocawZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(316002)(66946007)(66476007)(66556008)(8676002)(4326008)(38100700002)(38350700002)(86362001)(83380400001)(6512007)(558084003)(6916009)(186003)(508600001)(7416002)(2906002)(36916002)(8936002)(6486002)(26005)(5660300002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SXPUbwvAbIMrgeIGcXihtK7F/d/QeGf+2AY8X2keMtgxdICznYLcl/OTbR81?=
 =?us-ascii?Q?p34XhSf8oG1UMVRfKGeKqPQnahsKRaXvQKrtaRO9NptcM7/rnsdY756L18Af?=
 =?us-ascii?Q?I4uWb/uRnVH5TPp1C+yvwZw3jD+1Zmc5U3Xb+899RKKBTU6ffzqyLkaZiC8p?=
 =?us-ascii?Q?L7ft/gTgGuB5GRjQJdoZfBB6yy6u7B6g+iJLxmu9qsfE8iJzTLf6uyBPipzX?=
 =?us-ascii?Q?o6w0MDPcADUEQ9XrfvgNEwx544vxkCFk6fQhrzB+Si0qek8tYO4fLVcymyxM?=
 =?us-ascii?Q?bNouJJfhR8lG2Iu+7nbURE1U6KY2i09Emf6Tijrdhhtctwv8jbaU5eY/RJTS?=
 =?us-ascii?Q?+2H7eoez+NxaLnVtHol/9zz+JcmU9euyaXdF2nJUoDz7Z7w9h5+js9gmatqB?=
 =?us-ascii?Q?5tAD7/tEVC97V/7p0xpyg7viihtA3EP/CkdVem1F2UIVnHC3cn0ClgTDqh0z?=
 =?us-ascii?Q?UQE7rI+D15jyEngv9KbANg8cY/o3Xx7VvUMPVUeIA7PklPk/V82jbrYHqzBf?=
 =?us-ascii?Q?GNGTfD/V8DtpBPU1w5aodu4n51qaRyDn/7Ukz34HMfgym4dUafZt4ywk6mFY?=
 =?us-ascii?Q?7cF8qmbMNN0/Jym6fUxdFyZmj1ZPhE3KpRhQMlPX1VRtjojCNLuKWW8WMsU3?=
 =?us-ascii?Q?iEkv5gUfoHxTfJD67bDAUaUjOfSp49qIV5Hn0GS8TBHc3BaCA88wMgUANDg2?=
 =?us-ascii?Q?s0rKvytZWeYG5hRgfifaj75083wDQMfHCNG0VHNY5VdTkyrPo5IPf9A3nsfW?=
 =?us-ascii?Q?hBhof1VyzhZHUdFrx/hugS2+ClvX73CVxsnEUCN4u8DVbyZU1UpIEZK6Mti/?=
 =?us-ascii?Q?AETQyMtKhJ+0MiXh6VxBOoOQBrzb1ybyC7R6rFpyDUIVIMLFLVoVUes81XgI?=
 =?us-ascii?Q?7rlqF6J1H5chI/8ELw6GDZWmocQgYYg2QYwM3YfmKsz/jFSLSRasmdvXNVLU?=
 =?us-ascii?Q?3FD6nWJKeH1IXX/iyr2kavSGBFEpz3Z4WUE9btFEILS9Hl4qn2f0na9Qu4/B?=
 =?us-ascii?Q?fMMp6p5Zg5ANIMszgwzUMLtqEZGDtzA8YV1YGoNgDEePOCcq+p/QtQxIPKDL?=
 =?us-ascii?Q?c0W9INPhMFkk6FbxNJbcFlobGzsNMu7zhBAaivFoTCNX8WFTkidYXEzftn4i?=
 =?us-ascii?Q?cRQ70BeSLtZ2OLz/IFX/iPOsDCcCWw1T0WqACQnEd3bww9paMJA51fwRueYq?=
 =?us-ascii?Q?rU28YasdX08mTU1KFEA9KpJMXvgSRoZRvzzKpAvn+YFSd8zCQc/oN1U2freS?=
 =?us-ascii?Q?DA49MsFJCVYZFqYLxELZjiGLc5wf/Bx2nUZx3xlhOk+DyyjIFGXBJpGe2ZLo?=
 =?us-ascii?Q?VNDEOX4vG5OCkMuDfKHZauJ0UboyNot7unO9/27jzD3VDm8LWyWX0p3jJm2J?=
 =?us-ascii?Q?56uhP4r/Klu2KnNkI/81BCBJTM/yRwFoXGtD4nsBG7T+eVr8NXw3wu5BUmM9?=
 =?us-ascii?Q?d6THTGmAzLcwotonFFeAfWz85YW6pGjxIeCfoukgmSTXwFcLEyZg1C+swQYR?=
 =?us-ascii?Q?Cfp0i+2IgoLZ2br0IcUg66iWT4+SM1+Yudaffy0Hvt4jFGjR+lmEZA2wmhky?=
 =?us-ascii?Q?U/WsRCEYDnennvJYlkhMI9kMLN0czh6LJuibMaTFJoYpA107laQB3qSnx/9+?=
 =?us-ascii?Q?9K3lqVcI6jPcTan3jrbF7/C6kWuesos1BUq6lM7hfRwgrsoYQZ4P+Vopc04o?=
 =?us-ascii?Q?UisfB73KFvMMdCy44bEsH3TcS28MrKL3ZSLkNzwl7v9hQCdr5l38ANRpqxVv?=
 =?us-ascii?Q?vMoccR7eYgE3WBSKmhYvKiQTN0VV59k=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4633d708-a1a2-4a74-c466-08da1844dafa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:15:23.8630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rE+Cty+MdB1lsa3xpRQOVZo5AIqezB8UTRn4pi2YZV5q5rlU8dbrHhIEVkj8tZ61PJI35Q7kugW5WJ/ugaefQRi6DJb1C4qHnVNCBMTQUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1711
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=925
 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070016
X-Proofpoint-ORIG-GUID: hg0fgzSyHHjuLAMFNKOZE-KrKC2qf3WF
X-Proofpoint-GUID: hg0fgzSyHHjuLAMFNKOZE-KrKC2qf3WF
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, ceph-devel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


Christoph,

> Add a helper to check the max supported sectors for zone append based
> on the block_device instead of having to poke into the block layer
> internal request_queue.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
