Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5608F7D7D1A
	for <lists.virtualization@lfdr.de>; Thu, 26 Oct 2023 08:55:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30DF61102;
	Thu, 26 Oct 2023 06:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B30DF61102
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=u4agUy7O;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rv1Ocb+j
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6wb5CwGBFD4; Thu, 26 Oct 2023 06:55:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 192FB61106;
	Thu, 26 Oct 2023 06:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 192FB61106
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AE21C008C;
	Thu, 26 Oct 2023 06:55:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1ACB7C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 06:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40158231F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 06:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40158231F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=u4agUy7O; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=rv1Ocb+j
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESObkgD5QT21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 06:55:36 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D463482308
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 06:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D463482308
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39Q3KavM006236; Thu, 26 Oct 2023 06:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=CFIIIJq/eZVszZdyrmEWAVQ/QrtYJOMYpTpzhQVFB5g=;
 b=u4agUy7Oy8VYA5PGbPub0vGbtfGUse+egrl3DgvKhr0BNXfdIN/oeGHOcjJcuq0q/Zt6
 k/NjkrpDLUO8h7oWNQsu+5POkFMNwjYuajWy9Er10ApDNSEwwWuTNk534Qn8oMNCvgaV
 NMnQTLnCT/cvR/NzP5dkjeiRUM3oBLrnY7K5eewqepOQZ8ZaYZsWcFsOosk6Q560bS/d
 BZzlJ24h+R4AZriQiBJanJWZqn2x86uGS6HP745htI8aNwg9X+vsCXrHND9n9/GnN3Nu
 HKiWPgS8XSgecN/9cOcbeCWpIHhkeHE7znsQiWd5Ix/rlW6gWdDwlEIUa+4Gx50xlVKx SQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tv6pd2an2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Oct 2023 06:55:28 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 39Q4nDSx031273; Thu, 26 Oct 2023 06:55:27 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3tv53e8xcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Oct 2023 06:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J88/XovCQUFOaA9GZH1QdmM+N83n2lUwx2+to7x1QuZ73RehxIt4VJuOUW9hzNDF96UOX30TObFL+6/ToyM54ojBBL03kMIU1RCjkLxmqgITakgkNp1RL0WPDgKTmReD7Xl3aFgttrg0a0qCElpqxMYKvvD78rO5yzORQITxf4lEmByracqw3OvNJZRlh4z2HipeWzta0EvW4u37LegjKcM0Rig+LCs2gzZ9C5NdT6KQ3xwHgu7CGjSTWj2yeENcOiTsrH8AwFqXj4lwbozz70FkE0kkWUKzHAtNedio0Omo4/AWPnEiI/gwOLplh/E2uHAc4VWZfY03zOS+i8WGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFIIIJq/eZVszZdyrmEWAVQ/QrtYJOMYpTpzhQVFB5g=;
 b=ME2eCx/CO7DJwW+yH9NieOwYBhqPTzDhfvCRcQm3uUNuUoyycrtMHjx9uAVW4lxN29LLpB1Y/zTvx2ZsIQ7g5TGKXjF5iUp+OzmbdxjXzYQOO4aKlfM63IbGRVXRi+e7UTy6Mbv32hssawhKLusmJw8F7N53ZDynpyRaArvFDiuSKP5YGErJQTHCtjrcGeLBuj2gC5rUNEii1zHtri0tlOEU8IfUuotN1jOEGR2imb7fG8rFWKHiVt0eYkN19M6QSRiVQbMQ602UPp5h5+ZEceJIMaTcsZO8kav/x+NWj+1aE7XjRczGIXeHhdOm+dLyWPAAEhP+gFcKGhEM4UZqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFIIIJq/eZVszZdyrmEWAVQ/QrtYJOMYpTpzhQVFB5g=;
 b=rv1Ocb+jAwhN8vDskoC1pJ44MqrBSed1WKQ/wS4VADaRrlEggxzQTvtbZPAWIuSFj5Or/vta2ng1NeJuxZxC7wea6xrqTgcNYlANBGtSvJ2wnPbvlQpTtA3GMR6nIxkCqAcL2kGYvsDLWqNLg5YVhrXblhl8YWZNI0WuskrdKlc=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by PH0PR10MB5705.namprd10.prod.outlook.com (2603:10b6:510:146::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Thu, 26 Oct
 2023 06:55:25 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::3942:c32c:7de0:d930]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::3942:c32c:7de0:d930%4]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 06:55:25 +0000
