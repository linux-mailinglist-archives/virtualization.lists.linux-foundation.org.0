Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD45E82D6
	for <lists.virtualization@lfdr.de>; Fri, 23 Sep 2022 22:01:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB2BF60E7E;
	Fri, 23 Sep 2022 20:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB2BF60E7E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=odG58R5D;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qDYBVZ4L
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmthQeLC6zMx; Fri, 23 Sep 2022 20:01:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9B5D460E86;
	Fri, 23 Sep 2022 20:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B5D460E86
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D37F6C0077;
	Fri, 23 Sep 2022 20:01:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEE5DC0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Sep 2022 20:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B214640A89
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Sep 2022 20:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B214640A89
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=odG58R5D; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=qDYBVZ4L
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F30xSU-vPERi
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Sep 2022 20:01:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D674010D
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8D674010D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Sep 2022 20:01:44 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NJEjlP002043;
 Fri, 23 Sep 2022 20:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=93mm5pdcFleItpENRl0S/16B8rcgJSljwSXps8fYA1E=;
 b=odG58R5DrYpAik0RUICb4wZhlenNP5/jd5MBXBbHi6SFNd/M0dBkS9OGpaWMs/Co1+Kx
 IL+AaHFauGMSB+NGqJEG5JLq3Can2GbC/52WLM+FZraeQeOC7H9lBDzgKBozCN1LVgdq
 zRmmIUAAHZYhimupatwH9vWleGovihBm7gkd2TYzwKSK2sF412Y5cX/+qXSCSocF+quV
 7/vdJGw4meTW6SRKDkvSERJcxX4g8HuFrjJc9cpu8rkWnTWawb3SB9jMvnRCeiVuS5y6
 /nbICKmu3K086aYhBCx7Xxopcb62IaeyRcJ1UAwLi801QVYWntd2CdMsbOTIXQPuwqWS 1A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn6f0s35g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Sep 2022 20:01:39 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28NJvVvQ010196; Fri, 23 Sep 2022 20:01:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3ccpakf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Sep 2022 20:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADfpJI5OdeqVNCz+WBbpRlQxJPTr3rcadib2NaSVZUg7guHW6eS7RXWONgYHBaNZeVlLwpuG+WksiTBzdVY+bOc8cQvOSNOJiR5EmQHMf5AMOfkjSgYAW1DX6KdkVdfAhIx/y5ngphcJTc7k7T2ZUm/5vlLz+7v0lx7TNF9XPI0V8iq+jrLACHyLIaB8Tcgd51OG4XqwipjmOZkfz7rc7OHqhlKqpS9yBwdphjxwaMAy9B9Pgz/fJMdNYWaaVvMvLkHKQdF14rQd986PNu0iev0ufHJyTbgPIr8OQDgNlJU8UXzAMeEWCpYQQKsG6gife9n21IkxreYDU8AP3gRx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93mm5pdcFleItpENRl0S/16B8rcgJSljwSXps8fYA1E=;
 b=QCl8dZismxoaRvPUVqaZTZvthsW8k7PY1PWkzKvJS0LCBgbTZubOZiyZW2E+UgOIp1IBd0X3SH9R9z01OnqvcZjJutKbMVyEtkyc4jHcAFRTMWpPQNnpHWQvj04BSrjK/X5eIHQ5nXJg0/qsQKa98QIcp0MxnuyxD+FJCX4Yx7Sd1ySHWbKJFoxLcGdO5tPHKcQAMie+UOCp/MrmMX/u6O8j0lZjCnia1lZ7gxAmVYRjSz9/CZZNW2gBG/izC+GBQT97HDRX3k4dob9glign5zt+F9V6ln2GXEX11SbdcUL9tgrEn/kePkaVbf/OUpnSNKMR+dLXna53eaIujoZnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93mm5pdcFleItpENRl0S/16B8rcgJSljwSXps8fYA1E=;
 b=qDYBVZ4LKcdIX4DytTmpjVGdvZ1Kc7WHuUuncKMyyb4PJYpH+3EGewM7dfMsFqeAH/mUQYxmXVgWSKEoEfgZYASKaAUXcfPclwf8UVrLvfiWKwoALjt0FgBlVmQxLLk34ui8KgMbklM+hch24FnKTuw4x8Rk0qJlfGo+P+XGYQM=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by BN0PR10MB5063.namprd10.prod.outlook.com (2603:10b6:408:126::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 20:01:36 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::8096:7cf2:829f:fa13]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::8096:7cf2:829f:fa13%6]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 20:01:36 +0000
