Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3635603387
	for <lists.virtualization@lfdr.de>; Tue, 18 Oct 2022 21:52:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17D5940111;
	Tue, 18 Oct 2022 19:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17D5940111
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=cgu8u1uv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=v6sXQWv2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5QE48SfTBd9; Tue, 18 Oct 2022 19:52:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8713C40BF3;
	Tue, 18 Oct 2022 19:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8713C40BF3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAD4DC007C;
	Tue, 18 Oct 2022 19:52:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87AEDC0033
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 19:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6083D61117
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 19:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6083D61117
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=cgu8u1uv; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=v6sXQWv2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXYXc1GSfw0L
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 19:52:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54E7E6110F
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54E7E6110F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 19:52:38 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29IJSw8b029483;
 Tue, 18 Oct 2022 19:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=+dhMyrsmbdEqoLck7VSUZOY+8FLlSQMiPTEynf5AK0E=;
 b=cgu8u1uvsu50Tk8+ZSoAoiafvOQ9cVuv3Rxnjumd+j3wOzELVUqrx2aGr3EedHTuAFyE
 BtOOsQWYBVE9g3/VmTrP4C3JXWZIjOiiNxvtYVAlSugj2pP78XxeXJJBjtK0xzKvfbLf
 nkWruJUS9+DdV9qF1OFIGH7Gzfg5HLOiazJLGN/jd7mc+nZqTTD4m4zTP7xQTRY0qL38
 hw9rmpSaI+TVZq53HGOnGDwYySlF5Gc8GXITlh0Oq1kOW2x+PxkhaaEAlP9TFNyr/NF8
 gxQlKjec7ifrhnmEjPVzN1NEhsqo7FYLwqoBAz+GzKN+XgJ/vvwFl3ZQ0M4H0CXOaukr 0g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k7mw3ftbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Oct 2022 19:52:37 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29IJa8jq024348; Tue, 18 Oct 2022 19:52:36 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k8hu6r0b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Oct 2022 19:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d29VUQJI1MmLbPtGfT5Scw5JYGtqef9rpo8saA6ykkhN0awyNNmMHwhUO/QQuuu2xTVxt0IVplcK+xOs5DigQjUQUwKFS9YS3zRvVmkHXDkTZKCJJPD8JRMYwK0AralCi2bgG7zK7Huq9/mtKra539fVYrDQL4DmaiGItKC3OIPyvEGvcmGNYbT7nXI/rOZEb1pwELn51JR9X29evQSlIF868V7VlLXWG1HbD2HwfwWLIV2cvksSBsw3ZHb6T3LH9yuDWaqgBYjM2oFQVTZbUI11X7C4RQvhSc9IBVp6lQUPEnBX190C0f3/kiSJL2EXVeHRJBNZa6QgJ4hSmutjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dhMyrsmbdEqoLck7VSUZOY+8FLlSQMiPTEynf5AK0E=;
 b=jp7Hi2tf954kUvlxkF7sdH/OirdNc/kt6ia9Lsq3gto46c+buCDMvbJ7K925UzX8hRKctP8FGhQfHJZIUOagrJ7PHFDFX3LoXA0j/K6kgwx1biVM9zXggk5pJszAxMcrrpZABtY319lentP46QHcIxQSK6FErYXkwjjUAR0G7aywEntuS+pEjNTBuAeCrpD0DpvpLBdVd0l/nQ/iseh19tg+dxhNmYm0D/0ImQTt0k7hkyqXhDSR5YUygV23OP7Xbxr8jdqYQQpTVSewB6sVuSpLM+4wem4hT2C7cdG8nKEiHfW3v9Rn7YT6R3bd1SjKLBentGuSFWSzF06iaCAUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dhMyrsmbdEqoLck7VSUZOY+8FLlSQMiPTEynf5AK0E=;
 b=v6sXQWv2Ova4gcnnF7jTJNzqXBWIBsn1d2Yy6Qw/kj5oZ0vaz1PkJSDBv+OZhjfVB2OvTwVid3nxkFHmBXhtEkjp9vvTtiCSLZlHjXkaa5kRq749WJupYeCYwCrAlcMYRD1QS7yJwYEpUZQHPFNQePabgqnaQY5sHIKFfvgGukc=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by MN2PR10MB4336.namprd10.prod.outlook.com (2603:10b6:208:15f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 18 Oct
 2022 19:52:33 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::9830:ae4d:f10c:c30a]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::9830:ae4d:f10c:c30a%5]) with mapi id 15.20.5723.032; Tue, 18 Oct 2022
 19:52:33 +0000
