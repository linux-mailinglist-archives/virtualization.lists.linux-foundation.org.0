Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D71365256EB
	for <lists.virtualization@lfdr.de>; Thu, 12 May 2022 23:16:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF14416E2;
	Thu, 12 May 2022 21:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etFsTi22CiUB; Thu, 12 May 2022 21:16:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CE408416DE;
	Thu, 12 May 2022 21:16:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FA92C0081;
	Thu, 12 May 2022 21:16:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68D56C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55495416DE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibOLv4Vrz9Js
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:16:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C2B3416C1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:16:29 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CJK4l3011683;
 Thu, 12 May 2022 21:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=E6H2IlEHrVkspdhXXRlK67zvnpq+WtXK34Llk5sgkCE=;
 b=qIHSWRtDM+5gF9+xzHW/Da534Xq6g2j3dbfq5l27mhACT5yzrOS891c/1d6P6WufK4PY
 +W3yTelZns0mSwXmzO9MwJfZJkhzNQWJJrOHTpjUfkDgkoE6TTQFdT/KuAqtbyHrX48i
 yKzx3Z/2D+lU9azaHJJoA6K0ho/6Px/lznsUxPzVJb85f/ZvgFbtXUAxIE8mAU1jsSWu
 02wAHuOewrPVKf0tJc9YaSUtVNiuZ58buE/0GxivwL+AQtharMkd4wKDiTvoj9hh1J8M
 WE/kHrsdn9oZJLuWJWYWpgmNyCrPYcYoRJ9oQ13ygs6xR8J7INg6W/hvrT6cE1N8XlY3 MA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwgcsx2gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 21:16:27 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24CKtXiE003114; Thu, 12 May 2022 21:16:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf759kpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 21:16:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlDUKje9yNm+oTFxyvHTsHL4D94ypUxUbVAcpJHT9lWFfCrC5QzMMKmZ5WNIXlEJCLOJp5ekLIMeyEGKVunT8/zoFbOXh388ptsKM1276fj4ImEtSu4w5eUjnVba7bvS4iKLFxzDJn8iDn/We8asOvXNKg2+jejWW7VGVUG/USvBaxZvYasNQ9XoPSWaeEAnUDWTxPG0YlcptENUZ1hDhe9H0PcKGB4OrR70BAzWYI7L5EF3x1vOJj8Bzb8VFWcFgCJlroZMG3DbfC7N66TvnOvSdF1EiJ1yhm0DxaDTV50yRrrjAXwzL7khVTehj9OfeK09fEUh5KyPCRQIcYtjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6H2IlEHrVkspdhXXRlK67zvnpq+WtXK34Llk5sgkCE=;
 b=ICwzAwRiUKaz2WyHsOMnWC4T5J37mJLNBa90MEibJTqWQ8RO5N5+4USwnmzcoZpzXISJtCMPPMZ1rddLnMHT1xf8UrqUFFT9qs3nOk6RDUF/mZ8V2+q68/6f/lR1BYCK2iwDeOZOEoklTe/p5gZp7OhlBoLhLcpJnowYsWhO6Mxjou/C4jDx3gcMY5o2up8qvg6M0chrtsvu4AHU4mVvzSnFzkHmT+kn8BkeHUKTIsXQ/VBFz4kEnxS0UpSX7IExNgdLnEei5W1nkuK+9d80CGv9WVnfrRWlzeHx9ksFvoEKdcBbhTCr8TaC9tMqsgfotx/nI6szCSjgAzPX7b2zGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6H2IlEHrVkspdhXXRlK67zvnpq+WtXK34Llk5sgkCE=;
 b=kwR0Zphl0/8WWyeuGENg5ffIltRNjjn4ykiTz4KdKvgC6ZnCTx4DYnDUqHyWHhDqimQSNknFUYKid9fPdARE2+yeydgINcyTxgqXWiwEj2FPzswsFlHPrO5nLsj4QuSeVArwRHlEIJQMN0A1GObazuxPnXQ4L7plOBuBhtKS4IA=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by MN2PR10MB4157.namprd10.prod.outlook.com (2603:10b6:208:1dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 21:16:25 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 21:16:25 +0000
Message-ID: <5267bf1e-3d74-8344-d4db-698845d941a2@oracle.com>
Date: Thu, 12 May 2022 14:16:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/3] vdpa/mlx5: Add support for reading descriptor
 statistics
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com, jasowang@redhat.com
References: <20220510112734.205669-1-elic@nvidia.com>
 <20220510112734.205669-4-elic@nvidia.com>
 <eda33c78-fd39-a5bb-9e9e-06b2c37d3fe5@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <eda33c78-fd39-a5bb-9e9e-06b2c37d3fe5@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 596d5d9e-df43-4a7e-d539-08da345cabb0
