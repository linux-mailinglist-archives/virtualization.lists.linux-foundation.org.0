Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D034F7307
	for <lists.virtualization@lfdr.de>; Thu,  7 Apr 2022 05:19:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B3541984;
	Thu,  7 Apr 2022 03:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMyRKXrx0IxB; Thu,  7 Apr 2022 03:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6EFC2418DE;
	Thu,  7 Apr 2022 03:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0DC2C0082;
	Thu,  7 Apr 2022 03:19:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17800C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 104FA418DE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6J3Gt0wCojzx
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:19:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBF75418D9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:19:50 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2372avAf024455; 
 Thu, 7 Apr 2022 03:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/V0Fwxr5Zm+y2aUbPU9s25E9VnsikKMkCQTHQ7fjVfw=;
 b=i5FMU2e8LcZtJnTYkwV6E8F1CmXHTpq432Z3UWXvhHLaaqaB1qLy6grINx2kAbYvfYer
 SN8+/U4jQlO+0tJQjU+RPhn990QZ+/KevL2vFVzK0vh6BtHNWBUaW3rP8TJIRu5RxPuv
 5q2FGGgnsw+BcWFF1Ul8Va26S+QruBwCczAAZMsHEiODM474wY/Lvn/qpjgofktuHQbB
 rQLE30y5Jj2kFRYSzXmvZ2Kccneww/aRTF0VL25SLIHueHK/uGvY09oouCorc2CXAmuQ
 F+gCGaE5kiQpxNaK/oVtrj9/VdkTmpTFEg/S0107fuEBTxgj0Cf4xnG1niTDoPoQ1Vjv dw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6f1tared-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:14:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23736QaM029516; Thu, 7 Apr 2022 03:14:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f97wqsj63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:14:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZejwOG2RyBy5APoCPpRRDnrxjPNsDEUuDWsaQSgIqhJOpZDVvU3rEeDbquZ28wabUwh/cVx2ULrFoV4jtiOLBcfskMdPsetzIKDFIVlHCEdLV9fsaUzmsTyBFICK4C0VFPa/cmC67dDZykbWIi5qJoPvTR6VQeqwpRqL4QPA4nQf8+j1Wcj/KH0HVxLLQzf9P6oTWhzSEfwn4KOQZa1Ix2TT3e9PiVsZwlovL1/q43oAeakpHZGVW4IqGYliLE3I/yMWFZrfiSgbzG/BGUKhKhbR4AXcLm598Cdzj6Mc+UXjWBQ+9UGH3Z60W2N/BaBe+kHBmFNzOrhqIzWzDeIShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V0Fwxr5Zm+y2aUbPU9s25E9VnsikKMkCQTHQ7fjVfw=;
 b=GEVUnwxEjR7Y9KPKNHK9EJliSrWYamRIZ73sHezNUx8fGSYFb5nzR2cBkYgRGnVUyoLwUN9KQFJxnxs/UZvO4PyVrOicG7IsS9rIMQwg75OgZei4vJ54Jj9DiVJ6oa6u2XBSTjRpnfHHOJ90sTfJiiD9Ny7ecfnXQ167vkEsU6A03LEmS+/+l4wrxjn8H7PW/jZ3WL2X4n+Eoq8kB4j+NCOVk9OADTL8WZL7ey1R5SN3t09O6u8W68yUN1qaCZSvua5HleYiQCV6FcM0krUbwxhqmmCkTMZpATS/c0BglOa1pX/K8KgoLXpVWZiaT8aHgFUHpEdRsRXXxMXfzbOtHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V0Fwxr5Zm+y2aUbPU9s25E9VnsikKMkCQTHQ7fjVfw=;
 b=eAUxHlJe9dYjSx39nvRTqPMnjkc8ntSDSTlBA/YnG45Q86Uzz9W4anDsjmFExxI1AkFiVdGg9+f5xOEQGGa/wWlpAf4FhZuqEND5u7spmQS8Pk+9zF2P7zUDPeb0EJIuMcTWbIQd4f5YhGwoDsPmrUuRlVkXD23e+HEZ083OZy8=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by DM6PR10MB2698.namprd10.prod.outlook.com (2603:10b6:5:b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 03:14:38 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:14:38 +0000
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 03/27] target: fix discard alignment on
 partitions
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1fsmpk2jw.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-4-hch@lst.de>
Date: Wed, 06 Apr 2022 23:14:35 -0400
In-Reply-To: <20220406060516.409838-4-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 6 Apr 2022 08:04:52 +0200")
X-ClientProxiedBy: DM6PR02CA0103.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::44) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd16d686-cc37-4a76-3d91-08da1844bfae
X-MS-TrafficTypeDiagnostic: DM6PR10MB2698:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB26985E3A4FCB8369FFD925C58EE69@DM6PR10MB2698.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWt/W6binc2eK/lECYWJ5MwOHdOLjtV+I63HmdvkMRPRB2htoEOcPRGRfBMW9tbPGBqlwpjpAkJkS41gbveQu/1ScCzlgh6qfX+5SUmKqzDqD9VCEurwxyL8ZDNRsdz7Dpk3QBzQh2SlIHtjGfQdTIdFlCS24a6OkGPBx1tSbQMGWlo+oMG+mJyyP90zI5KHK6+ICjV/1NE32IA8lIUzdKd2C502SWwtmefP0PT6F1HTtPFJYADznODzb1W9VN4bDPmdWuMeuD1jiGv+fTYDvXhGCSj308rqAwwzVVW9OdzGECRPxQ5aIjcCMSahoL9olDxMGzyrRM/8lHzaucrBhvV3NDQ1CMr6SMrzXb6fdYEDgt9/G5LqWRhdPIcNm226/JikUF5Nyn1bD14RhA6VSTmuILGHdcgAtVxRKnBDqWUDTQbwfZlFL9V7k2ssGgxHy4cR/k1cgqKf314TPQxIHL+KP0TLYM1MCYTgKqEAP+H7T26foljEU/ExTs8iuJ8lpIvqL1uZLZDefvYp7Nb+th6wIJtUXdnHcTL07mRkkGzPAA6VOo66s2Fa7rfuatRkW+KnPCZHskImIZcvDZGmNzG+W08C+CM6/1iZcDOS8U8RKtYpTaIs++MNs+syELQw6R/pto2AZPDxz6dSuzvVFt28XRVCfsI0SJSvgbhKdK9Cm0osZW5O2c+hf1fM6QCEexoFmHfDTRVUNFmBW1Acvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(316002)(66946007)(66476007)(66556008)(8676002)(4326008)(38100700002)(38350700002)(86362001)(83380400001)(6512007)(558084003)(6916009)(186003)(508600001)(7416002)(2906002)(36916002)(8936002)(6666004)(6486002)(26005)(5660300002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0lCHWB5CBAfwxdmlYZdoZWcbAIAxhJ3LODYJThGmg7jDyutQne0bNBmdyDur?=
 =?us-ascii?Q?ByoGymw/Mop0IlkkOV+oyCY7nLNjITJCUSg9MCdcaq5JYJP24EqvYPFdX2rT?=
 =?us-ascii?Q?EpB4c5NM1fjYkwTZph+pufL8FGWp74GdC+JL5lX5qfhCMUSsxav9iHP4vAVx?=
 =?us-ascii?Q?YPHuc3hMHDhBFgSS9Uv7R4Nhr2wMr1sA8n/EiiJSjGEiEY76rJnCaI5w4fmh?=
 =?us-ascii?Q?q9tpd8DGH4QihSpZgc9issz6MhKD66MCp6iUv6aHIVCBvVxO/0JMonYZSYKl?=
 =?us-ascii?Q?enTfd9Zt7rKdhtOXydajK+3LT/QeppMoj4yefqPJQI3VFi3Rlzwy1E/Rvtwr?=
 =?us-ascii?Q?ee2wlH6PQY0/aM0wa5AAZklIXcDd8mCuuqzkpRTB5yI+iLslVVTR9uBhpt2p?=
 =?us-ascii?Q?JKf1DuCnMhXJcSAB5KsFDWqN/y0ddIUIQ8d+63k6nnPwDAm/wGesJIyzZNAU?=
 =?us-ascii?Q?gDu10O+HzN9khXj/iHdhVTB0iVmtP800x1T2SfH/qUbhyQyAhcLlQFqlizLE?=
 =?us-ascii?Q?3V/cg8VXQZ6p1ERUkv2z7PwmZ9rEBHnUjyvWa5u8btsWLsa6ebMCRDNW7it4?=
 =?us-ascii?Q?/BN3htjhk3MrHj4pHfYaAb2HwNCQRjrjXyc2pUBiiupu3XCJFC/vQYF79Xap?=
 =?us-ascii?Q?dhpiqCwmEsmHnXbhHMURJhmFqpFjGQM0rmE7VYtaS1azRH/zH2TqK8HW8pwz?=
 =?us-ascii?Q?TT/eH5/bYBYmb7JWQZn1K68lBk3v9ggLRJEPCM05Jk8LGsF5KpcGNVE4pgKg?=
 =?us-ascii?Q?4wU/icVJyufC99p/FPHbL+NihjwQjGYcPWFgcsisxTrRrMb2cGhmKTGbT6PW?=
 =?us-ascii?Q?RfNpNHvqtrgo3ANfvyR9Xp5jxXKUwch60zmR9Uk5vgfncScjbcjQ4HYYlUFd?=
 =?us-ascii?Q?vFddJTWKXkIkugR0EPcmXoyOvGme2SVnwY+Ib4pH00P8ZGZeIuH99iM6g/to?=
 =?us-ascii?Q?TFeJTH+Td/paquVRUEJuE7J0yMRrdV/Sax5+EtDFe98NIG+whyI/6Bj1pNqZ?=
 =?us-ascii?Q?wOxPRR6nGmWycCS0nKv9YSiVjwgtRnOxIg3NK+XcPi1oBfVz/TpbxEX4/kMg?=
 =?us-ascii?Q?m/AwBLjNevFMvwTFqmi23A5aK3TZhSU9TnAL3af9msEWxUzOH6FpqZqVvp8H?=
 =?us-ascii?Q?4Js9ZlIyr3E4FnvS9OguYjqKW5DJEs3mb/zBh97Dcj5LFyioMsPh/8mGnSYU?=
 =?us-ascii?Q?84UqYKNe5gS67rR4fEVKDrxZhu+GK1i3TNzQt/S+aCAyI4U+BA8muQftrtdb?=
 =?us-ascii?Q?hBWSXul3WwBbd16Hn/0meDVY7qCPBaaCbFxY47FSll6l3IOEUnLLT8iE3Wy1?=
 =?us-ascii?Q?gxVqtOXX1j27wClIJNcMn0ouYT/Q1ExScWcQUN4bzUk1qFHuu5M09nbQ3qa5?=
 =?us-ascii?Q?gglYD+TRIFgjl1PWuqnOT5xcm6L9/0iOYJZNoNwHYEAEB/Udrxiyea4lpBjV?=
 =?us-ascii?Q?aGMWobILBsEOQ8iI9tmBsMc8xwMkSRAsF1rgcFqTYWuR6TVkwV9h3cACztyj?=
 =?us-ascii?Q?n0v+y0ZGv+/DZqRDh8xCA2h3FYBxucCT6YVND0UGYifN2k1Vx00zY5fd6a8t?=
 =?us-ascii?Q?MjiolsTl/hoVVWbWtxtLdTlwrnjF+KNM0bgPhRpARfUs6Rtrb9rwaAJ38xl7?=
 =?us-ascii?Q?yF+BsrT69GYVCe3qoe0SHsjokAv9TmjFF4WJO2GFjaycWThlGLk1SuEx7ER9?=
 =?us-ascii?Q?yyg+pneArLHJOfX8+vAxAQNmqtL8Ut+fvQAF7I7RALWEuVD+PVU9mY0qqkS5?=
 =?us-ascii?Q?zJyf1w3vMz9oPxOtwim/64f7os3CZL8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd16d686-cc37-4a76-3d91-08da1844bfae
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:14:38.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa7XDsF2TUSmbTPOLGTD/Asj3pN0wQx3E3uvOsKaxFNEGn5p6T6o4mitNxIXls+I9gNOdTohIBjq9Or2InsQZNGmqeEh2TEB3f7kd9F/mXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2698
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 mlxscore=0 mlxlogscore=949 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070016
X-Proofpoint-ORIG-GUID: mizjd7EMRmxU8Dxf6z3sZxhlMV4xX3Ds
X-Proofpoint-GUID: mizjd7EMRmxU8Dxf6z3sZxhlMV4xX3Ds
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

> Use the proper bdev_discard_alignment helper that accounts for partition
> offsets.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