Message-ID: <d6e8eb0a-1b45-0297-d84e-6629d8a9ea18@oracle.com>
Date: Tue, 18 Oct 2022 12:52:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/4] vdpa/mlx5: Add debugfs subtree
Content-Language: en-US
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com, jasowang@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
References: <20221018111232.4021-1-elic@nvidia.com>
 <20221018111232.4021-4-elic@nvidia.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20221018111232.4021-4-elic@nvidia.com>
X-ClientProxiedBy: SN1PR12CA0111.namprd12.prod.outlook.com
 (2603:10b6:802:21::46) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|MN2PR10MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: b42dd405-1b2c-4e59-dc7d-08dab1424c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 03hrYlico2BWQW6oWN2s2xvC5FbdN2fKDHBdTurlF7/sY42SmehfDJLHhjkW0iFvZW4Ce3CPc9/SgbcPS4qVikelqxCBMnquXcvJgIV3PW4or6Tm12zmdyFZayReP0oZtqcMBIlsN1S3nwfiTR3EPegJKqvTTP6Dlz6oMxueuYYjVo84t4A0YqnoKLXPoGKTG0IMaiO4iClECghztwvhIlVX6E1W639RLyDn1yzLzwwvseontMgi6HnYblnRGE/fJndiBDDThopggqjy7HpoI4k56yAdiMsrZjgtMPE/uVZPPZrsEUuttrws+r/0s67ElgObdMDr1HRL1X1ctrX3Y/Uygtj5yBJ8MOuFEWC2wEdraz9/DODz67v/gotmIatoQ6EIQFrd4JjD+ehH5tJccfplDH/7peboenuhZeKEeGxwX3Rrlp4CYsLoRbduI5Utz6A1dYGEviraQrYTdSFXpi7ZvulyoZdbb/Ba6O/Imc4GsT/uJWaDJALvQ5x9+cwcZDoIMJMYf2sQsfwH3u/c4e31cAsmxg6Cgp2mPHgPhm+HZGvvi2FtMRup1WCRINaNsgjUKFl6JTXhmINSBNIYEMGgoJUU32Nl6rrZXUnl96Txqnb+cn8WXjANUoR21f7B+4Kj0UiLFVpfbN8BAGtNUlnw13A+22MUQ+/6qRDQj+eXrXmyMrODUbcCZtgcZp4xaeWS54G3WrItjus0fs5GgCSkH2ZxO8nagewf1dUSBCQpqxBbfly2FjTEAp7teFsHhEUd2QZRLfpHVR3kEk+6/4Jnc8cbH+CEVpHpmuFpARI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(36756003)(31696002)(86362001)(31686004)(38100700002)(2906002)(83380400001)(5660300002)(36916002)(26005)(6666004)(53546011)(6506007)(2616005)(186003)(6512007)(6486002)(478600001)(316002)(4326008)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHUzREVsVFF6bnA4SUNrVHBPY3Y0eDF5ZVRHV3NvSllRV293QVpJK2UxaHJV?=
 =?utf-8?B?dUJ4bHU2aGREaVRmNFVGaXNnelBHSWhIeGlSck82ekQvT0pDWkV2eUN3TzdY?=
 =?utf-8?B?blQvMWdFWi9zNG1wK2hZRzdhbSsvaGNDOFo0MU5HeHk3ZjhBTEpVQnNkdXBF?=
 =?utf-8?B?aDc0MzFlTVozNkZuSzVNUmo1TytVSjByZlord3FUanVORzBTdjJqT29FczRP?=
 =?utf-8?B?QlZvZkZNRDJSQzJUVUJ5RlJ1Q2ZQQ2xFbVVLRWUrOWpkQk5hZ01raVh3M1lS?=
 =?utf-8?B?SVg3Rm9yRVMyRGR1M2xWK2tjcjdMNUJ2N3BrQkVHY1FURHd5dU5HU2R1Q1Bm?=
 =?utf-8?B?Mk44b0xreVRTTEdjWU5wZW9GT3E4VzlZTERaL0Y1SU0rajl1dVVvWmUvMXh5?=
 =?utf-8?B?cXl3elhoWmtxc0lBNjRiMzVLcmpYdjJGNHJ4Y1YzYnc2cnN5SlZmM3Rxd29K?=
 =?utf-8?B?WlZSYVFXUWhmbFNRQlllT1NRV1JmcDhhckNwYlI0WCt0VmtrWFNYTDlBZHNv?=
 =?utf-8?B?TEtCR1ZIRUlCWlhUekRXbmJpSUswa0JOMHZDTWQyUXBkcEh5V01QVmljcmdi?=
 =?utf-8?B?dFpBMk5EbG9ibFRpck0yZWZkbHJ3c3prSW14RGJ1TExiQ1lKeUw5M3dsZkFY?=
 =?utf-8?B?bXRxUjZoSDhFUzNEcEhyam9zRWZheFNrQ2t0bUgwcGNsK2NrY2dIU3pUOFU1?=
 =?utf-8?B?OGI0aktYK3g0UUhMWCtxQVpBSTZTc2dTM09ZNlRsU2tXUTd3Tk41RkkzWVdS?=
 =?utf-8?B?OUx1SlYyMDRoV1Q0bGcwdkphNHR5Y05CUmFPUGtZUkpHVzdJRkdkY1B6RTFE?=
 =?utf-8?B?NmRxZEJaZHVwbU91UldtTzFDSkVPZURwQW9KbXJ0ZlRFWFRTT2dDd0hYc3o0?=
 =?utf-8?B?VUI0cGdwMmEvN0FoTG85cmkxWnkzZlIrcnk0THhERkpRcWhkcCsrVjF6dXYr?=
 =?utf-8?B?ZXFZZTg3eWllclUyYmh3V2R4ZFVQNC95c3V4WjI0azA0eVA1ZUZMdFZ6bzNR?=
 =?utf-8?B?V0ExL0dvM1BnelJxam94c1pGY3dQWDN3T1ZQd0dTYjNDVStkYWhXY3dmaWti?=
 =?utf-8?B?RFFEdEZsYVFYQys1VkZOQ1YyaWM4N2RWWk5HQytvWml1Q0g0OWZVMU85MzlC?=
 =?utf-8?B?c3JaVjhaNXRlbUVEM29HZHorMHZjYjR2MTBsUjNhZnRkbEVUUTFMdDFwQmVa?=
 =?utf-8?B?aG8zZWdYcUVLNGowcit3bjNySE1WeFNtdSttMmo2QUptY1ExekhiWHRmSng4?=
 =?utf-8?B?bStKdEk4SVpIM2ZmeTNMdVNpZ0dLQWpMbmg1NE5EeFJHQ3pJQWJoNStOeGcy?=
 =?utf-8?B?aHJrek9xaXB0azdrR3lSMjNtSWV6MTNoaGpsNlk4Qk1odXFzY2VXc2lRdy95?=
 =?utf-8?B?N3BBeVh4S1E2RmM0UlNkbXhIK0RIR3lMTkpIOWV6a1FIcUswR1d4b0h0Ry8v?=
 =?utf-8?B?OGdaZHVhZ3NVWnNSUHZ2YWMwNFU3d3p6R2c2eEVXb3JWUjNTbEtUa1NRazFj?=
 =?utf-8?B?eHNvczYyRXZsZXFya1JnSFVKZFhVM252VkRJMjBpcmZvL0VsN2d3dlI0Y1Av?=
 =?utf-8?B?SlRad1NPZUhVUzRFa1F6NzNla0lScmxFK2IxWTFsbHk1Vk90ZU1sdmwwbEdu?=
 =?utf-8?B?cVE2S2g4bkpGOE9FbWtsV2xqQ2g2QmNVQmViQnV2YW82VEFXSklkRzdIWndI?=
 =?utf-8?B?RjdMM0xCb0NadWVTa1FFa0U2R2ZJSTBjamFtRUliTmlYYzdLUVZqanQ4Q0ls?=
 =?utf-8?B?R0ZoYkxOZFNrKzhQK3RPd1ByRktia0Q5ZzlBajdmL2ZaQmxUc0RxejJIajBu?=
 =?utf-8?B?NW5NVzRob2tsekFBbFVpb1IwSkhaNHcxK2l1QUFtSmNhc05KR0FBbG5EMjZx?=
 =?utf-8?B?RzdlMXdyYk1DQWZOQ1JXOU53NEtmQTk2MC8wVEZmNUIwcElVYlQ5cWZRVmts?=
 =?utf-8?B?VEwzMElQRGlBOXllOVVoZDJzU0FhZitTZjJrbE4rMHpPUVJ3d3B0eDdHTjVm?=
 =?utf-8?B?NHRIM04rNndaYzVQemhDLytJa1VMdzFRakN5VEdsUEtjZGxOZ2hwYm41emNk?=
 =?utf-8?B?akRtWmRONGphNVZmTWtKbUpSNFJpelRyUGdVWW95cEwxN2kwMFRTek42M1pS?=
 =?utf-8?Q?HtqAqUMIKLBXl/qUYe4MBKchN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42dd405-1b2c-4e59-dc7d-08dab1424c1a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 19:52:33.1007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYNWhR6cu7rwwVY8pr7/KkBdSQ4k1DFj0lSrTKf1q1ij+RGFOxwLrCzc5JX0/EbPXnNYpAnoHxxKeJiwWKGt4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_07,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180112
