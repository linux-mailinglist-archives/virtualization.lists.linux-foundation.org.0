Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60341BC03
	for <lists.virtualization@lfdr.de>; Wed, 29 Sep 2021 03:00:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 289ED60BBD;
	Wed, 29 Sep 2021 01:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVCr7BDYxuWT; Wed, 29 Sep 2021 01:00:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 19A1060BB6;
	Wed, 29 Sep 2021 01:00:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A955CC000D;
	Wed, 29 Sep 2021 01:00:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5491EC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 01:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 302C880D61
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 01:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="hVXvaBtC";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="LFX7LrDE"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uOmoCiNJ_55
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 01:00:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 420B580D5E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 01:00:13 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T0uGFR027809; 
 Wed, 29 Sep 2021 00:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=V/TLEl3TSdMAyJh6JfXUElRd52hZpPV6ykH3Gpm4PSs=;
 b=hVXvaBtCgcikPRqZata01px0F8UK+neel2ByL2FAl7uMtDCLvSYQ+cFQF3RQKqdD0ZZX
 7ijg5nbacJrgLM7nROys9NTrK/Q5FHnZdtSiWN1xQzLE940J66uuoOG4RRK7M6U4tJdo
 I2u6jq8gh2k5e0sT0C5m46+Rk4yx05TsGhW4sTmv+5ej2BF8EO7H/gIMd77jnx4P1LAu
 zqCB42TxiM9HZnJ6K1cPmo13F1eMF6juj8pAmeNfu5X+uEFZnNl4CJ0kSLX0cZPevmVe
 Zc7a6OmAxv2Fi3mODU1YyTPBBTh67/uoio83Ny5ie340gRnQ5Ir7kmx+OzBZkspK1eNy TQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bbj90t6c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 00:59:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18T0u7oZ080542;
 Wed, 29 Sep 2021 00:59:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 3bc3cde2ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 00:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRYPEpugJ9/kn192HWLjN0kgdKt0uh/28VBdW95/iRGcgCcBx4a1qaRZ+p7FUz6RqxbIzFstU8F5jAC1izzXmjkvm/JQkEIhvq+l8h/L3mqMfDtSW0FX2tRcRPWSaz8qH3O8TCm5MQguu3aVcKwjBWN/NYjkeHHTVRZZgYwWmzPj84fRI8IMvUUPCh7mnRdLPTaR02LZ2FL/TKFAY4Q3bO7mT1BM21kvf7EYdl1v3Jtsi/CIZEShKzpvfr6JjpOB+k+VrMfkzSB5qGWszq8/9Ln359tTzKyPCJqimJ+LeTKO4c20eWbesjM6klB68aDnNdpLXrCdqd/TpbEruUHydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=V/TLEl3TSdMAyJh6JfXUElRd52hZpPV6ykH3Gpm4PSs=;
 b=d8L81g3gafUvnJP8AkTeD0CHfm0Ftpk75HzwWLY2F1l0VhEWwljn55V7j0zKf3BPFMFWT++NVA3SyR6slWElV8/Gd5rL14ZehChFtAIIuo7avqY7Eq0iHNn+QhNO3Hd1R9akHL6H7fE83muDm3AUAdpErFETG9IBPAahDCvuYIgCEoC5vUy+VlWVRS9D9KW6T5yGgZ0MNNscsW2r42hT1z28QKIHPyqT55ucbsoXDiUc6mXYl4O8gWZAsoZvhzLlAtMEOxwoCLGtTjHHf2cU6/zoqQaNq6S+Yz9p2BVs/phq0ktTsNvcnHEDTUp7BEuI5Ixeh/6ZwtaQEB/o1iy/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/TLEl3TSdMAyJh6JfXUElRd52hZpPV6ykH3Gpm4PSs=;
 b=LFX7LrDEUGDw60gGrAfcpceYQzyKT2dymiTJdlpyzx38aasi6CKRGH/hoH71/S7shvzA6UTY1KYmmN2LoBRjaWmV4xPBq39qlnQgtoBv+Sg3UjLcIfmhNewP68tGx07i540Ad+NYzq/YhONIdQgVI+LCqRUr9tvwU4QD/j81Ctg=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=oracle.com;
