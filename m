Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE05BA657
	for <lists.virtualization@lfdr.de>; Fri, 16 Sep 2022 07:25:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72B3083E5D;
	Fri, 16 Sep 2022 05:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72B3083E5D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=whJfR7Js;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=SFOxnLYm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPgDR1L1DPtF; Fri, 16 Sep 2022 05:25:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3674283E4A;
	Fri, 16 Sep 2022 05:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3674283E4A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43E5BC0078;
	Fri, 16 Sep 2022 05:25:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64761C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Sep 2022 05:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 267C241B37
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Sep 2022 05:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 267C241B37
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=whJfR7Js; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=SFOxnLYm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBFzvkVtWvaS
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Sep 2022 05:25:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 684AC419B0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 684AC419B0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Sep 2022 05:25:16 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G1ww7V018465;
 Fri, 16 Sep 2022 05:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=tMMKslU0XgOuVHI0vqLvDtV6KVmyWl6ymVlgjq9+HL0=;
 b=whJfR7Js5CLhSyBpTAd+DQZY8+olqc9wq/YE+DPq2y5WvGgJ0SucOfSKeVwWmZuqieE1
 f/xT1M3eyP4mZvsrp6a0PUuC5qcbJVyvfGm7HYitYD2hIofK4RSsJnYxCyb4bHhi3C+D
 CgukivDGoD13gdxKHC13lqrnxccr6LJJecEOCiVGI9c05N1sMrfyOZUTrUbyVOEd1tni
 qyTReo9om06BESlA7mJuypP3Mmw3cDbQSkks+2BvQjcMtYhY58rlRXMtCPcf/ZgHGvSe
 fjRPmL/roFdtEVxU/ElA7+xArD2cVtwWr5L5el/iN91gd1Vmh4nYlzYG+byRwyoMI/SE Kw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jm8x89df6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Sep 2022 05:25:12 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28G3mmPs025139; Fri, 16 Sep 2022 05:25:11 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jm8xdsk98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Sep 2022 05:25:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IP4cut6bztOeixQbHpIAgk19yq6IPdn7aiqZ8rLxNbRiigquiaziOSumMi0fgv/Dkjk6wJzZuhPmBgHhQIReq5RVW6aHGBYJJkST4RKQUyfURyJNlRGPr6xlkkGzm3TURMdOAoVdKh2hUj4oRx/vmn9lXvPBbHVIS2v6AkkciOBFTmOWoSJcTO13T9T4TjLO/XdKXPfG/1qXrjvG1wPLqUc5VlRwuZWSq5mac3yYwh1KmQo93lZ+L3Oh+xCzH0I/Tkq2dmZqICZuhNka0jCN9JAGaO7udFV4WD8zEA8b+AIoFYUWHZcXNs/by+yxxD0EpJbkyoYhrBwlb3IDi1yS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMMKslU0XgOuVHI0vqLvDtV6KVmyWl6ymVlgjq9+HL0=;
 b=VsuHvniI6XQlfLFrYcHsCehkkLsTqd/9s45jwAh9E4jl0CnZ3iykg1re6aCLrF9TuOdTtMX1bxmWXNTKBwN4TkAZWVHJCdWKl9mFDV6sR+vIcumjw8Emk/ziBsle6KcGCybHPBiRssO1Ccuz8yJ0BX37LgvQjDB01joLtmCEw4gyZdsP1jiEMvumQeTDFoAjDIKqL8uZ1xcpRn+5/ANJWL84GWZVtM8Har6PwBUaY0/9no9mnNtfCVlJegB/eD0SjwQs18ddPtAm4V6HZAY0YTgoZx/tydPIKa6nob1bh+Wv9/VM6n2s/tatw03ChYuI+3k5FEINZkdfmk1lZDdgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMMKslU0XgOuVHI0vqLvDtV6KVmyWl6ymVlgjq9+HL0=;
 b=SFOxnLYmWx5ypN2mOGCWxD5y8/oJC7Rq4drrlRklrwRE8gVq1w7m15Xk4xRuo32JRFZxQScY9sMi+UMbX+UMOnt8lBDymAsGWffCnQ9zPItt1QWAX9AUSXEvRKJYwMvF75Xa6tloRJ+ErkBxeHnC1fH8fdjIyhR/ukA4WcvYSJs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5791.namprd10.prod.outlook.com
 (2603:10b6:303:14c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 05:25:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.015; Fri, 16 Sep 2022
 05:25:09 +0000
Date: Fri, 16 Sep 2022 08:24:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] virtio-gpu: fix shift wrapping bug in
 virtio_gpu_fence_event_create()