X-Proofpoint-ORIG-GUID: n5PxUbXZ7pEl-5pry0cQmWINZpLW-6mh
X-Proofpoint-GUID: n5PxUbXZ7pEl-5pry0cQmWINZpLW-6mh
Cc: eperezma@redhat.com, lulu@redhat.com
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



On 10/18/2022 4:12 AM, Eli Cohen wrote:
> Add debugfs subtree and expose flow table ID and TIR number. This
> information can be used by external tools to do extended
> troubleshooting.
>
> The information can be retrieved like so:
> $ cat /sys/kernel/debug/mlx5/mlx5_core.sf.1/vdpa-0/rx/table_id
> $ cat /sys/kernel/debug/mlx5/mlx5_core.sf.1/vdpa-0/rx/tirn
>
> Signed-off-by: Eli Cohen <elic@nvidia.com>
LGTM

Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com>
> ---
>   drivers/vdpa/mlx5/Makefile        |  2 +-
>   drivers/vdpa/mlx5/net/debug.c     | 66 +++++++++++++++++++++++++++++++
>   drivers/vdpa/mlx5/net/mlx5_vnet.c | 11 ++++++
>   drivers/vdpa/mlx5/net/mlx5_vnet.h |  9 +++++
>   4 files changed, 87 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/vdpa/mlx5/net/debug.c
>
> diff --git a/drivers/vdpa/mlx5/Makefile b/drivers/vdpa/mlx5/Makefile
> index f717978c83bf..e791394c33e3 100644
> --- a/drivers/vdpa/mlx5/Makefile
> +++ b/drivers/vdpa/mlx5/Makefile
> @@ -1,4 +1,4 @@
>   subdir-ccflags-y += -I$(srctree)/drivers/vdpa/mlx5/core
>   
>   obj-$(CONFIG_MLX5_VDPA_NET) += mlx5_vdpa.o
> -mlx5_vdpa-$(CONFIG_MLX5_VDPA_NET) += net/mlx5_vnet.o core/resources.o core/mr.o
> +mlx5_vdpa-$(CONFIG_MLX5_VDPA_NET) += net/mlx5_vnet.o core/resources.o core/mr.o net/debug.o
> diff --git a/drivers/vdpa/mlx5/net/debug.c b/drivers/vdpa/mlx5/net/debug.c
> new file mode 100644
> index 000000000000..95e4801df211
> --- /dev/null
> +++ b/drivers/vdpa/mlx5/net/debug.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
> +/* Copyright (c) 2022, NVIDIA CORPORATION & AFFILIATES. All rights reserved. */
> +
> +#include <linux/debugfs.h>
> +#include <linux/mlx5/fs.h>
> +#include "mlx5_vnet.h"
> +
> +static int tirn_show(struct seq_file *file, void *priv)
> +{
> +	struct mlx5_vdpa_net *ndev = file->private;
> +
> +	seq_printf(file, "0x%x\n", ndev->res.tirn);
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(tirn);
> +
> +void mlx5_vdpa_remove_tirn(struct mlx5_vdpa_net *ndev)
> +{
> +	if (ndev->debugfs)
> +		debugfs_remove(ndev->res.tirn_dent);
> +}
> +
> +void mlx5_vdpa_add_tirn(struct mlx5_vdpa_net *ndev)
> +{
> +	ndev->res.tirn_dent = debugfs_create_file("tirn", 0444, ndev->rx_dent,
> +						  ndev, &tirn_fops);
> +}
> +
> +static int rx_flow_table_show(struct seq_file *file, void *priv)
> +{
> +	struct mlx5_vdpa_net *ndev = file->private;
> +
> +	seq_printf(file, "0x%x\n", mlx5_flow_table_id(ndev->rxft));
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(rx_flow_table);
> +
> +void mlx5_vdpa_remove_rx_flow_table(struct mlx5_vdpa_net *ndev)
> +{
> +	if (ndev->debugfs)
> +		debugfs_remove(ndev->rx_table_dent);
> +}
> +
> +void mlx5_vdpa_add_rx_flow_table(struct mlx5_vdpa_net *ndev)
> +{
> +	ndev->rx_table_dent = debugfs_create_file("table_id", 0444, ndev->rx_dent,
> +						  ndev, &rx_flow_table_fops);
> +}
> +
> +void mlx5_vdpa_add_debugfs(struct mlx5_vdpa_net *ndev)
> +{
> +	struct mlx5_core_dev *mdev;
> +
> +	mdev = ndev->mvdev.mdev;
> +	ndev->debugfs = debugfs_create_dir(dev_name(&ndev->mvdev.vdev.dev),
> +					   mlx5_debugfs_get_dev_root(mdev));
> +	if (!IS_ERR(ndev->debugfs))
> +		ndev->rx_dent = debugfs_create_dir("rx", ndev->debugfs);
> +}
> +
> +void mlx5_vdpa_remove_debugfs(struct dentry *dbg)
> +{
> +	debugfs_remove_recursive(dbg);
> +}
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 64fdb940380f..ee50da33e25b 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -1388,11 +1388,16 @@ static int create_tir(struct mlx5_vdpa_net *ndev)
>   
>   	err = mlx5_vdpa_create_tir(&ndev->mvdev, in, &ndev->res.tirn);
>   	kfree(in);
> +	if (err)
> +		return err;
> +
> +	mlx5_vdpa_add_tirn(ndev);
>   	return err;
>   }
>   
>   static void destroy_tir(struct mlx5_vdpa_net *ndev)
>   {
> +	mlx5_vdpa_remove_tirn(ndev);
>   	mlx5_vdpa_destroy_tir(&ndev->mvdev, ndev->res.tirn);
>   }
>   
> @@ -1576,6 +1581,7 @@ static int setup_steering(struct mlx5_vdpa_net *ndev)
>   		mlx5_vdpa_warn(&ndev->mvdev, "failed to create flow table\n");
>   		return PTR_ERR(ndev->rxft);
>   	}
> +	mlx5_vdpa_add_rx_flow_table(ndev);
>   
>   	err = mac_vlan_add(ndev, ndev->config.mac, 0, false);
>   	if (err)
> @@ -1584,6 +1590,7 @@ static int setup_steering(struct mlx5_vdpa_net *ndev)
>   	return 0;
>   
>   err_add:
> +	mlx5_vdpa_remove_rx_flow_table(ndev);
>   	mlx5_destroy_flow_table(ndev->rxft);
>   	return err;
>   }
> @@ -1591,6 +1598,7 @@ static int setup_steering(struct mlx5_vdpa_net *ndev)
>   static void teardown_steering(struct mlx5_vdpa_net *ndev)
>   {
>   	clear_mac_vlan_table(ndev);
> +	mlx5_vdpa_remove_rx_flow_table(ndev);
>   	mlx5_destroy_flow_table(ndev->rxft);
>   }
>   
> @@ -3167,6 +3175,7 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
>   	if (err)
>   		goto err_reg;
>   
> +	mlx5_vdpa_add_debugfs(ndev);
>   	mgtdev->ndev = ndev;
>   	return 0;
>   
> @@ -3193,6 +3202,8 @@ static void mlx5_vdpa_dev_del(struct vdpa_mgmt_dev *v_mdev, struct vdpa_device *
>   	struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
>   	struct workqueue_struct *wq;
>   
> +	mlx5_vdpa_remove_debugfs(ndev->debugfs);
> +	ndev->debugfs = NULL;
>   	if (ndev->nb_registered) {
>   		mlx5_notifier_unregister(mvdev->mdev, &ndev->nb);
>   		ndev->nb_registered = false;
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.h b/drivers/vdpa/mlx5/net/mlx5_vnet.h
> index 6691c879a6ca..f2cef3925e5b 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.h
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.h
> @@ -16,6 +16,7 @@ struct mlx5_vdpa_net_resources {
>   	u32 tirn;
>   	u32 rqtn;
>   	bool valid;
> +	struct dentry *tirn_dent;
>   };
>   
>   #define MLX5V_MACVLAN_SIZE 256
> @@ -43,6 +44,7 @@ struct mlx5_vdpa_net {
>   	struct vdpa_callback config_cb;
>   	struct mlx5_vdpa_wq_ent cvq_ent;
>   	struct hlist_head macvlan_hash[MLX5V_MACVLAN_SIZE];
> +	struct dentry *debugfs;
>   };
>   
>   struct macvlan_node {
> @@ -52,4 +54,11 @@ struct macvlan_node {
>   	u64 macvlan;
>   };
>   
> +void mlx5_vdpa_add_debugfs(struct mlx5_vdpa_net *ndev);
> +void mlx5_vdpa_remove_debugfs(struct dentry *dbg);
> +void mlx5_vdpa_add_rx_flow_table(struct mlx5_vdpa_net *ndev);
> +void mlx5_vdpa_remove_rx_flow_table(struct mlx5_vdpa_net *ndev);
> +void mlx5_vdpa_add_tirn(struct mlx5_vdpa_net *ndev);
> +void mlx5_vdpa_remove_tirn(struct mlx5_vdpa_net *ndev);
> +
>   #endif /* __MLX5_VNET_H__ */

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
