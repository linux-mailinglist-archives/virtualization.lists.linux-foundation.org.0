Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E664F72ED
	for <lists.virtualization@lfdr.de>; Thu,  7 Apr 2022 05:17:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40CB83E3F;
	Thu,  7 Apr 2022 03:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZfAziHl30Qu; Thu,  7 Apr 2022 03:17:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 82D9283E44;
	Thu,  7 Apr 2022 03:17:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFF3CC0082;
	Thu,  7 Apr 2022 03:17:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00BFBC0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD3CC41949
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="MpF7s5DZ";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="InAlEa7s"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykiYwlfGdT8V
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:17:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E796241904
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:17:17 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236LdvDA006381; 
 Thu, 7 Apr 2022 03:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=tUJnubd8gZXBDmR5y0HccTdVKl0H84DH174jOcutIYM=;
 b=MpF7s5DZ8ufwzPew/71u+lD2uIs/gd7p212hZkW2MMzH9Z0VU6qO9Yxhu3OWemD0QKv0
 DNm3uvLZOAswhBVHwNIffo5S76DiL2YSWSi69llniRSTVN48ndZYUgtccIGRq0tpCN9D
 YAUuhQw3Zyz7e5dWGbFKKQ2IT2Gi08Fwfu6M2zWCBOcBEwHfAk+9lqS+pi0Q1z5F2lYi
 DsmL3LuIpZTZ6KsFTf2zoW3s3QGDy2wbNZncPR6SR/sPawh4OVJ+EaogbNB0dos6TW/9
 fmnGmjkr8eQPdgXEKjuNCKY2pRLtk0iuwvhrKhC2sgTK8fVzZ6G4l8UcH1Aq3wCl2L1S Xg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d31jpev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:17:12 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2373Gg9N035300; Thu, 7 Apr 2022 03:17:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f97y72k7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:17:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeF5xcv0+uWHQOGX5EkoqZCDOfcW0a9an7AnmvIB13oqeIa2mQqPplsqvgq2vqu55wkG2WNopqHNJsTCF5tz3EXQKwXjSqF2jktNdlSAq4NVS6KYTpjW19j8PBDBe6R/wM1HxpT+AI5yWLcnRptOD3xHxmlr8V+jVDGDKEPUrZxYIb5la0Oj7VDHu4e6loKskelaRf85zRv2Ve0pkiMcTwoZclKiZvSeRVBZspkQiGCukBnNtB473Wk18OdjvwppYaXitLSoVuNvxUg4GTsrb/1wMQ1NEciiEydme5U4P3vW0+hlAW0FIjMbPvoO9uiysNsTpHu8HRzMu0MDzgIQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUJnubd8gZXBDmR5y0HccTdVKl0H84DH174jOcutIYM=;
 b=LW/XqSWzsB1zP522FEsz+eluDqpzplUSNGCGBaKU/9/bLSdhbphOAfiwLXvcorY4GtuWkqQPS7Ca96P7WnC742+QuVc4VyoN7OqrNxAlzcI/1DcRstXGJwSy6yh4T++o57Q2wKZT2b0VOzxA8hgCUAoHrGwPpPBswdhLWcwY7JGANEvGdRJLPzSyGyfVuB4GW87w+JUpuCgv09F/kHYBqNMK0eG5OF0oWs9/+Bw56E+XibDT+D3Q26sgK2uDcZOlROeM0KsG8HsJJyxIs7+mq8s/pfFRZGjGbtEXJ5u/oM3vCa2vL7VSCL+OaVtS9iE2NSIKFJW97gsGPrKUUtaajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUJnubd8gZXBDmR5y0HccTdVKl0H84DH174jOcutIYM=;
 b=InAlEa7smslEM3yAsuBysF1ZefoXvPonEpC35nynzWKEvSwPa6RYOiS3fv3lCNV/vc/VaXOpBUUUNZzV0khNjo/1ybIvFYUgaQ8E9Rw1jwVnYcOkE7mTOSYml2Gbyr/mjKcXy724kG8i9E1OjoTLUmMPTAhImWgBcnTlZ1gZLtE=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4408.namprd10.prod.outlook.com (2603:10b6:510:39::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 03:17:09 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:17:09 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
Subject: Re: [Ocfs2-devel] [PATCH 11/27] block: add a bdev_write_cache helper
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1y20hinvl.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-12-hch@lst.de>
Date: Wed, 06 Apr 2022 23:17:07 -0400
In-Reply-To: <20220406060516.409838-12-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:05:00 +0200")
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6756038-ebba-420f-2828-08da18451a11
X-MS-TrafficTypeDiagnostic: PH0PR10MB4408:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB44083B803B46374C4EBE89248EE69@PH0PR10MB4408.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o4fWyFlXKHFB7B6skBHonvbP60P0LOo3KZR1Jd2wstrj0CIqWehVwNPOY5neM+iwAPYSGfEvLzAie6KPA/3mpPkq79lg3NXMC/LuNwGlFqOp15ot7vrmCxByl/1t+aKpo4lLnVD+kyROJ1/GcXhcwinrRFLxf2ItJpdD3Uu1yPKSStlFrXW8uc4b4C7wB+w58M7Pji71nPoBDt1ehfBdzuE72upxIxvtopqcKZuqyomvbdXzK16SuSsrbR7qCGrbS8HByMTW7Wzuvh+W1i7LKcbhBfbCgQ9zwFu+VEtnSyhsxe/9uv6cJ9GJYDa4rEqIDm//HO0LpydImWiH7LETpwg64iIh5r3k2MONUqHxjPCjRlRcn0MmWicWmmfSf5tyf/NP9HSy1Hub0Ci36o3SAs0ibhjdsvyKxzOHTo87c9+/7+ZrUrc92PFPS6xd1TlSHr+ZnoT0mvzxCBenUQHbqRWNyqmnsB7bw14nYgMqwVIHb0485grLpf3jCjHD71srGcyVMJeKDG+M4SGcZ5cpLPhNHJM/AKoHf2Wq8PFXGN/ltJkcra5yG9YZAhV6GJc6E8LQqF8l64SnIZba9S6p3jnasjfjRTEjqKWIm7oRJbVgf7nIYATYkeEY4aiO8UchfJr5ho2HDnGILwcBvFnuyZyILJA/9NZzjB8YDGXQT3UvWKo3Q3dnE+7Dy0vBCQQYlCNWTzvZQt5a38WH0dogGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6512007)(26005)(6506007)(36916002)(52116002)(7416002)(83380400001)(186003)(5660300002)(2906002)(8936002)(54906003)(316002)(66946007)(38350700002)(38100700002)(6486002)(6862004)(66556008)(4326008)(8676002)(66476007)(86362001)(558084003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WJ8omMkvGyKUxr7EpW3QB6yFZeq0RL+EI3/W7yvXNSWPHHqAr2jiv6smvSYk?=
 =?us-ascii?Q?v+ahBK6tVj2be12TB2ADpvceCFtl0RytbOgef0utOVNZ8s4jIXk+B5voAtAY?=
 =?us-ascii?Q?9QLViRoFlrZHWN4erZJUveaf7vkiU/H9snNjtjmaZmHupEgF23Z0QeFE/m6T?=
 =?us-ascii?Q?0kafvg72fVpElVlyH2elKY1QANjgfZJ0JnZop/AjDo5zX8rOzwjG3gRBDlsu?=
 =?us-ascii?Q?AUK97JmubqaHOlvzy7BUILlrr4n4VSkKmdXPYNifr3ugmZ2V651F99jXam9W?=
 =?us-ascii?Q?VhbVwwMo0iC8Odd+UA0TUm+SkRAU0Q7D7XFNU8YJ+ndiRXt655mV4YjMTy+K?=
 =?us-ascii?Q?oYR8Ck6ChcmEfdbEztfXO3GXP1I4/emUlwA0rv+hq3h2Y2U1KP6bC7FNExqW?=
 =?us-ascii?Q?St+1EcCgUxNoEE0Z0hWGuAjxyjCba7qW+QtHQ4Ndk6HrFmfwlJGFPfpTMDuO?=
 =?us-ascii?Q?bHiuyJqznFxdoGXxHGcCU3FxuaTwRBh9X9xM1BM/z3HPjL6msAYbcurEGoL0?=
 =?us-ascii?Q?G3bt/W+wk2OvgT/9mpfAZnk9ymMbDYn3EW9hxDdHyvHekCgeSSmt5D9cL+42?=
 =?us-ascii?Q?dcBFpqg4ymFcHGA+SOI+bsCoXtBCj5IN0ucCvGl98aOwPljZxQ7A/c80LGoQ?=
 =?us-ascii?Q?kVKT+RHh7r69ZHNwGLVOV9hz4oaB5HbyOKo42+DwtGhlJjcWsHyOFnW5kOos?=
 =?us-ascii?Q?djiN5osR9CtRg7gAetkyeHF4eTIRm+BunbeK/VpZ14vhJVGafNrWwJPvOUfv?=
 =?us-ascii?Q?SxwuxIXgynFU1WlFRhnVuB19X5CZ3mFmQ0sE4kTtNdnXxSWUDVBr4GHcV+U3?=
 =?us-ascii?Q?hxNW725v+IE3rPrbIwUtw3TZd4BwxE2PtlTbIZNDZtlGsqjYWB0mZPGnaqLp?=
 =?us-ascii?Q?/gMwyza0cTkwn520zEXthjOu2fO7z9gKNCbLwDkqbw3yEBbAFIQEXDdTFEZU?=
 =?us-ascii?Q?I8xNB3zfwTfznZCT71owN6C3ipomf2Rv759MXwsrLXw3k1yaL77RC35A76Tz?=
 =?us-ascii?Q?cQ8deDQ/bjKx7bFjayfZpLzJ7AJl4Tzyuz+24oYAMnhlADAv+5XzsAceiNco?=
 =?us-ascii?Q?CcRMfie/KRcE6RSSF0hmoFYbv4NfiOHhGOcqTS2dU2yz3CSSGavAFGZDkg3a?=
 =?us-ascii?Q?YVCgfB7Y95TV6VvUD3FbA3TJ+eMlkyggVAguMS+ZMtzBRXENbXOoU7zt5k+U?=
 =?us-ascii?Q?hQeNS5FQOBxFrLPBjR1r8DIyd6/zEdG7aGOr+xQwbW/ww7qxMyGn9NIxvm/u?=
 =?us-ascii?Q?lo3qY3aFVKOEvJoMVXmjOM3dZNH30RrGEAmjq90gweDiL4vMaT1VycnaV+ox?=
 =?us-ascii?Q?ed0ykHaJMXPPLVfm2u4OMuEkPNDQuL5oS9YKJv06q5XdLZVJUCpH7Oq+br5s?=
 =?us-ascii?Q?ELoPrlPws6LndL+1aalVLUoWKSKQ/2iB0cX1OssFj0ou6/IuzPjNZORxEUHp?=
 =?us-ascii?Q?pyF35AjBS1TFi1KbA8ppMN8h4uADjq+g9xDq5Q10CcaYIiE+q9sYvuikWAJJ?=
 =?us-ascii?Q?x59r9C4140vhZ3vKt6XwJUQS0JjWFNGtkG/1WSQNbl3AdWiKeoHGRFQAUap+?=
 =?us-ascii?Q?UAgmp/Stvw+Y+uT2WJZqnfEU2S9BHBamHrrWWDr3tzfG3PYqw3hGWo8n7nS/?=
 =?us-ascii?Q?Ws1Jc4KdO9MFV7RI65KH9R+lo5O9QAMgYqq9cYZZEzP+Jfi2N96x0OHzDAnC?=
 =?us-ascii?Q?NM33+Eq44AMi2OY/RWRuI7Ae9xlvWiMArrbnBON1pZRot+CuXvtScq9g43Vm?=
 =?us-ascii?Q?oKY0YhZXtFjsthdcIZ4Pm3pz6Kp7tf0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6756038-ebba-420f-2828-08da18451a11
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:17:09.7050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdn52TmNEFKJmHV6h3SFAVHVwIz+ZDkKqUguEUXGoRfnJF6GC3nWc0xMQF1itEcnBnB1dvzxdmeKSxJoWvPlnPk4GBP89IYF14zOzWDQNsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4408
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=979 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070017
X-Proofpoint-GUID: etJQXC1BdPvaG3xYzpqZdzv4Yvr78Bbk
X-Proofpoint-ORIG-GUID: etJQXC1BdPvaG3xYzpqZdzv4Yvr78Bbk
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
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

> Add a helper to check the write cache flag based on the block_device
> instead of having to poke into the block layer internal request_queue.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