Message-ID: <a1e98754-114e-b401-e927-5f2b71c3c641@oracle.com>
Date: Fri, 23 Sep 2022 13:01:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH V2 2/3] vdpa_sim_net: support feature provisioning
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20220922024305.1718-1-jasowang@redhat.com>
 <20220922024305.1718-3-jasowang@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220922024305.1718-3-jasowang@redhat.com>
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|BN0PR10MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bea809f-0d0f-4378-4c62-08da9d9e6b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8XzEkBy5K8M4lWzawcLowesHlptGG+e8BfWtZzKjWtuEqlFygOsNMRS7khpplHQ9xntRyX3quijc/ZnkCFeH7ZmZG0YKO5VGhKevNEGWU4MDHfEaZ32E+IMeZnk5d4taBHAaO3x/CKdwqyG/v1H9VTtNnpMf16hjUShud1gIMFTtu5303BvQj4Dy0tW7zE0kgeUFUiu/GwIBHKt9AI3GFjxIcao0caLb7BQ3N5D6P2Cr97hF1M6Jdmlwze8UDe25ZfysLa2DD6H9Hte3LB0vPzOX8hC0njDxTvkXSG5ukFzgImSVrpFTx2hi35+PmfWn3fxso9eOtnrVjxBJYFa5vUOoeFXUVykLYp7aemZWl8WB2CxYTa1MFnFeXVe4CiqzXsYg1uMLtYftaFLkJAh4F3M6yt90rp/GWzjXowKLHUPCegpXBqWjI4b/ckhXRa+YT7ul5TeNcs/xRy896jbrl41+ehOzAEtF5d563p1Uhfvq9d5RHPub1Axpk0AM8nRTKpxYiuqgs+gEyp6apS37mrMayXaBJasmPJa1UclY948Og0QxI/kTrjg1R11gZ/fvtmf19jcRHmvWA3o92egJJ5rCW5gxh/1IsJhX2nNT1pSYY3r4rgnYX8Ul+ReebHPFOZJTbSUXKywIA2+OomrHV4s/KsWF52xxFGHOZ7+tjanBMPmFzETZB0p5bK1g1Ptw0XfP5P9GpmmF64qnAwoqBrsLFmHjMjmJgYJEAk3JYrEuWI4UyNSet8BepgAQjb6noRSXgVga6GIanSL6n8OrGnX5DQGmETxCpc8VrTaEXw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(8676002)(8936002)(4326008)(316002)(86362001)(66556008)(66476007)(41300700001)(66946007)(2616005)(7416002)(38100700002)(186003)(2906002)(6486002)(83380400001)(478600001)(31696002)(5660300002)(53546011)(36756003)(26005)(6506007)(36916002)(6666004)(31686004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFhKWGxNdkc1MDRNT2s0TFJIT285VDlsUUtsVXNyRmxYaGpTWnF6SmdXWGdk?=
 =?utf-8?B?TnZFUzlxTTVRUC92TEZjcGZUWS9oamw4UUorRjRYSitkWU8wSXhRN3c3VllX?=
 =?utf-8?B?L3lrWllXemU0MkNsb2ZkWkNaRzgzUzNkcHhkWlNFYmJZdFhWbmUxU2VFUGdW?=
 =?utf-8?B?V0V1QWc0RXpMMnp3cVpLci9jYWdZT2svNVdYUlMyTDUxcWRWWDJoOWd0UDNI?=
 =?utf-8?B?ODJSU0RzQnZFLzdEeVkyTkc0QnZSTndxM2NWRHVpVFh2VU1BYVNrS3hDRHE4?=
 =?utf-8?B?QlhuZEVUWlFDNmZLOWVDZ3V1K0NNUGIwU0EzZS9ZOWRhSGI0dCtmMFFzNlBV?=
 =?utf-8?B?RzFENWhWSVQ5WlRwVVdMTkQvNG5FcmpTdHpjODNsWWRzYmY4UTBRcVEveGRm?=
 =?utf-8?B?c1lUUDd6blRvUFhLNlhEYVFIcVJlTEhrWXhpcHBZQVFDRlQrcUU2OU50eWxo?=
 =?utf-8?B?N2x1MDRIVmFmek9OaVRPRlo1aldSek9wbDVnQUlUZEhhamJ4dWU1NGE0aGtV?=
 =?utf-8?B?MUZMU2QvQWNkeVBPa1lWSlh1WVlWVHVyaE1SSEJTTW54L1hGZEVIRUNON2lF?=
 =?utf-8?B?bVVBSnRlSFZvekV6aHFyRVNUWG5LbmVmWjdiazdmN2loN3RJZ1JHMnFKS3Ir?=
 =?utf-8?B?dks1cWV2UlEvQmRIQkpZeTk2cm1SOHNIZlJhNjJmRTFXY3Bsc0plZ09yRS8y?=
 =?utf-8?B?VERmdG5oaFdZVHptcExINWhiZGRSbkVKQzBQdmNJMGpXREp1RkJub21CVUVs?=
 =?utf-8?B?djREMEwwZkllMXpZMXVSM2o2WGEzWFp5OHJYTjllQjRBU2w4SE5waDVSaVJk?=
 =?utf-8?B?MWZBU1krR1lLN0ZGSzFtcm54WkVaY04rYXlVT2hoSHJDT1ROZVEremNtVWRT?=
 =?utf-8?B?ZGdVSFliaHRpd1NaOTluckZVSjFuRlhWVXpNQnZZd1Fub0tGaTM5Uk42WlZT?=
 =?utf-8?B?T3VvbjhJWDBNdGV5dklxTUpwdDZFT3h5azEyMnZZdDBYeDN0NjVHaFYrclZ5?=
 =?utf-8?B?MGY3bXFhV25hTTBtS204K0JLYWJhZjRVMG1GZ3d5R1RMMEdNRE5EeTk5eGlq?=
 =?utf-8?B?QWNXM3EzK2lGaVNaSEtPRlZNY2ZYb0RlR0t4VCtGc0lHWGJrbmY5KzBJYkkv?=
 =?utf-8?B?UWRyZUdBdkczZm4wNFVOVlREMkZtVTl2T3ZhaXJiWkNnY21POHl3Z01aN1ZP?=
 =?utf-8?B?cHRrckwvTjNKOStxRlZGMmx5R3VDa2YzMzc4bS95L1ZueXliL2pSTUZhamp6?=
 =?utf-8?B?Y2g4M3FwRXEvWjQ1c0IxMi8vakpKdkZTREw2a2tENitod1BYVmR1bnV1aXRE?=
 =?utf-8?B?TGk2NXo2b3QzclFnU1JhVjVSY0hXcTN1bkdpSC9pUjVDRjdjbnkybFVFR0ha?=
 =?utf-8?B?Zy9ENUs4UllDWUZNZlFxckNmeXNxNWh4ZEhZdHdaSjRoZTd1S2VQaCs5UGg4?=
 =?utf-8?B?dUNSd0pIU1NWdTIyZlI2T3JuNFU5bEplQ1F6dHFmWldIQTMzRHdmZlVva0Zz?=
 =?utf-8?B?ekRGdW5vSDRldU55TkFDRjhkc3VWY1BMSVgzRmZFcmR0dHN3aHAzVWRVREZv?=
 =?utf-8?B?Wkhjb1dPb1RHcnJ2eklyREtDMG44cmRiZWY3SmJKUEV4WVVISWhFRW9OQzk2?=
 =?utf-8?B?MXdQdlNRYUFzVkEzSmFwOFI0MGptWncrVlEzT0Jzc3Z3UytER0dza1h0c1FN?=
 =?utf-8?B?cHJuZ1VVNkpLeGRqc2E4TERvUVBpUTlNQWMxdEZOeWRnZDVST3JlOThsM1JU?=
 =?utf-8?B?dUdCS2dmOU9YQ3BpVEdtd2NRWktlanNFMFZtL3ExUWF1eHpNVGh5dnBmQ1lK?=
 =?utf-8?B?MThxN2dSbFlTYTRVT1h5S1VxMDNPcXFmTGJVczAyTkcvcTRyZVNIMkF0bVFW?=
 =?utf-8?B?K0tKYjNiVEtockVjTXVDc2xLaDByaElMeVBLVjl6N2JLYldzazNRS3ViazdG?=
 =?utf-8?B?bGhZZ1BGaWJ4OHRmbXhGaS9UM3V1SGl0MURPZ2FJaXZzOHRYcjE5bVRjMXp6?=
 =?utf-8?B?Wjd1VGhmQ2ZnSnluK1lmaHZZT1V1TWo0d0tsSjNhcEJiRW1YRjYxMXdhM3kr?=
 =?utf-8?B?RDBoYnZ0b0FGcmlJVGpmOWE5WnFLMmE1dTFYYXQ5S1dnSTFqMkhjSUhWTTZu?=
 =?utf-8?Q?N4TA/rPQpPHvwGK6A2R1ENhgm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bea809f-0d0f-4378-4c62-08da9d9e6b6b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 20:01:36.0652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrwtKA+P4P0UAU8P2BFqj4quPFcOJnm6PNgDU9SWf16Z9Bsjvzt6NXZFuduJIBZ2pJjQfubpXSJ8CLRtf6X24Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5063
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_08,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209230130
X-Proofpoint-GUID: a8_wFlepIYMNlxNq4_56L-Fqpb7IrwdD
X-Proofpoint-ORIG-GUID: a8_wFlepIYMNlxNq4_56L-Fqpb7IrwdD
Cc: lulu@redhat.com, xieyongji@bytedance.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, wuzongyong@linux.alibaba.com, elic@nvidia.com,
 lingshan.zhu@intel.com
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



On 9/21/2022 7:43 PM, Jason Wang wrote:
> This patch implements features provisioning for vdpa_sim_net.
>
> 1) validating the provisioned features to be a subset of the parent
>     features.
> 2) clearing the features that is not wanted by the userspace
>
> For example:
>
> # vdpa mgmtdev show
> vdpasim_net:
>    supported_classes net
>    max_supported_vqs 3
>    dev_features MTU MAC CTRL_VQ CTRL_MAC_ADDR ANY_LAYOUT VERSION_1 ACCESS_PLATFORM
Sighs, not to blame any one and it's perhaps too late, but this 
"dev_features" attr in "mgmtdev show" command output should have been 
called "supported_features" in the first place.

