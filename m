Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF74F727E
	for <lists.virtualization@lfdr.de>; Thu,  7 Apr 2022 05:07:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B29C6074C;
	Thu,  7 Apr 2022 03:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFSPRVxppITi; Thu,  7 Apr 2022 03:07:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CAD5C60B09;
	Thu,  7 Apr 2022 03:07:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B482C0082;
	Thu,  7 Apr 2022 03:07:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDA8CC0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7FB441951
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="0NtihXCz";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="gDztzgY+"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9aWRJcCLYvv
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:07:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED42B4047D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 03:07:02 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2372lGBk024447; 
 Thu, 7 Apr 2022 03:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=GpTq+EYaOf33mkP0QbI4hVWDfTMc3+BcRAeyKVHiQdA=;
 b=0NtihXCzQ1+FQ1tCY3eP6NaSpVt4C62wBMyONHaQNDXk+Df7NABfYZ8ObxD6z0o7h0Uc
 4hadU2EUf9PJcm+SUs3zQ9fmikp6iPVKfKznotYPBhCxFizO3X7756CP4yBhNN4ETH+d
 zRknrleWVirHM8J6jWMYloqaVcNB8LeCiln5KswXELm519im3zOt+dJH4qPAGniklmBH
 bESiGf/Di83wWhWNbSjeJTOjlax0eu+rRflOqChjuyVyITKb/Ywanr4aHYF0/eba8zNN
 7gHxkMSTCK0+dV6aKHHStj60hOdZtNU2yzeS/UQagbF8ZY+LhFGqdP/KG8ZK+UbN7UwB hQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6f1tar6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:06:50 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 237312LF004298; Thu, 7 Apr 2022 03:06:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f974djun3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:06:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLQyDGZjz9e5kGsIXiasl+FudbBS83gooaVFwXgwFs2a8+SJVQFEqquL+nxm13lbPaI4QWnBC6ArtnXcEKpgyHY7foFdwv/vGOXP5SJDBdKSNSqSQiLL0z0KTxkpZTdA4E9+sNu6Ofe/CE0cOwVvg+OKGnTf81t3rdYOZoCunKxqpObWCVTIWrg8Qvyns3LYmoNFH4Weo2VVMa1LpN/YL4OmiGWGGfNogwBjzVE0KvZ354/QhVnuCyPaFJiobgrLCq9Zh9AX8Aj+ZgvFVIimrmxaw97uZa0Kg6B2fWTd2+He9tbP2rQ03zzQb4mbfRMiHhNh3YU0rGctNb6uvfD/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpTq+EYaOf33mkP0QbI4hVWDfTMc3+BcRAeyKVHiQdA=;
 b=Qg0WMF55k/bOfrrcrnEmDyEj8/Yp+C5Vk+a3YPGgDogOp+ItWErekTFUKCnG8IbWNs1QvnGQcyrBmmwdWeM3JHSWCTbK92XjBf+aoo7pJWvm+LBSGHF/d6Xkv6qG3ef+5vrPETXfTFkrF4OdBCs3njMfAitQCKR0qrMuO6PfUb/eoKdTieySwTlQrDPwMpD5BRUrA9lOsT7NNtKDIpqBqCgTEI4HuIFrXFLGbxlSy0x4kAd17GUE2FKxQG7Z+h9Aiy5L40wDM3o4ngyJSqVGaCT6yX+jzPUM0t6SPAXKvtlRcdNY91nRjLzZYyaeKBKaUM1QHtQ3GTfeaW/pIrFDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpTq+EYaOf33mkP0QbI4hVWDfTMc3+BcRAeyKVHiQdA=;
 b=gDztzgY+0MTm858J5pOD5Pd9XMYDn8b3HB9bRXThKIG3nIuA8Iz2WZr54mlYTUGmJHgrh7VZTPz1jnKsBMZHQiDBv2ZEbUfHxUS2PxyPG2xYsavbOoPW8RgKq3rHpGae6dXCiruNikqadkTSoHNxT1m65ZTORLyJX9MSlakIxUI=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by CY4PR1001MB2152.namprd10.prod.outlook.com (2603:10b6:910:4a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 03:06:19 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:06:19 +0000
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 01/27] target: remove an incorrect unmap
 zeroes data deduction
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1r169k2xu.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-2-hch@lst.de>
Date: Wed, 06 Apr 2022 23:06:16 -0400
In-Reply-To: <20220406060516.409838-2-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 6 Apr 2022 08:04:50 +0200")
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a45fa5a3-2b8c-4663-be6d-08da18439656
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2152:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB21524D0DD0DA9107A204A6C88EE69@CY4PR1001MB2152.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U4jjgczi03ykHWBNvY7OUBUl1+P80cR/Pe815rLSpQPiNX4p1O5QhDHqf1wb0FEsseboc977hNdEwEtbd1OycC6feYukDwwGM6vRWJ9hnSl8Qla7fwnuzysY6uZhV0fNUxdDpjxq8jkvS2Ds06PvCrhiQ+38fH2gifhYXSRWFhmO9Cf3jrRek4L/CaYDd6oRJp21Q5GIc25es3mUqapUBvooJxsToL5+O/kxRSJGZrxGqkgW8Mf20mbBDDl7GkFeYBfdWOSR9al3dKNsnXVmY88hK/BBnj52ELHutiC/iARkhBn2EZTAa+Iz7gjhIXlwk1CEDgzrY5iIDMREZZ4oe4qXriRBFYbkgvrJZPZkUE8CVWfhUs62b1f7iOt4a38I93Aymu4OVExiacn/TAU3qNyq9Buu9/Mkkak5PexXn1+OUquKnzsGRHJvz/+eXAjnyRAjbJ4EPnqvffFyBI0vGRR+L6VExC0M6f6TD/camXxxE+fhAWa7wyIQEa1tACHnd9nXf27FxWInrEfmagMuctIHlaHcmMfzcwJ+zRXj3cNxXo42AMclnbT5HS2pGNAqHpGJsBLjvGPEfKpqfJsppBI2yNkwkzlKrXLVIN2L/0r0XaR3eg3jeSnkza4XGYe1DKIbnhfiLFZPWRUdryMWADWw1nBWFwnf54YkAJ/QZoUtK1Sr0ySgpMS5Nhr+i/yxz+NTO9Eemx5gQFo4hvkM2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(38100700002)(26005)(6916009)(316002)(186003)(52116002)(2906002)(6506007)(6666004)(66556008)(86362001)(7416002)(508600001)(66946007)(8676002)(8936002)(66476007)(5660300002)(6486002)(4326008)(4744005)(36916002)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UbvtdeY/WpI7IE69sOVw6UEfNF70GJW4dnXBu/iHpMIYsgZ0OAJz2FQNTf1+?=
 =?us-ascii?Q?Ru4fQ3g0T/TgD/819x8t7i7339YNEizfmv94rhlwOoT7Xu0X3aLk2XkimHvW?=
 =?us-ascii?Q?f9Lc4klBY5eJ1+h+gp1vsELef0t5NM/8NFPn+J80OEGlRMl1ACjxWJSFpq9m?=
 =?us-ascii?Q?28C/eV5eRPyUizccET58vd6jR6jHJsH2BgV1+7ERmJ0FAzR94ltDjrjVqQAw?=
 =?us-ascii?Q?iLu6Vzhb6n0XZe06opRi+A2GYGXlTgQ4QVAfAxHQcCU8TZqxhrNd5N1elAMT?=
 =?us-ascii?Q?oz2AqQREpFDUZuQkmXppAyclNqTDj1q8XwM3nithmNqDIKHtfDh6BXBl2P4i?=
 =?us-ascii?Q?96nT6qK56M+I7DoLF0TI+mGnCKp8CGHA+KJ4oa3NYkrvDbISAjCgNyfOyygQ?=
 =?us-ascii?Q?lUN5jAzKyN8DHzXhsG38Wz503ogU1IUzpY/t/ngSpdKnPvcx4gGFeSoZaBxy?=
 =?us-ascii?Q?14c8GApONY0RA3PX+4U5PBnZkEFpV2s3QK1O+LwZi3+l3oooKuiZcZrXpgwc?=
 =?us-ascii?Q?BgoPN+GCogcsK+hDCnPNliicbNBnGMS1/cXHmMo2te+LH2HDYcguSdYEl7jq?=
 =?us-ascii?Q?DINuBF+4N2a6Dy3Dhy0WV2u+bZXNCJi4+15zo6U744ljBLJrjmDU8WB5U1zK?=
 =?us-ascii?Q?4YMOQcQ19o0IP8kiOushhRkHkISqjfNGJcOYfzoo/sMNMTjnFw5L0vkRYXJe?=
 =?us-ascii?Q?vaEpQ6mDjzbmdh660Qo7v/rlIOt7RlZhNP2qfEqd8x4we6KtlcYP609iZkDW?=
 =?us-ascii?Q?54gWsCGGPZ35NzWZ1cII/oemqT1iwWUruuKf7y6eMppj3Fsv9SgUFzMx0UcD?=
 =?us-ascii?Q?0vhgX+deU1WetRzCH2mHfgPfBV5Kx87kUxyhRHTX7ZyLihGLNESJxcyGYO0p?=
 =?us-ascii?Q?UeLxnGf/iC+uTAIPFHclyD8jp7+tGqvWt0PyptEI/yFHN9z0Ldg6aRbRmaVC?=
 =?us-ascii?Q?PffbDi1/0F1IBTaR8CxfpAHJR5BUu7oPUUwL1qFU06F/ZrfTHDpd98/kMDpl?=
 =?us-ascii?Q?FsnXVpDsvKa3bWITIL3CQp6NszgaHGtshcy1uXQBQP55NGx2wKlrm7U0uQyb?=
 =?us-ascii?Q?akyb2mWSObChzNDNWua7ruo0MOGVRvWnOGYuQjY5zKCBCAW2LUssmPhoqHyE?=
 =?us-ascii?Q?PktZB0bUt+9Ffs/aDkMD7UHuv9bTVvO+XW2sA428ASfsT19L8hOwTsthBtSc?=
 =?us-ascii?Q?/hzBdNfVSSHf/bnCQwQhs5NH693YW+cGIj553WaWzgsytBn7F8BxOxoczloa?=
 =?us-ascii?Q?+WsnoJR338uaO2mJGRcLjSsgjvn0FoaXsyn+f8J3H+yTmeMdyTG5SFwJEd25?=
 =?us-ascii?Q?cTgzv0KBRqMKHCLSklj2zE0jCzgnYq8TdNbUMva5uLplmFImrbcGaoadlnnR?=
 =?us-ascii?Q?dAhwtzfKWNHI22QUH2/i907lloRx1w8doY7sahy2SKBQudgVJetaK+nXGKzz?=
 =?us-ascii?Q?UC7Xv6ftacJJfEfyDUYifmw/5IuRL+TqI3OviHY/jJPdMoFcyqr0AbMB88TA?=
 =?us-ascii?Q?7gA/rgTVv7cDVqDTWYPGDZ3OrnpYSq/CiuqI+opiLh7byOAXtnmhCldW9wz+?=
 =?us-ascii?Q?5z60/4KCkzGHdabh1/zB9SVo9ZbdlqJdsj/A89QRczyR1sU2dYYX+4mPks4J?=
 =?us-ascii?Q?sx3ggqr/u34vNYrMvtjepDnHb4iaMEMrMF2Q43wpVpRiQH0oc2Shhjj7RTMg?=
 =?us-ascii?Q?DMyWTVwsHHKlHQBaE7IosidvjTg0RgT8wcuD3HuXbgWbCLnLDZGwp94QJkKh?=
 =?us-ascii?Q?zCANJIQgaxWY4L7FiOz3415QyP3prOM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45fa5a3-2b8c-4663-be6d-08da18439656
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:06:19.3144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tkEIoZ4H14YUgKrlQd1Y9moaGyVjpl1sLoZnstWUDniQCbedG8LT5Gd1DY+Ny8/39s7sr5pKhBb9B5hbVtDgDdzDmpGJ/9F7To1TqLdYLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2152
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070015
X-Proofpoint-ORIG-GUID: ACpnJmmUm1Uk0SAf9i9nz7kyk6fpQP0Y
X-Proofpoint-GUID: ACpnJmmUm1Uk0SAf9i9nz7kyk6fpQP0Y
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

> For block devices the target code implements UNMAP as calls to
> blkdev_issue_discard, which does not guarantee zeroing just because
> Write Zeroes is supported.
>
> Note that this does not affect the file backed path which uses
> fallocate to punch holes.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