Message-ID: <8f7418e3-816f-4bfd-bf6e-8be68054f55d@oracle.com>
Date: Wed, 25 Oct 2023 23:55:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vhost-vdpa: fix use-after-free in _compat_vdpa_reset
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1698275594-19204-1-git-send-email-si-wei.liu@oracle.com>
 <20231026012326-mutt-send-email-mst@kernel.org>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20231026012326-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|PH0PR10MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0a4c58-a609-4e23-3f17-08dbd5f087cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: usYV88YHV7OKnVfeKeAiGWnw+FZtPt6e4pJZ5Tydo0FDtmUpIDpe424O5jVOEYOw6HwrLlrikD7SLBcwvEi3G/caX3tFw2D8kPB7KyslTaGUeKtSzlTRuf3LkgTfy05dXAEO4AQV8kMEpBpIoJPRDRBFeKdLF52orlf5DvVtvCHJBYOHBHA1zTFW2o6jZ3SvgOHxyrmoFeY2MqKmJ6/oUn4fS/Z3ofA5faLXpAX7+aRZHjBJ4JSezZ41354xE6bYaLKL1jfIEPog5uE7Z4Dzw07nf6KXKVHvQR4JQS6fQkU6w5GKgrGjUvSYCkrH474dUQT6GOb4j+IQWaPleSKCi0xrm97yWEKscNWH8/NsY20mhD2dGdiaQ0EEsaxc+Ywbwvy4EKvt0RArmqdGslZSWSm450a71ccOlVPqOYIarrUQSa7kf2T0Jab5bfUagmVQ9mW0h4u96u+LTFrAkKX3Hhv7Wcb5fqok2nUgACiA8y/AHACIuIYawJw+2Ft7j+u3Iyk+R8Qw7gNHYAkA5UeF/E7yBP15b63vX8EKQanoqH2sGRNXCFvGbZhnaMfgxn3h9hVdpBlH7yfjbRdqMgV0EzvyDghh38L0oe6TDPyJ0xLIH0qHCp1RqZswoYIGWDjBwPioHz2qT0NlePt8cpMT5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(83380400001)(31696002)(53546011)(36916002)(5660300002)(38100700002)(26005)(6666004)(36756003)(2616005)(2906002)(86362001)(6512007)(6486002)(316002)(478600001)(966005)(41300700001)(66556008)(6916009)(66946007)(31686004)(8936002)(66476007)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVU5S3c2MXBMaFVpMURzcEFtajRkSVpUNW9QaHkvYXpCUEJ0dGVrTmF6dm1X?=
 =?utf-8?B?S1lVTlV3eWZnOFl2bGpiRDdST09rTGk1MWdEUTR2OTBGVm12OThVcEpCcERa?=
 =?utf-8?B?N2xkbnNxMWZsWmFDKzRaV3ZUM2o0QlJVT1E2N0xhbm1MdkkwbHJVYlpjckdz?=
 =?utf-8?B?L2kxZnpxREVWd0NPMUVvK1Rzd0MrODZabkFWMHdidXY2bThqU2VWWEtHelVW?=
 =?utf-8?B?WVpzSml0NnhoT3MzTUFuUUlweGs2aXp2VTBOSFVqcG1TRTFQSHhkb3B1dUR3?=
 =?utf-8?B?Y0poMU5mZkd3SVpRVklmM1UrZWtSaWRCTm4yNGpNRDBPbE1veXQwUGMvTVRY?=
 =?utf-8?B?VWN4Y1NIUjZFL0RNYzVTcXZWVmdjZkhET2VRSm5rQWVLZ24zemFJWndQSWJN?=
 =?utf-8?B?THlEWENUTjZKKzh5ZDcxb01CckMzWGpoQzJqd1FvQmJkZ2U2eU5nQXZrVzlv?=
 =?utf-8?B?aXFKZGVsTUNSNVYwNmZqSFVYWnlwalpiMjgzQjlTb1VXUUlIYzM5M3hGUits?=
 =?utf-8?B?NW9qakxDZzBiU2VQUjVmbm1xcXphUkNyTjdMQXdCeHF1WFA5QS9kbWZ4RUNY?=
 =?utf-8?B?RHhSZHNHN0xOMkUxOUlIdnNmdjMybnVVZCtJT05QYlhqd3hrZlppTlUzQnpX?=
 =?utf-8?B?anBST2FEREs1TkZaYlNobVAxcXd4N0hBcExrYm9ndzRyWUE3VjNZOVlxTHpR?=
 =?utf-8?B?MVZXZmNYRzVvMFZJZm5ySytHdGd2WHhsNlZlMWNGdHBVRzVOZStySVNPZUlW?=
 =?utf-8?B?bzdhZWtJNjlmSmZsQjFCY0FYRFhIMjhmYUYxMFNLNW1QYWJQNHpub3d0d0sr?=
 =?utf-8?B?QUFhNHFaR1k2QS9EUk9BR0dKZUdCUC9LRldWS2hnWFl4enFVZnR2MkZkcFNi?=
 =?utf-8?B?TThGd1hKbjlsWEhuMGJEV1NhS1pZU3plVGJjbHg3dXYxZFVaNEl1YkwzRTRr?=
 =?utf-8?B?S3Y2S0FvY1VWU2FQWWJ0emdRU05LeHNPVUUzUG80enZvQWVQNk45ZmNQY3Jo?=
 =?utf-8?B?VTR5bnlFUXd1V3dOMlFJSTE5SHpQTXdGdmZ3Tlg1T1ZkV1dHdHJqMTNrNGZo?=
 =?utf-8?B?UUVxaWRMdWJzNjRya212aTlmRjVSQlpPREVyd2s2ZEhPVlpOc0dQKzJVazVq?=
 =?utf-8?B?N3VRWWk0L0h2SWRVRFpaWWN5SDdrWW03L29WTmtiQTlsZVZHVnR0NHBzUFo3?=
 =?utf-8?B?MHBiYWhTSURhL2NKR2RLRjdHRUxjVmpUVVppQnJMcC9hS25ES2Q0RktweFJa?=
 =?utf-8?B?OExKckxyKzNXSW5pTWN6T0NJdWVKaCtIcERpQ25xb3Y5UlM2REFIWEgxSmVE?=
 =?utf-8?B?TzUwOVhOeWo1ZHE2ZHphendyUW1HYWJzK3EzVVVYL292bnNJSHE1aGhQb0RK?=
 =?utf-8?B?Q3d6YkhaRkJEYmptSTdGSFF4TzB2WE9yMWQ1MDRPQVdQV3lBVEQ2VlJUUGZ0?=
 =?utf-8?B?M3ZWa2IzZXFoSzRKQ0JTVTJMOXU5NkNRNVRORHUzclRWYlVuaGRNN2VmWU96?=
 =?utf-8?B?NFpJb1ZGbUxkbHdkWm9HTFM1dnNjZlNMb0R0cXhHdk9zeWlFM2xIMHJLZ3JX?=
 =?utf-8?B?VkhyMnJwUDZTZ2NyV0tTRWRjTC9xd0pVakcxa09nS3d1SU0vaVk4WHdLeTdj?=
 =?utf-8?B?ZkxMODZaR2JUN0hROVhySnNMcEVuTUNSd3N3WWNLV3NhN1ZUdTRuMlNYdUs2?=
 =?utf-8?B?Mk5ndHBDVjBHZzVGSWVPNGxJQi95NjQ2WjhKUlFhZ0FyNkJpT0s2am5TTTk3?=
 =?utf-8?B?KzlhWWVhTXpsL0x0ck52OEw2eEo5ZnRUQkNaSDFLUnZPRnRVN05hNGJMYytM?=
 =?utf-8?B?V1dET04rQklSM3dKblNlZVRTdTVuTUNWc3dLNUR2U2l5Z1ArUHA3V1ZXaWQz?=
 =?utf-8?B?NjhaT1lxeDJaNm83d2s5U3FzMERDV2dUWFRveFBMSWZxb2g0WUg4eDJjeWZw?=
 =?utf-8?B?QUJpUWdjOGtVc2dodUdnZ1hNMkpaMktzd2NsSE5HYWtPQnZiN0Fjb1dDdWkv?=
 =?utf-8?B?cVd0WGRnUHhiSXlzcU5ubk80VkE4bG5PSkVjLy9ZeEtxQndCUldBMEhzWlE1?=
 =?utf-8?B?TGFYS0VqejNNOTBkV3FuOFJSOE9ZdFBoS21FK1dwRzhiQXU3dUo3R3lYWjR5?=
 =?utf-8?Q?KD5bk78pXb/gZytgjJRwyUhXZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MvNgxLfFf5FZXxG9cBzT/H5kXahrZNImNoVGitkXTb1iEsCsPpS0yAx+q/rSzNPFcH3hQ3YnOqLA2ELuTs8t3Ok9tjC37KbqUR6xO40PyaEMI4i2HZEdXU5kn/wuh5gX/GaQDI06YpJrqluvuamFpFyN2R1vYWQOENqy3BSsazzmrSyjJGqYxOUaDXIxpeCJYHNMla2pDqWAaDBrI/ur6tcS7x3Raxur288QXiHKn+vN+3Q46uSBWZfqcbwmHIEjd4GjMVqLplFTwnfCyaIwzab9qrMggRAboC9pfh5z7pglLQAHhRxFvaSs7ozerv3ynCeB0mFExYxSWcrZelXKGsvxREfFAPXUayHHVclSDXYYdCVPrxyvZGYLF7KoKWQwv8q/Dx3+4Icl3V3rjoXxNjiXonV+4bhcatuiqmIBPitsOyQk73C88C7LU5d1xgyY4XTujC10e2Xl7GE10KJENFriltsj6PoFjje9cn2sRwOo/+x3loMPgwy30aDOn7oERr54/8Eb4no/Sc364V1i7SwlTNsRLEEefspStrCbP+l4o8KFj7vSbH3ZUX5Eg6WZ9UciRcT3mMn116BqZIvCpw3SAOC8u96g9QLsjf+3on9XkUQQN14Rs6E2hn1gkcbvynYV++kobVesVLxnLBRfnyz82Gm33OOEwF90iWT5wmXfYBmHxNeFBIKaYVxj3DB4Gg5t78Nch0+nXJJ/taTLWSXcHUnREI8w4u71TGvCA5vDJ333TikQNTBOxInjWZGW1pc+ax5+D6UI7yl0QsLCEmOziskjG2UfVLem+lFGHnpMc1uPpVGokCVVVvWfUf2spM4VUs3pK7OPiFLxEXqiZMrlB1BcTEut4SBz/VnXZOD3v5VE1jWyEIGiyXv6o71zTtieUMVLrLhiU/nahoGY1h5OFDsuKxkCRUAAb6Ont88=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a4c58-a609-4e23-3f17-08dbd5f087cb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 06:55:25.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSlCUVAQ+dlChe9Er6nKD8rxnQ7m2GKW5u3e/3lqTabdRdaveWXTvMCFuuImLwe04b+VtjlRGyN9aCp/fTbyfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5705
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_04,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310260057
X-Proofpoint-GUID: XXn8lJv6Qf0Nvl3XlzS_Mrpq2p_5wVEK
X-Proofpoint-ORIG-GUID: XXn8lJv6Qf0Nvl3XlzS_Mrpq2p_5wVEK
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-next@vger.kernel.org,
 leiyang@redhat.com
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