Message-ID: <YyQIn7vQDMuKObRB@kadam>
References: <YyMJBkId0c1lvrrO@kili>
 <CAPaKu7SCZuX_agp3WUWkra63w6=+ZMyLSSqk9tZyB+B75sVo7w@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAPaKu7SCZuX_agp3WUWkra63w6=+ZMyLSSqk9tZyB+B75sVo7w@mail.gmail.com>
X-ClientProxiedBy: JNAP275CA0006.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CO6PR10MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: ea03b815-619f-44e6-bb62-08da97a3d264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: An/Kca6IhXrqRijR5J3wQvvAet/+LCDHWVt6gvei9j8SaVWXA1w/Q2Z8FYa+qqUVgBO6Pu5SmwpGrmeO0M4V13bkryo8Xr8E4mgrvE2GBeiKgPUHx6uN8vRqTJiyjux06B7OoRd2olJhDlMwcF1yS5TpVYKyRvZupRMiiV/Lrc2fV19SauP2E4U0Z13bwHnIy3TwHLbtubRMvJUWqC9SrQsqWrNmHfkemHOHm1WnuMh8iLgPUq1WRJLrPDFRB/C6UD+5GaB46E4f3BJGrEkOcwdH7Kt90sQ4V3i7eRs/WePLNqJVLJf8Zf0qHaT+LQ3o5E6wAaLTa3l61sGQy7XpK3npw75JjyX4rsIU2hH31EqtkvZCmE+3Xm6qSkxA2LiReTo3GigBuTIW4sangEfr/2Cr93ShaAmxfc0SQS6AYcBgpvqkCyhX2INlYwl+qRc/3Ny/1OtzDHCsBPK0xn3AA6RQ44ZT3IX161pa2D6k3ukGWkRHj/N4r9TK6nD4AVQsk8pjyYcOkQSWmD869/aSXmq/J4rL7Ji4rBkd4hJyFTfH69a3DZS+K2u1yv2+b0YC5/rXGDuVhnVsKbdXtXOrBHIDuHTYxZXYaKaHuXfcP8F9NvEsU4rXRux5DHvlswNZH1XoPm6HoC4+pRFTm4TEZtOCmyKq+wrpMTaDa3+Lbc8jGI6UPH555f49pkN5EhQw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199015)(478600001)(38100700002)(86362001)(44832011)(6486002)(4326008)(5660300002)(2906002)(8676002)(54906003)(316002)(66556008)(6916009)(66476007)(8936002)(66946007)(83380400001)(6666004)(33716001)(186003)(41300700001)(26005)(6512007)(53546011)(6506007)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0XpjL382qAKKf6rwnnW1DV3FxeFKjQ2PkDbJke9aWTRqJc6YUy3Oami2Wvh8?=
 =?us-ascii?Q?TdxZ1ljj76AGC8cxcUFwche9J1QduzUkuBBDVdnPmrepX390lQrrJf99IxV6?=
 =?us-ascii?Q?uFWLnSWKQPqqHbFk7C/SqSYp7NBNmQ0Sst2w7xRue8qH5vixgL9z5HD/Tw7c?=
 =?us-ascii?Q?24vJ1qTqUldazm6HMjyf19PKUr4gu+hg6qhn8AtNQQxJCS8Hv8SYeJvVOAqY?=
 =?us-ascii?Q?qMf7Pow3iWTAC0YA9YxzBd25Y9OgxZZfNvIB0ETxuAxq32C33q6gGpmDtLeP?=
 =?us-ascii?Q?7rcWWJpztkDNgRl/O8adtfDoaCwssLapTsw/XHxIlQwO0kpqFHKXt4ycCPRz?=
 =?us-ascii?Q?ayjC1Oxpa3nh6dAqxF2bET0CREtZQOWw3lMDL1pct1AV5pevTDUk/OZcj2EC?=
 =?us-ascii?Q?aDHZ/Xm8CmD6Um2VAcDI1yXaelnolz2SwzsF2Cqx6jPRCEmez8bH0i9yOZYZ?=
 =?us-ascii?Q?SgA28mYbBUBgX82f95iGPSsOhSUCtrVvlbZNBsyAw2/icg/PTjV8By5vMPKc?=
 =?us-ascii?Q?Oa1sgYeyXnk7105cBgr3snFUScXQrwTf2dgLoU6/kQamPxpgnXf2Qz9QPut2?=
 =?us-ascii?Q?MYnG5WE7PZiYf8mDvfFQmPbjOx8nYuTM33f3dv9+rrYbpZ5xW0ReGjZfLq9L?=
 =?us-ascii?Q?Ui8rYgerTZ+B6fwAsibG4iDSt9nvPdgH7QM0kCtbcMPeQ5UD4JmlRwRVhpjw?=
 =?us-ascii?Q?0qeQq1JEBwYLLMlgvbrVTjcR0zYfPE8rSQS+uTqvpuajxTDvxJf66djC5lCi?=
 =?us-ascii?Q?ziuFaF+xgPctgDLEw80GXHCNUCZoj/OTN6UjeCbLraa+qZ1UySxZRUxB28RQ?=
 =?us-ascii?Q?TvNv8liarYAJNs4X6LhxPldfrKRamu6XVHvUur8NQxhx0UTs6NbvwbITe1Km?=
 =?us-ascii?Q?n1moZDXaNdNP9BqR5W07+HGL4NMNyAu5F7uKgCtLe3Ay2WvGw24HEygMrxOJ?=
 =?us-ascii?Q?Tu3OCsCF6Hzscsd0u7wWqREOg9oTxax8zFeqdM4wuXQBW/BgW4Byeq3wY0aj?=
 =?us-ascii?Q?opbH8HDIrB8BTb6q6wjVX9rqOIEq7INXzXBm3by2GQdnwj86pBiyPPh1VXGb?=
 =?us-ascii?Q?HPtIXVPJXpTjqn8eGzbPYBXY+ZzvERDTgHkZP7AlB3mOuvXIH33rXgukfIhP?=
 =?us-ascii?Q?wmY9pk+xz3lKn9XiYScbsbO9BH2PSS2qMpElHeRpSONrtk07BpP44QfJTzAC?=
 =?us-ascii?Q?wQwWcZt63HuQHsxzPqeOO19hiIdmwY2BX6lS2WaLdwGhzIXDOjTCa2AelqOJ?=
 =?us-ascii?Q?X5ipM8oIua9OfwTy2xOg16EWEBINNEaiLAI+iq6AU7zlfSVdhCPxECxOnctN?=
 =?us-ascii?Q?hx9KG6mEaOWgYjwb2EjYeJsTxrhLD/PoAyKfuFQ5QWPUTe+FxjlLfe7K5k2U?=
 =?us-ascii?Q?LRyUgS96+o0a0De7O1HPvTBZ6ywugS++TaM9s+0Cio+AmBx7G6kJ+ZrmJCVZ?=
 =?us-ascii?Q?HEE2MKdEc71oXaldyX79mhUZZ1G+3hjMIyF2I3ncd90T+b7Ut2QvMoqA8j/1?=
 =?us-ascii?Q?cy8OMzIc1yzA/BQrZfjjs0iDiRc8TNFIdegdeV/3T3LkYd7NIhgXOafX+GZy?=
 =?us-ascii?Q?nXjC5SYpV6cdqHfATOzwXLQqCdBOnEgqgi0ncGZ1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea03b815-619f-44e6-bb62-08da97a3d264
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 05:25:09.7095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyOyvmCEK7MVUQdjhzBmVpdBZBHUFDJKP3a4thWZ7hzu1mKYXA7VUbvWiVkRoZp1oXGHdL4/qRkGiIv2OcnplcSLxYKomJLyBWd4iVL+4d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160040
X-Proofpoint-GUID: _-IXHRpJFOrU9Pgx5SeT-Z2oZAioxeOg
X-Proofpoint-ORIG-GUID: _-IXHRpJFOrU9Pgx5SeT-Z2oZAioxeOg
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Gurchetan Singh <gurchetansingh@chromium.org>
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

On Thu, Sep 15, 2022 at 05:45:46PM -0700, Chia-I Wu wrote:
> On Thu, Sep 15, 2022 at 4:14 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The ->ring_idx_mask variable is a u64 so static checkers, Smatch in
> > this case, complain if the BIT() is not also a u64.
> >
> > drivers/gpu/drm/virtio/virtgpu_ioctl.c:50 virtio_gpu_fence_event_create()
> > warn: should '(1 << ring_idx)' be a 64 bit type?
> >
> > Fixes: cd7f5ca33585 ("drm/virtio: implement context init: add virtio_gpu_fence_event")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index 3b1701607aae..14eedb75f8a8 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -47,7 +47,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
> >         struct virtio_gpu_fence_event *e = NULL;
> >         int ret;
> >
> > -       if (!(vfpriv->ring_idx_mask & (1 << ring_idx)))
> > +       if (!(vfpriv->ring_idx_mask & (1ULL << ring_idx)))
> BIT_ULL(ring_indx)?
> 

Sure.  I can resend.

regards,
dan carpenter

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