Received: from CH0PR10MB5020.namprd10.prod.outlook.com (2603:10b6:610:c0::22)
 by CH0PR10MB5369.namprd10.prod.outlook.com (2603:10b6:610:dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 00:59:44 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::f44b:db92:7a0:782b]) by CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::f44b:db92:7a0:782b%7]) with mapi id 15.20.4544.021; Wed, 29 Sep 2021
 00:59:44 +0000
Subject: Re: [PATCH v1 2/8] x86/xen: simplify xen_oldmem_pfn_is_ram()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20210928182258.12451-1-david@redhat.com>
 <20210928182258.12451-3-david@redhat.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <4ab2f8c2-c3d5-30b3-a670-a8b38e218b6e@oracle.com>
Date: Tue, 28 Sep 2021 20:59:36 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <20210928182258.12451-3-david@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::27) To CH0PR10MB5020.namprd10.prod.outlook.com
 (2603:10b6:610:c0::22)
MIME-Version: 1.0
Received: from [10.74.101.163] (160.34.89.163) by
 SJ0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:a03:3a1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 00:59:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2ecdb2c-8bf6-4a70-f1aa-08d982e46cc3
X-MS-TrafficTypeDiagnostic: CH0PR10MB5369:
X-Microsoft-Antispam-PRVS: <CH0PR10MB53693BAD65805A7C130FCE4D8AA99@CH0PR10MB5369.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /GLtQduKEu0nuKS491KxNqoTHQpCM5FfFHZrVUnc1wlIbJWQBnbvxLZPOgmiM1aKQqV2tYfWDD4K8EkovZ3OJe1KV+mp6DciQ/j5YMGYScE/JXE5wgnEzJuF1bTOwQRdNpdY1pBg0I49F1UNXERxLa52fdOjZlp5tdHRacWQt24TUuGLJuuCjuOGCA4lGPpzpCA+P/tzTyEFDV50rH6iWAtXI51PXzA+jz6AUTcCugpVbuSrEOFWibhPONYZzXahetG0yCyHN1f5I7Im12udigrkz3MIO+Y9hHK+6pDdAmEm7ppVQyno/DVQxmk7MU0Nfa6WINFIsrktR3N2tlEIb9vp5JCK0xxo0zMo94aH6TDc1IJicyOEYvrhYpeCBk5I2nxvklGd71/r/jaN2dJwYkfQYadGTsG+PGngOcUvVKhHHV3PzgRAbZFa4qK/6eHSm/aTyaxhup3T36GHgfGUcBmO2RA7ZnS62NQUpjuEhhG+XmFY89biT2eaIUdte7Bf/YdaubCMeiHPWwVb1j5Q/rm25ICfa+wsSbIPVhiKvZ+KJ2oYrdogE3fsp/uf7PLFJcGa0n/hNFzCJ4BMWNXfOo1tOSj37EIE/e9FzWG87CZ7M0fyF0M6qvrwLiXCy924XGfk3ZqpXvcoYQkdR2npLk1ChxSeGIXkh7Pkv35201JcH6PX6hapKUDpu1pk/W/OHdIIiTBnxUORsJQJ1oZadC4IjXDVNs39eqooRNXsYrPfy8vdD6HcUZhqqzI390pr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5020.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(31686004)(86362001)(8936002)(44832011)(5660300002)(7416002)(38100700002)(31696002)(83380400001)(186003)(6486002)(508600001)(2616005)(36756003)(956004)(4326008)(2906002)(66556008)(66476007)(316002)(16576012)(66946007)(4744005)(6666004)(54906003)(26005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M29aVzR2Q0txNnpqNmpzRXJxWm1xaTY0SnhOa3lZMDJzN0tKT2JJU3hxZzMy?=
 =?utf-8?B?dTFFZlFEMDRwaHkvWUU1amZNT2dvOHNVZEQ1SFprTm80c20yaHZ3NWFFMDB1?=
 =?utf-8?B?RDBxWUNNenBuVWpvOUg1WDM3L3p5Qkd3dDlWWnlScnl6UVNHME05T3RycUN0?=
 =?utf-8?B?bUc4ekdmN3lyTDh5S3FiZk1JSlpzQndSbmdMS1ltWTlacWs1dzlHd0ZXeFJr?=
 =?utf-8?B?SmEwWjdIVHdUd3dDU0NNeThUSVVpL2x4LzMxVjVvU2xMNDJ2ZkdVZEFFQUlN?=
 =?utf-8?B?SDBscWMvQ08rOURweWFDUllxWnRQUlg5UnFHYTZMM0ZabU1tQlZwY0ZXdjkv?=
 =?utf-8?B?a1JLcTB4SDVib010QlZWMndpRU93cXlFYXhsTU1MNHdielZKRkU5Mmp5VXBn?=
 =?utf-8?B?RW5uSVhORWZkMnNTaUlMMk5aUmZWQzNZUGJ1ZTd3VnZ3cmdVeEVwazNYbzFl?=
 =?utf-8?B?bVRVK2ZBa2pYd0tySjlQVGFWcTVUYTU1elFnMjZsNk05d3NoT1VwWmRZbGlv?=
 =?utf-8?B?V3ZiSnp5WjZzeU1pamVPUW1sRTJHOHlmSnFpNktmenNsRG5UNnNUblgwOVdk?=
 =?utf-8?B?T2NyMUlacEtTQzd5RzY3cDJUMGRiQndtVG5zMmJsOXQ4OVgrTzExTkVwbHZh?=
 =?utf-8?B?ZmdxMkovZG9FOEs5eGJhZnU0dk9ucFByVW9aOXBpaHAyaUN4eFQvNFFDdG9T?=
 =?utf-8?B?VDZObXorVUthV1lLMHZBTUpGaDdNNDNhSWYwQ2oyOVZNMitidEJQYUFrdTlP?=
 =?utf-8?B?eEd6OGRVTDNFeThsSGRLNFpNSHUxZWlBanpMN05yVWdMKzM5bmVBVFpTWm9F?=
 =?utf-8?B?bEV2UkZzb0syU25xdzlQeWVremJSVW1tRDloOWRycE1ESlVxNTQrd015enJu?=
 =?utf-8?B?ODRCVjN0aFZWOTZ4NVhFRGdJMlFhVm9GQ2c4c1ZtdEJ2V0NJNEpPVTdFWXJ5?=
 =?utf-8?B?cHJVYXJHa1Y0ZFplSkxMbkJ1bGc3QnVHRzRYTE84TlhNSEdDdStWV0JJTnp3?=
 =?utf-8?B?M2xBMmxyS0Ewd2d6Z3drMldHMW91WStlY01RV0I5bnhvSVQzQU5nWjJYNFNB?=
 =?utf-8?B?UnBzYWlPVC9SZFFjTG9KUHNPVDlDeGlXQ1dPTGtrSHhJKy9YUTN4Y21sQTVh?=
 =?utf-8?B?d1BNKzV2b0xGS1lGWnM5bmxQNDZpRm9ZbTFMZ1A4WG12K1VTNnVNYW0wVjR4?=
 =?utf-8?B?THNBRWNnQ21PcVJXclM1ckVMM1VIVlR4UjJOT1JNdFduR2JnYWhMRnBhelJB?=
 =?utf-8?B?d3pqbmlocFF4RTJwY0E4YWxxdERRSytSWXlYdGhYOURoT21wRHdYOXBWc1Z1?=
 =?utf-8?B?WDk1ZXlBaEozYmFtUHB2RUgySTBSZTFxditoMncvbzAwd2NFUENSWUMrV241?=
 =?utf-8?B?cmFNWTU4MlgzQjdSK3ZsWUhEZUxoSW9SOSttaFYyNmNxSzVLYjFqdXNPQ3Qy?=
 =?utf-8?B?VE40VnVyVUM2SDBTb1pEM3pPV1VPamJRR09Cdml4NkRsODRHU0ROUnpHbVR0?=
 =?utf-8?B?TFR6SUxGREdMUlg0M2docGtocDdGZ09GS21aamxnQ3Y2U3BFOEY3YTRxZmJE?=
 =?utf-8?B?U296Q3VRSWFCVXBrcjRONm51ajFEbnNHQXhQb2FKV2Y1WWRiajc3REl2ZlVB?=
 =?utf-8?B?cXNwRUErTkZLb2MwZmNIa1JMRFRMR2FMK1VieUc1N25BM3p4emVtTXVteE5K?=
 =?utf-8?B?cWwwQmlmWmV4VW9salA2dHliQzJvQVlXT1ZUWm9tWTRuSVJETVJnV2xIaFpj?=
 =?utf-8?Q?qM/9ursR9C93lhAgnOXohypRvjed+/zsY142v8g?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ecdb2c-8bf6-4a70-f1aa-08d982e46cc3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5020.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 00:59:44.0970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPnPpC4o1PIuxrZIeWMkZEYrwo6PjuOGte00wgc+DM0DOjWAOj+8yJDzhAK6MOQHJlhUXNznmcuIQ9C927e/5D2C9Jv9a+BBOgJ3yhubdSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5369
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10121
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109290002
X-Proofpoint-GUID: pElT9iCsyLFVrZ-JexoHkUs6hWbbmLap
X-Proofpoint-ORIG-GUID: pElT9iCsyLFVrZ-JexoHkUs6hWbbmLap
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 x86@kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Baoquan He <bhe@redhat.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDkvMjgvMjEgMjoyMiBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gTGV0J3Mgc2lt
cGxpZnkgcmV0dXJuIGhhbmRsaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJh
bmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGFyY2gveDg2L3hlbi9tbXVfaHZtLmMgfCAx
MSArKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9tbXVfaHZtLmMgYi9hcmNoL3g4
Ni94ZW4vbW11X2h2bS5jCj4gaW5kZXggYjI0MmQxZjRiNDI2Li5lYjYxNjIyZGY3NWIgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC94ODYveGVuL21tdV9odm0uYwo+ICsrKyBiL2FyY2gveDg2L3hlbi9tbXVf
aHZtLmMKPiBAQCAtMjEsMjMgKzIxLDE2IEBAIHN0YXRpYyBpbnQgeGVuX29sZG1lbV9wZm5faXNf
cmFtKHVuc2lnbmVkIGxvbmcgcGZuKQo+ICAJCS5kb21pZCA9IERPTUlEX1NFTEYsCj4gIAkJLnBm
biA9IHBmbiwKPiAgCX07Cj4gLQlpbnQgcmFtOwo+ICAKPiAgCWlmIChIWVBFUlZJU09SX2h2bV9v
cChIVk1PUF9nZXRfbWVtX3R5cGUsICZhKSkKPiAgCQlyZXR1cm4gLUVOWElPOwo+ICAKPiAgCXN3
aXRjaCAoYS5tZW1fdHlwZSkgewo+ICAJY2FzZSBIVk1NRU1fbW1pb19kbToKPiAtCQlyYW0gPSAw
Owo+IC0JCWJyZWFrOwo+IC0JY2FzZSBIVk1NRU1fcmFtX3J3Ogo+IC0JY2FzZSBIVk1NRU1fcmFt
X3JvOgo+ICsJCXJldHVybiAwOwo+ICAJZGVmYXVsdDoKPiAtCQlyYW0gPSAxOwo+IC0JCWJyZWFr
Owo+ICsJCXJldHVybiAxOwo+ICAJfQo+IC0KPiAtCXJldHVybiByYW07Cj4gIH0KPiAgI2VuZGlm
Cj4gIAoKCkhvdyBhYm91dAoKwqDCoMKgIHJldHVybiBhLm1lbV90eXBlICE9IEhWTU1FTV9tbWlv
X2RtOwoKClJlc3VsdCBzaG91bGQgYmUgcHJvbW90ZWQgdG8gaW50IGFuZCB0aGlzIGhhcyBhZGRl
ZCBiZW5lZml0IG9mIG5vdCByZXF1aXJpbmcgY2hhbmdlcyBpbiBwYXRjaCA0LgoKCi1ib3JpcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