X-MS-TrafficTypeDiagnostic: MN2PR10MB4157:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4157A242DB13BE68B56C33DEB1CB9@MN2PR10MB4157.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W5cj3ABIjUAuPejJc30rNfIrvNowKHveMQ0rSb/MwHgUlHs/6b72dRh7ixzvxc4qMkkbpS3zlnkgGZRsVgeRU0digT2rXv/J/XdnqaXNtleqv+39xr/a3/OKeWxX64yWvrUyPltGJLzjKHuCX53iD/9MoXNtpnv8+szuWPUcV1sw6VuW1LVnDAOhRri6A/y6wDIVRiB1Bu8EipnsCZwh4KoDV92kmkV3YowO/l/xhTDe0TUAmGmrvPdMMeQuxuvgWUngO1VEKz6evkH1Q4uYyNsz/CqiwK08w/Limys/JOrfPx21nDLyBWB92bg/sLGbWi3FUoZVSH+pFH9MRbfcekz0A27CFso8F8gQWw+w2fUL+3YoqmJQb6PQKwyW7lulP4TIxpsL07Add2kdb/Q/K8P05xnSuQd2b+qBfstrCg0reMYQjLfhrR/8rzn8cfTNo9sSs4p6BvW4G4d7sarnaH3OY85btRttxmgveNmcDm4ujfDQQgxwsbn+wxoc6x3SHDjUCBOElMYtmdkO0Y3T5Sarh0yFzSz+Zp+hNgtp5PyJqn4LwzsJZxKj2w1LCtANTaf1zLtnWHtpczjMFyV+gGUSddCmrfoOqM54SO8Hauvrofxudx242t9/xC/RE+v0sAf1a5wmPKtcZmzxlMmGsjF5YVLY+KxgakLbPb0thRwfkmRbEdyvzAisjDJKxwQTvAljkDkXIy8azbVjgGc2kCK85xIwjqrNCy07Lg71U7bGAR0lm6+65zFM8737AT8V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(26005)(36916002)(4326008)(8676002)(36756003)(86362001)(66476007)(66556008)(31686004)(2906002)(31696002)(66946007)(8936002)(558084003)(5660300002)(2616005)(316002)(186003)(53546011)(38100700002)(508600001)(6506007)(6512007)(6666004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2lFWWk2VWcvY3o5SU5oMXFiM3QwL0p2L1JXa3BwWFcwcmhwU0VjRnZsYXFD?=
 =?utf-8?B?L3MvSEU1dnBSdCtKZ1FlT3BleVE0TG5yVUg2SDBCYmh2elJzd3JLQldJZldu?=
 =?utf-8?B?cUpmR2NFUkUvUzhUM0haVVhMZkJVSjgzbUZJbEp5eDN6NTBlcVRGVnIrMzda?=
 =?utf-8?B?eWF5V0pITmlId1B4KzJLa2VHa3k0ajJIMXRkbUQxMEQ4aHE3SkFCOWpNQ25n?=
 =?utf-8?B?dnJGZ2FCSy9SbGhxVk1HeTZueWEwM0R1blA3eW1LdmNyOGV3NE5JaWxPQ1ZX?=
 =?utf-8?B?dW1YVGQycjNDVFo5MDFHL04xQ28xUTh5dHluN3Z3cmQyK2F6aHVkRkdxbDBa?=
 =?utf-8?B?K1ZjUGNzRGZpSGZnM1FZNWo5WVhHMUQ5cTZiRVRhRTNOU0E0Y29wOGlFa2Ro?=
 =?utf-8?B?aVlxeWFBYjNpdk1Ncm1VRTNrS3pRNDYzRzdmYXhKUFFOYXlhb0h1ZG1JUzN4?=
 =?utf-8?B?bXhuanRBcWNucVM3RjY5My9sZ3laT1VPVk03UjhJZ1Z1RHViNmZVTjhyTVh0?=
 =?utf-8?B?VDRIc3MycE91WXhYdjZvNW5GTDJ2RW1PT2VtWHlSeDNVQzZNLzh4dEUxNVcx?=
 =?utf-8?B?YnpwWUdCOHdJRkIxSS9RUG1XbXB0SlU0bnZaNFBkZnRnMWtDS3NzVklBa3Q4?=
 =?utf-8?B?YVFDcER1QlM1eDFpV0IySVROQWNiRWcreThyZHRkQ2R2T2hTQnRjMHVpY1pl?=
 =?utf-8?B?T2hveXdObkFPa05mMmZnTTRVdTh1ZkQyWmU4WkFOSzIxMWZEUEkydlpxY1JP?=
 =?utf-8?B?Nklici9KWFhuMjVsWWhFVnJiUlpqeld1SW95RmJNaS9kdzQxQTc4am1QR1pL?=
 =?utf-8?B?Vzk2Z3B1aHMrR0tiSGZDZDl4ZGQ3Vkw2cTlXK3gvdTh1blB6M0kxZGZITG9p?=
 =?utf-8?B?Z1pxQzZPcmJ6eENTallXdjlReGJ4V2xSZnJrMGhzVk52dDBlTXMrdWJ3VEdq?=
 =?utf-8?B?eE44YlE2d1A3TzVjdUNLZ2hGeVBRdFd4Y2JTa2VRZEhReFNhcHY5d0VISDhn?=
 =?utf-8?B?ZDRqK21rdkk0S2kzdHZxZlFPV21ZaEd0SS93WTVEOU9QSXROUmJQVnpDb2Iw?=
 =?utf-8?B?VFhEQU9hUUpVZ2V0R2l3Vys1dnRBV1ZibyttQ1c4T2Z2K1YzUFFVbzVLRjFR?=
 =?utf-8?B?UHllQjBHZHlJQ1lVZlcyREpNODd5SStSQ2tZbXZBOVU4c0J2ajR0aUF4WkxU?=
 =?utf-8?B?eTBTTVc3QWFjbW9DdmxMTmV4ckhVRm9OM0hSMmx4bDROSVVtSU9GbXhoVS9P?=
 =?utf-8?B?NGhzYnlWcFJHNXJOMVlWcWozWFpucWVTdlJPYVFXazdFSzFWQWhYVGthWTJ2?=
 =?utf-8?B?SEY3cExZZHRkeWdJb0lJTlFUNytGSVpCcW9HQ0IwZkd0VkIwWEp4dllMM0th?=
 =?utf-8?B?clNJcUk1cWxucGRNVXEzMG9nNmxxNFIxZVBRejQ1OVk0TTV1NncySXY1OWJY?=
 =?utf-8?B?TDBVaVF1d2owWHpFMXlCdUU2clE5Z0lEOU5VYTZaQWt2YW85N3BmTFZZbUUy?=
 =?utf-8?B?NW85Y2E1eFlyQ1ZXMUY1WDF5T21sZ243VzJjdDhkanc4dEoxY3pITk9ldTh6?=
 =?utf-8?B?YlprTUptcEV3QzVXMmhmMnFvWW5JbHNST3cxNHVhNHR3TTVFQ1VBeW15ZFJx?=
 =?utf-8?B?SGpIb1hudlgvZ3Z6SHppSzQvbWRjT1pGcmxOYlRmL0Y5UHNnVE54NTdEcDhp?=
 =?utf-8?B?eHRPbllQMjJqamFyQmtJTElRTHVCaGQrZ0xuWEIrbkE1WEhLU0hpSllOelJX?=
 =?utf-8?B?bTdzY1c3TGpVQm4wejRPSDhxWFlEbkhQWlRmVmdNeXBLVzZpazk3MTRNczQx?=
 =?utf-8?B?UEQvNDJKNk5BRXNVWlNXVXZOOERoZ0pRZWxtdVBZUkZFV0h0YXRJYWJlT2V6?=
 =?utf-8?B?RnMzS2JNT01Ma1d3VDBIQzNReHpQU3lpeDZsdkc0M2lrMGZQS213YnJUYUtp?=
 =?utf-8?B?ZGVlbUY2WkVZTzU3UTR4em9maG9HUEg1SjlUOW9KajdsVE1zdVYwYmh6ankz?=
 =?utf-8?B?bG5ZVkNJMU4way81OUpDem5jS3hzcDFQNkNCNVJKMDNCajZ1OUFieFR3UHNt?=
 =?utf-8?B?aW1jZDVpK2trc3Q3WDJZSEtCMVB2SFR2ZWtZemRqOUdWUUtxaHMvWnBWV2lS?=
 =?utf-8?B?cUYzUERucnBmRXJid3NpMlZHeFdma2M0QzlsZVZDd1hNaHV5dXpCWS9TZGxI?=
 =?utf-8?B?VHlMZEFYY3gzODVBQzRvTlNaQjNIb1FpVzZka1hVWXBvcU1sOTFQb0VEV2lS?=
 =?utf-8?B?YWhCSUZJaC9lMHRVRWs5Z0RVQ3I3Q253ZUxRemg1aU9BVlpqUDZuZVB1bFlT?=
 =?utf-8?B?b3p2SUxOSnBSd3F2ZmlnMWcvb1JGSDVjS2JNVFlpaVNkeGsyWlV3UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596d5d9e-df43-4a7e-d539-08da345cabb0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 21:16:25.0349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB1p6cBza9BCxDDaUJesNEFboMHol8NMy8fDowAtvqzuQ56R7PkA+5iDnAv7iXrYt9r9f+aNqHdN8BhHw2YXOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4157
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-12_13:2022-05-12,
 2022-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=971
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120088
X-Proofpoint-GUID: ZbO7uJCZz3f_f4BKFaTW0rrrUguaL4Jk
X-Proofpoint-ORIG-GUID: ZbO7uJCZz3f_f4BKFaTW0rrrUguaL4Jk
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CgpPbiA1LzExLzIwMjIgMTA6MjUgQU0sIFNpLVdlaSBMaXUgd3JvdGU6Cj4+Cj4+IEBAIC0xNjQs
NiArMTY1LDcgQEAgc3RydWN0IG1seDVfdmRwYV9uZXQgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBu
b3RpZmllcl9ibG9jayBuYjsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdmRwYV9jYWxsYmFjayBjb25m
aWdfY2I7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IG1seDVfdmRwYV93cV9lbnQgY3ZxX2VudDsKPj4g
K8KgwqDCoCAvKiBzeW5jIGFjY2VzcyB0byB2aXJ0cXVldWVzIHN0YXRpc3RpY3MgKi8KPiBEYW5n
bGluZyBjb2RlIGNoYW5nZT8KLi4uIGFuZCB0aGlzLgoKVGhhbmtzLAotU2l3ZWkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