On 10/25/2023 10:26 PM, Michael S. Tsirkin wrote:
> On Wed, Oct 25, 2023 at 04:13:14PM -0700, Si-Wei Liu wrote:
>> When the vhost-vdpa device is being closed, vhost_vdpa_cleanup() doesn't
>> clean up the vqs pointer after free. This could lead to use-after-tree
>> when _compat_vdpa_reset() tries to access the vqs that are freed already.
>> Fix is to set vqs pointer to NULL at the end of vhost_vdpa_cleanup()
>> after getting freed, which is guarded by atomic opened state.
>>
>>    BUG: unable to handle page fault for address: 00000001005b4af4
>>    #PF: supervisor read access in kernel mode
>>    #PF: error_code(0x0000) - not-present page
>>    PGD 16a80a067 P4D 0
>>    Oops: 0000 [#1] PREEMPT SMP NOPTI
>>    CPU: 4 PID: 40387 Comm: qemu-kvm Not tainted 6.6.0-rc7+ #3
>>    Hardware name: Dell Inc. PowerEdge R750/0PJ80M, BIOS 1.8.2 09/14/2022
>>    RIP: 0010:_compat_vdpa_reset.isra.0+0x27/0xb0 [vhost_vdpa]
>>    Code: 90 90 90 0f 1f 44 00 00 41 55 4c 8d ae 08 03 00 00 41 54 55 48
>>    89 f5 53 4c 8b a6 00 03 00 00 48 85 ff 74 49 48 8b 07 4c 89 ef <48> 8b
>>    80 88 45 00 00 48 c1 e8 08 48 83 f0 01 89 c3 e8 73 5e 9b dc
>>    RSP: 0018:ff73a85762073ba0 EFLAGS: 00010286
>>    RAX: 00000001005b056c RBX: ff32b13ca6994c68 RCX: 0000000000000002
>>    RDX: 0000000000000001 RSI: ff32b13c07559000 RDI: ff32b13c07559308
>>    RBP: ff32b13c07559000 R08: 0000000000000000 R09: ff32b12ca497c0f0
>>    R10: ff73a85762073c58 R11: 0000000c106f9de3 R12: ff32b12c95b1d050
>>    R13: ff32b13c07559308 R14: ff32b12d0ddc5100 R15: 0000000000008002
>>    FS:  00007fec5b8cbf80(0000) GS:ff32b13bbfc80000(0000)
>>    knlGS:0000000000000000
>>    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>    CR2: 00000001005b4af4 CR3: 000000015644a003 CR4: 0000000000773ee0
>>    PKRU: 55555554
>>    Call Trace:
>>     <TASK>
>>     ? __die+0x20/0x70
>>     ? page_fault_oops+0x76/0x170
>>     ? exc_page_fault+0x65/0x150
>>     ? asm_exc_page_fault+0x22/0x30
>>     ? _compat_vdpa_reset.isra.0+0x27/0xb0 [vhost_vdpa]
>>     vhost_vdpa_open+0x57/0x280 [vhost_vdpa]
>>     ? __pfx_chrdev_open+0x10/0x10
>>     chrdev_open+0xc6/0x260
>>     ? __pfx_chrdev_open+0x10/0x10
>>     do_dentry_open+0x16e/0x530
>>     do_open+0x21c/0x400
>>     path_openat+0x111/0x290
>>     do_filp_open+0xb2/0x160
>>     ? __check_object_size.part.0+0x5e/0x140
>>     do_sys_openat2+0x96/0xd0
>>     __x64_sys_openat+0x53/0xa0
>>     do_syscall_64+0x59/0x90
>>     ? syscall_exit_to_user_mode+0x22/0x40
>>     ? do_syscall_64+0x69/0x90
>>     ? syscall_exit_to_user_mode+0x22/0x40
>>     ? do_syscall_64+0x69/0x90
>>     ? do_syscall_64+0x69/0x90
>>     ? syscall_exit_to_user_mode+0x22/0x40
>>     ? do_syscall_64+0x69/0x90
>>     ? exc_page_fault+0x65/0x150
>>     entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>>
>> Fixes: 10cbf8dfaf93 ("vhost-vdpa: clean iotlb map during reset for older userspace")
>> Fixes: ac7e98c73c05 ("vhost-vdpa: fix NULL pointer deref in _compat_vdpa_reset")
> So these two are all in next correct?
>
> I really do not like it how 10cbf8dfaf936e3ef1f5d7fdc6e9dada268ba6bb
> introduced a regression and then apparently we keep fixing things up?
Sorry my bad. The latest one should be all of it.

>
> Can I squash these 3 commits?
Sure. Or if you want me to send a v5 with all 3 commits squashed in, I 
can do for sure.

Thanks,
-Siwei
>
>
>> Reported-by: Lei Yang <leiyang@redhat.com>
>> Closes: https://lore.kernel.org/all/CAPpAL=yHDqn1AztEcN3MpS8o4M+BL_HVy02FdpiHN7DWd91HwQ@mail.gmail.com/
>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>> ---
>>   drivers/vhost/vdpa.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>> index 9a2343c45df0..30df5c58db73 100644
>> --- a/drivers/vhost/vdpa.c
>> +++ b/drivers/vhost/vdpa.c
>> @@ -1355,6 +1355,7 @@ static void vhost_vdpa_cleanup(struct vhost_vdpa *v)
>>   	vhost_vdpa_free_domain(v);
>>   	vhost_dev_cleanup(&v->vdev);
>>   	kfree(v->vdev.vqs);
>> +	v->vdev.vqs = NULL;
>>   }
>>   
>>   static int vhost_vdpa_open(struct inode *inode, struct file *filep)
>> -- 
>> 2.39.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