>
> 1) provision vDPA device with all features that are supported by the
>     net simulator
>
> # vdpa dev add name dev1 mgmtdev vdpasim_net
> # vdpa dev config show
> dev1: mac 00:00:00:00:00:00 link up link_announce false mtu 1500
>    negotiated_features MTU MAC CTRL_VQ CTRL_MAC_ADDR VERSION_1 ACCESS_PLATFORM
Maybe not in this patch, but for completeness for the whole series, 
could we also add device_features to the output?

When simply look at the "vdpa dev config show" output, I cannot really 
tell the actual device_features that was used in vdpa creation. For e.g. 
there is a missing feature ANY_LAYOUT from negotiated_features compared 
with supported_features in mgmtdev, but the orchestration software 
couldn't tell if the vdpa device on destination host should be created 
with or without the ANY_LAYOUT feature.

Thanks,
-Siwei


>
> 2) provision vDPA device with a subset of the features
>
> # vdpa dev add name dev1 mgmtdev vdpasim_net device_features 0x300020000
> # vdpa dev config show
> dev1: mac 00:00:00:00:00:00 link up link_announce false mtu 1500
>    negotiated_features CTRL_VQ VERSION_1 ACCESS_PLATFORM
>
> Reviewed-by: Eli Cohen <elic@nvidia.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   drivers/vdpa/vdpa_sim/vdpa_sim_net.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> index 886449e88502..a9ba02be378b 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> @@ -254,6 +254,14 @@ static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
>   	dev_attr.work_fn = vdpasim_net_work;
>   	dev_attr.buffer_size = PAGE_SIZE;
>   
> +	if (config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) {
> +		if (config->device_features &
> +		    ~dev_attr.supported_features)
> +			return -EINVAL;
> +		dev_attr.supported_features &=
> +			 config->device_features;
> +	}
> +
>   	simdev = vdpasim_create(&dev_attr);
>   	if (IS_ERR(simdev))
>   		return PTR_ERR(simdev);
> @@ -294,7 +302,8 @@ static struct vdpa_mgmt_dev mgmt_dev = {
>   	.id_table = id_table,
>   	.ops = &vdpasim_net_mgmtdev_ops,
>   	.config_attr_mask = (1 << VDPA_ATTR_DEV_NET_CFG_MACADDR |
> -			     1 << VDPA_ATTR_DEV_NET_CFG_MTU),
> +			     1 << VDPA_ATTR_DEV_NET_CFG_MTU |
> +		             1 << VDPA_ATTR_DEV_FEATURES),
>   	.max_supported_vqs = VDPASIM_NET_VQ_NUM,
>   	.supported_features = VDPASIM_NET_FEATURES,
>   };

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
