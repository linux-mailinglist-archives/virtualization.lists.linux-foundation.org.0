Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 421495256E9
	for <lists.virtualization@lfdr.de>; Thu, 12 May 2022 23:15:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE01660B88;
	Thu, 12 May 2022 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ljB3S3QA9uU; Thu, 12 May 2022 21:15:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9CA8D60B7D;
	Thu, 12 May 2022 21:15:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BF32C002D;
	Thu, 12 May 2022 21:15:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46BA2C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 278E460B7D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJHqrVsxGCZO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:15:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66A4A605A9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 21:15:36 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CJTvDV010445;
 Thu, 12 May 2022 21:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=nn1715Akq7GpKv4/VJSOq+PUt5oQHFDmvxeMPMsZL6w=;
 b=LCON/tyjyEICMd4cPpL374NtjYJB/Z5MMn39quyL5af+UnuCQ4CeMwQjUNwrQa2ibMF8
 v7wM2o9msdHIlPnPW3VaoB7VJfts7k76FQVY1dJ7xRnXUX858pehnaU5SYoEy97F0+48
 2AX+jpfZD1cKglEQJPj+ss7lo5ExX2gNeFEds42G9Ys6Oyz0Rb8NI88HXPMnlnaUzOi/
 4iYKvdorkyVbEnZRC9xpk0+iS/UOptV1JPJuGQMvqc8leWE9ebxEsh6/ZrumBPCIVpjG
 XuESrhND+nc2mOhUqT5SuOvj7RFJCMq+s6qQkpD0uFJVCZOy7lMjNpMWW2TXVkA8I0A/ EA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwf6cdk9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 21:15:34 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24CKtjPl017747; Thu, 12 May 2022 21:15:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf761wnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 21:15:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bK8k8dIOxoNRZCuHJKEpSWTtC1k58+W0rEr+7oY9BUS+VkmUpenSPoXoUUFaDYPrBgn+GMxN/+Z+4QbAD4YqEVjJ9SwWQwPLzZiEz/xDNKlKkKWsBcXJ4vBhSH3luqcbksf5PRyC9AvVt148ss1A+mwrq/cyrXtthTgU0beo4vXMZPTd29U6N4yOgkNPTX/assTCRmJ5AzijSAKHkmUE7CWuG1eJcr56rYQtlCfMOGSw7FSTA4S1OpLLzWxmtbsTcsTI4jDh9Ia8Ss7rYYIO3fUVZl8Gr0XJfARJGrKWIN9cIdmLuDMEVVSsJYW1DtGyFMcL/nWqKH6ljH4ZBBRqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn1715Akq7GpKv4/VJSOq+PUt5oQHFDmvxeMPMsZL6w=;
 b=cixf3mGQBmkzc/RB44ZEEsK6FPSpXGfyjWM+7hb/1W62RSiL/0SMKH7IyiDmBYEenH7/dKmbgFr5cJ8YL6smPp4pcg4/p1CTmMvGrNQhkoDELonOZrpja5ylVtNpX2+oOGEydvft7+22G2D36JY2LzThFD2qS3g1levhGLlszQJkV0HQYPG2KZmWXNcmE/lyBzKaolHweWJvHtCRXfLdV8oH1HYdHprIAG9Q32mtiWQbudz+iyTT3tpKELnLSwAI/NkSYE6OqTFjt0dii0S2NGZIlO50LudGdLfyrb8KJQhdAD2Vjh9jPFFBToHUlFhx2tH80m6u7ufJJ2TipktA6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn1715Akq7GpKv4/VJSOq+PUt5oQHFDmvxeMPMsZL6w=;
 b=uSOdK8QHO4B/NHVVSG6Obb3O/TCu2kwxp5hpy+B6chEcCIM0xwZxRj0GdAT1xv+3q4ZHtHXecOX+6BGiEUHbvlIdS3uM3QnPSFA+yARiKg0tsK/+UAOQANvLmj9jet6T6gOzF+BIRxEuV1dP1OG4U6pLwudyzu6Lbckj1IQqoNY=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by MW4PR10MB5863.namprd10.prod.outlook.com (2603:10b6:303:18e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 21:15:30 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 21:15:30 +0000
Message-ID: <5d93dfcd-22cb-8e5a-1dcb-c6de6772b789@oracle.com>
Date: Thu, 12 May 2022 14:15:27 -0700
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
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1fa7347-b661-49f1-92db-08da345c8b11
X-MS-TrafficTypeDiagnostic: MW4PR10MB5863:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5863F6F7505EE9EBFEE507A3B1CB9@MW4PR10MB5863.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GaLL5e3LkidrDSB/UuuIrdtrXVxEVxJXAcV8cwbCzfXYP2PzaLBpr+ETzB0Vi3haxHWPcSKAHborgM0I8Rxw9H3Zq4PySFWyIw6cF1d5sR+GPU0FvkEG5mnbvJGX8ulyrYW3KydhHbACiK3k6j0Ie0ak3ChubFBml1stZih1WP999YzsUo8ozWDE0uNx2LTVY/BCDVvDL8zDeF5WNjyGD3rBZlG0Kmvj/uupvt9CWRQwAeIzLpLNaK95fQ8OzUWJ4d4eeo1NL/q2XTnRAV2VMDI+bzJ/HoKsKHYHvkbQt4jmbz7kSaWf9b2jy1fyXySV/cL4hgBlyF8slIOnEwKPJRptjGhM8LABD6AW4gOtQMiD3Uv/CCmuyiRT7B9I3HfeDazHXntvOUo+OZFjAQOzhSuQ6vMn77XJfIHiLxwzDoxy8zTkwk7Dtd+ThBQbKdKGa4ZyGwn1+0NhjzjYr5zP1jpdRLZ1Uagql4n40ZJ2cxNs/WpF1eTTknhZZNGsNuGdyZ9e4Ze2CetrneUmlnqYSpyELgWpmqqQ+Kn0NfqU/nMbgKFC0KaWh8nEs0wGQchNWuUZCjtLlSvc0u9tVOmGnBL8Q9NDPFeZQ8FEoytby9yWRu04ci5QWtceKMo/1JXcbLxTtF0EJulZBXlbVhCxqPb0I3n+Zn8y12AhGWITM2jgDXdbpCUSyb7vWKsux4ZP7WZhtbrTedkImwpYXJy3ky8RtE9dRWtdMEouPBseNgU7DLCV8owzTXxNOKt61tce
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(5660300002)(83380400001)(26005)(316002)(31686004)(36756003)(66946007)(66556008)(66476007)(8676002)(4326008)(6512007)(186003)(86362001)(53546011)(6506007)(36916002)(2616005)(6486002)(8936002)(4744005)(2906002)(31696002)(508600001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWJjcDBUNUkzYzZrcXlyaUlaV3JlM0pDOHp4Z1dYdU1WTDlLbVV2QUsrM1kv?=
 =?utf-8?B?UlRUSVFkVk85UG8xaU9NMERnMWp3VjVreER1dVNyc01wQXFmaWpma3o0LzVE?=
 =?utf-8?B?SVRvZ3Z0ZnJST3NCdlpjRTBrM0ZTbzZtQmZxSGRlYVlrWklkNFdFY2drWFc2?=
 =?utf-8?B?S1IyTHh4cVRXS3JabGZBaWJ3ZFVKdzNsUFVndFVQSk9jakhDaDB4RG5pNHp5?=
 =?utf-8?B?L2pYdDJjdDJNWW1RUVJsZ1hjN1JudGZaa2ZMNExmZG1wdldOU1hlM2kyeGFN?=
 =?utf-8?B?STVGcUg1UWh3bDJ0alVVZkhDTGJwMzYxV1UwcEZ2ZjlBOWs0bS9wNWVXUUlM?=
 =?utf-8?B?RG03Z1l6cXFNRWxQTWpGNmpyWUVacHJLYUxoN2xmcFd2eEcvZzM4dVpnQ3lJ?=
 =?utf-8?B?NTlzWHlTTW9xWFNVZmFkQjQ1akoxekZObkYybmMvWW1jUy8xcmN6WVcrekFT?=
 =?utf-8?B?NlB6dVNQb1VQQ1p6UXMxUmZqU1d2dE9KWFhTU2F3akx6N2hzVXpvQ3pTZUtM?=
 =?utf-8?B?ZWFsSkp0MUMxK1loODgzTkR0dnNUR2pLVk9OVStNYUcrR0lzbTVvWDFCak9a?=
 =?utf-8?B?cGp2ZXhIUERIcGhSNC9YWEx0K2MxckpOa3pNTEFRVEtRU3RaclR6UC9YMU5G?=
 =?utf-8?B?Nlh5Zk9ueExsSi9XKzk5NXlYSGUydUtiQTVURFFIQWpKMzlZbnpyYzZrM3I0?=
 =?utf-8?B?b0E5T0xpcVU3aWZyYTcwWXJCQ0hyMEdidUo2WUVMVUpRMDVHRUhEcDI4YWV1?=
 =?utf-8?B?Q0IvR1A3VVRCS0hScXpxZWNIMEtOV2h6aHh4cG93bjU5TmRrUzR3UU1BN3R5?=
 =?utf-8?B?RElBT3JpVjJBd3FLcC93dUVoeWM1MzNFQ3RCSEpLUlpZdnUwTjJrY2c0bjFp?=
 =?utf-8?B?S1N2QzNOTndXcFk3Ky93U3V4L0F1UUU5OHBjR1Rzc09jVEl6VXRwc0V1UmRC?=
 =?utf-8?B?VEdydzdRMUp3cXZsZ3hFSys1VVdrbWIwcUxPcjVmZFZ5V1BFMW9LcERYckpQ?=
 =?utf-8?B?bmtnTC9FS2dQV3R6N3FLS29KRmVjUUZQVHV3NTZLODRxTjAwRE1uczQrck5z?=
 =?utf-8?B?TmY3MkQ1U3pKcVZNaTFwYlhKTlFjQWdaWkx5OXI4K29PVXJ3M1NxZ0U5eVBX?=
 =?utf-8?B?WjRxbWhYc1k3YUpLYTc3dDBxZnRBU3YzQkJqa3pkVEZFdXFTT0NjS3hsZ1hy?=
 =?utf-8?B?NVZrdk0xM282eDdvbWl0TUhzeHI4U2tOdHRoZUQ0blJGeU5MZTlGN09IOVhW?=
 =?utf-8?B?NUlUdWZwbENxc0FtaVdaOFZpWU00Vm5wdDVHb2ZCckZud0p3eXVNWmtCbWhx?=
 =?utf-8?B?Tm40RHlQM0ZLVUtEWXY5T1RpenhQUVloa3pBRzBaRXByWEFVZEo5OWljZnI5?=
 =?utf-8?B?UW1SUnRhUWRzdVFUZVJGdHZEcytlZHZqNUNFRjFLTUdTemNrcG80cXJHQU9j?=
 =?utf-8?B?Q0tTTFkzOWgyK1RHSzdBditiQVFCZ3RlMEJrUFFJdmtBM1ViMlJFdURwb0Vl?=
 =?utf-8?B?VmtqR3dFdythb2dJaGtpbXR6Y3lpd2o0aWp5ejZTOHd6WDN1eEFCRWNpS0Fz?=
 =?utf-8?B?bDA0bndVdlBub25GNlJkaDNrcVcwTUw5OWlXcmxpVUwyMlppOXFaV1BpOVh2?=
 =?utf-8?B?TTJ2cnMvTjNwNVVWQkpOcUJ2MnV2cEI4ODgyNUpOQXF2bzdQWThCcWxaelpa?=
 =?utf-8?B?MzdwNS9YUUdWYUVZOW5RYkp1LzFWaEpuZTFKQmVUQXlyYVA3L0N6aUR5TzR1?=
 =?utf-8?B?YXlWUU9OQTZUMUhRb2JMbDRvTnMzTjJHVUdrcTNNRXFvbklpbzlaWGpVbTBW?=
 =?utf-8?B?N2ZJNmM1Z3dUSzFObzAyZjhiWG5obEN2K0puZ1VLbjN4aHRtQUtTZUZXaVA2?=
 =?utf-8?B?dHpMUWczSFQrblhtdHR3WUQ2V2FpSmw0ZUpqcEVFWkNha2tvSzdRZm1aOUdV?=
 =?utf-8?B?YzFaV0l2dXNQbHEwMmVwT1pEVjRJQ0ozUW56M3haVmJHZm43VFNCRlY4a3pn?=
 =?utf-8?B?dDFwMEF4M0dqK2thb3pLenJpL2dkOUNKSU1TTGNpNHZDSnl0end0Ny9pbHZV?=
 =?utf-8?B?NHpKa3VoeWRQSVc4RzBEc2cyemhaY1BpYVZuNlJIaEFyMWVOMXFTRlhNMS9E?=
 =?utf-8?B?YW9PRURjaVVhOXNsd2ROMlYrU2RvY2lEMUhWNktaczB1cUdvS2RBeWx5WWZh?=
 =?utf-8?B?UUxzUFExYS9pWU5nY3FhYjhSWm91Zkw0U2RCbnZ6dXJlMDRtZllnUTBZZG9O?=
 =?utf-8?B?U3VhRUFyU0IyYWoyUkY1MUt4b0w1b3RqM0VVUkZkWlJpbkcwSUlxb0E2a1Yr?=
 =?utf-8?B?SitxSGY5ckVnL3V1Wm9KMWNJTndLUVJYdCtTU2R3ZU1UTTlvZUk2Zz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fa7347-b661-49f1-92db-08da345c8b11
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 21:15:30.2416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuNDaiy3YCybwDEJcZ8+Of5WNbYgq9xfKC3Hcswqj2ybnvticbUPWqD3i/g9Z2o4pgOIcEJALWJCYMd0z5Y73w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5863
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-12_13:2022-05-12,
 2022-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120088
X-Proofpoint-ORIG-GUID: _VvKMZg7Ql9JcWc-mdqziPVZCDG1HrTb
X-Proofpoint-GUID: _VvKMZg7Ql9JcWc-mdqziPVZCDG1HrTb
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

Ck9uIDUvMTEvMjAyMiAxMDoyNSBBTSwgU2ktV2VpIExpdSB3cm90ZToKPj4KPj4gKwo+PiArc3Rh
dGljIGludCBtbHg1X3ZkcGFfZ2V0X3ZlbmRvcl92cV9zdGF0cyhzdHJ1Y3QgdmRwYV9kZXZpY2Ug
KnZkZXYsIAo+PiB1MTYgaWR4LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3Qgc2tfYnVmZiAqbXNnLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbmV0bGlua19leHRfYWNrICpleHRhY2spCj4+ICt7Cj4+
ICvCoMKgwqAgc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2ID0gdG9fbXZkZXYodmRldik7Cj4+
ICvCoMKgwqAgc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXYgPSB0b19tbHg1X3ZkcGFfbmRldiht
dmRldik7Cj4+ICvCoMKgwqAgc3RydWN0IG1seDVfdmRwYV92aXJ0cXVldWUgKm12cTsKPj4gK8Kg
wqDCoCBzdHJ1Y3QgbWx4NV9jb250cm9sX3ZxICpjdnE7Cj4+ICvCoMKgwqAgdTY0IHJlY2VpdmVk
X2Rlc2M7Cj4+ICvCoMKgwqAgdTY0IGNvbXBsZXRlZF9kZXNjOwo+PiArwqDCoMKgIGludCBlcnIg
PSAwOwo+PiArwqDCoMKgIHUxNiBtYXhfdnFwOwo+PiArCj4+ICvCoMKgwqAgbXV0ZXhfbG9jaygm
bmRldi0+cmVzbG9jayk7Cj4gSSB3b25kZXIgaWYgd2UgY2FuIGNoYW5nZSB0aGlzIGxvY2sgdG8g
ci93IHNlbWFwaG9yZSB0b28sIG90aGVyd2lzZSBpdCAKPiBhbG1vc3QgZGVmZWF0cyB0aGUgbWVy
aXQgb2YgY29udmVydGluZyB2ZHBhX2Rldl9tdXRleCB0byB0aGUgc2FtZS4gCj4gVGhpcyBjaGFu
Z2Ugd291bGQgYmVuZWZpdCBtdWx0aXBsZSBwYXJhbGxlbCByZWFkZXJzLiAKSXQgbG9va3MgbGlr
ZSB0aGUgbGF0ZWx5IHBvc3RlZCB2NiBzZXJpZXMgbWlzc2VkIHRoaXMgY2hhbmdlIHNvbWVob3c/
CgotU2l3ZWkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
