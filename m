Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728574A705
	for <lists.virtualization@lfdr.de>; Fri,  7 Jul 2023 00:26:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 238E361147;
	Thu,  6 Jul 2023 22:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 238E361147
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=l+q+k+1p
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFWSAJUwu0cA; Thu,  6 Jul 2023 22:26:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D498561140;
	Thu,  6 Jul 2023 22:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D498561140
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F7A7C008D;
	Thu,  6 Jul 2023 22:26:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41B22C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Jul 2023 22:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBB5141912
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Jul 2023 22:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB5141912
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=l+q+k+1p
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sS-lMIm-_CCn
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Jul 2023 22:26:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE9D4190A
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::61c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BE9D4190A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Jul 2023 22:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3fByps6Plff4iMhcn1zH/R3kYQibBSnjt2gCITi3H1asqz3jkRoZHFAylTvdDBbqYXuxx5hYJFUWjxzXGEnRk04ZteC1LU/Nsp4WXAziDTI6jvmrq51NlUMoAOB6fFnGa7ILbbkcm/5qoBNgeY9yTif5jz5EgWNgKd9L07cLR9q7DpzPYo70OxQpYH0fqrhT5fMumVBZNutplRwMJ5KkttD28Mpg4FYHUnQ0XRrR7QCOtRI6DiiSOWXCpcAZilehOo8ieOhUa52whSpdh6SCJ2IYxvGYitiIlSSgk+hSPD7aNuH0XEW9Ds3c4ZQVC3KzkheJR4rViDCG7idPYwAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t316LYr0Di6gEROhxPgQiQ/NQD3hRN59rMB8JZb+yAA=;
 b=kXx1l5dTmsfFPBpoy5xyh0gHPu/dx9SwP3V2IBI7j1CzmLEzwTtXwYcrlz80hRVEsaon6+HXzBWEf7itEDBVgAS0Wqe2LCwqwbo70m4w/EFHVrd/czPSQK7M+PH3HC4grrNC6TBflsvoVSiAtG6NGAaBrxcs25aBT/k2QJO584gqVDJ4hFHB/IGGqYGhdR4lvD00DFiy79vLwFNxTTPVqgqcw0bdHm1dE8VCK1Q50PdJeGvxMUFuH7zReRAU2GBQ3dvPklxBVOuf7Ydk6AVF0j1jovBimTcK1p8fX4yBRQWwRDzrLYQBIs0uQyTb/qPocUQws0ONDQ/90NwnuTZQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t316LYr0Di6gEROhxPgQiQ/NQD3hRN59rMB8JZb+yAA=;
 b=l+q+k+1pXpaHC88GcRmJXkQ7bLUsCcBPAsi+T5dVPDwRiW5c7MhfNAA6vY1tYxbbXGMNN1CTu69tgOEGTlF0NbYXuwHvzbYQWEjzwn++BycAm192mLNw/b6/W8ObIo7tX4UH1FfNeQa4DLBO9l0t9Vcsh7LMAPbbsD8jgalEt+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) by
 PH7PR12MB8040.namprd12.prod.outlook.com (2603:10b6:510:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Thu, 6 Jul
 2023 22:26:08 +0000
Received: from DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::818a:c10c:ce4b:b3d6]) by DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::818a:c10c:ce4b:b3d6%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 22:26:08 +0000
Message-ID: <b962951d-3372-b28a-8eb0-e0f36e58bd78@amd.com>
Date: Thu, 6 Jul 2023 15:26:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: linux-next: Tree for Jul 6 [drivers/vdpa/pds/pds_vdpa.ko]
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230706115739.731867f1@canb.auug.org.au>
 <fec68c3c-8249-7af4-5390-0495386a76f9@infradead.org>
In-Reply-To: <fec68c3c-8249-7af4-5390-0495386a76f9@infradead.org>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To DS0PR12MB6583.namprd12.prod.outlook.com
 (2603:10b6:8:d1::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6583:EE_|PH7PR12MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 62fe0b2c-7df5-4976-bf52-08db7e6ffe8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SkUVDByZ3XEI++HTJqpMCekmvISVXzgI93EE0ZoGiMWNqhq2TQHYL5ScMLNHkSqx5Am0w0cnCsTSULiRwIqUYYxJjQcT+NkEJ2umh9YlLwUYStH8SUeK0gdtMZYy19B0xz50fT2HYq/x2fDyOUzpSRk/Tt78RS+WpWxwNnr8THlHMGS2lncKJHvgTS+07k0HTyhwZ58HNttk4XVK9URrXCIhVXcxcqLjxJXIVoAOyaXc4v7LdtdMxS6f0OJhp5oiLtVwPAUD6scoe2zyGvbg0NZwH8K7VO9zCZKMBXqHPJJXjd5UQmtmDXoZyQggwff6nnDRzG2Qo2aYCRI0uHeoJx6RDTCEJzLfr2Xcn4NeDk9Wdu78ZFvcDL/wJOGw4gwfGzsbyqSZ+LsVHYPtAYGX+beS/FNOfVYaeeE+iZuaB7rciwfGIK49VMTqNFEN/Uz7u/hhallqef9EkZN28duSinSqPUK4m7H1VEdijDD7LuUMLQixCrNDF677pStCbUriK1GJ+ej4xeH3CNiH4ZBePIetMWsj61T7xAOnfTJ5hidgA0pz2C774BR5X28pFJ1I5QsqRsskkFuUu2PDQvm3huVevNPtTmZgJXQVTZsfDUq0GujgoTvJn6P2AaYGh/WEU74m+QawEwwjPS6CwD+rVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(5660300002)(8676002)(8936002)(2906002)(36756003)(31696002)(44832011)(38100700002)(66476007)(66556008)(66946007)(4326008)(86362001)(316002)(41300700001)(6506007)(26005)(31686004)(186003)(53546011)(2616005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGtxcXZYU1Y3MWM2dzVLc3NEOUM3VVFwVC9nSWkrOUMxS1Y1TDBOMnFFSUdX?=
 =?utf-8?B?OVBONnhZNkdZSzUxdzlzOWtacERhQk1VNFdTdUFSSjlxMmdXT2VFbU9OVzBT?=
 =?utf-8?B?Z2UzN3IxT0ovOEpuRVAzOWY0eDdHRHRmWTR5dUZvWUlkR1cwek5PZ1lOSDJG?=
 =?utf-8?B?R2NCSHg0eWNveUFnU0g2Mk04UExHU2FxWFo0TFQwN1dzQ0Q4MXBmcVdrcHNB?=
 =?utf-8?B?MjRpMWpSR3Jaek1QTFFVYW56djVDYThCS1RqZEhqK3hoaVFpZUNWaUQzRG1M?=
 =?utf-8?B?T2draFFRVEtpNHdqUElrQWhXbGVQRC9mejNqRXp6OUQxS3llc0NvU0tZcFR6?=
 =?utf-8?B?VWZ2V05mZjlyUFJkYlg2Q2pueDV2bW5KaWZkMEtrNVFhZ0lYUXdlMnl1cEVE?=
 =?utf-8?B?aVJ0OXdUZ2pqUTRRUEVxNXNzL0hFbnlpczRvcDRvRHRuZ29lTzlIa1MvZjRk?=
 =?utf-8?B?d2hDWFB4STBpSzBsRm93VkdSeWVaSEVIR1drQi84V3lJVmxuZ3p4c29MaUhm?=
 =?utf-8?B?c3lvQ0Vma2lRQ2tDaFJxcTJlVFZqVUx3ek1YY2NwT2Y5QjQrRVFHREVwdjhC?=
 =?utf-8?B?ZFlSaEVRR09pSmRYV3Y3VG9Bamc5ZHBTaTd5V05QTTllSnRWSE9uWWhac05J?=
 =?utf-8?B?N2puNzQvSzl2UEJySmh3aHhORWF2WVRPMitkTWNzdE1rZnBjY3orUkR0bVpk?=
 =?utf-8?B?U0tKTlRZNjd1Z2pzeHNyL1A5dllCdVZ3QWp0NWE1aTkrS0dCdy9TYXgrWUJD?=
 =?utf-8?B?MWh2MTBsYTllTVBnNmpVVTlaQ2NEeEljcGVjZGlsdXlZd0cvc210RG5WVmtW?=
 =?utf-8?B?UDhTV2k2RFJNOTRGdldzTmNrWlpqd0pNcEZsZmp2RkxXVDdsR0RyL2owaCtl?=
 =?utf-8?B?QjYwdkdueHo4alROT093SGlaaHhGRU1jZnJkMmdDOURkZjFEWUNOdXkyTEVZ?=
 =?utf-8?B?WGFPdlVGUXVKT291TG1lYTc4VXB5amNKWUQ2NzByVmtGbFNkMkpMeWZaa1BL?=
 =?utf-8?B?YnVFYzNJVUJDdG9yc29kbTc0NGI5V2tzWUxISTVDL25PV1lNOTRDTmw5dlpw?=
 =?utf-8?B?bk1GLzFNUHM5MStWdzhKeVhJTUtBb05ILzVHZGdzOURjN2pjQUdOM0E5dFMv?=
 =?utf-8?B?bHBVZ1lQR3E0b0l3QldIYnltYXMvR1lTYXNwUzhYNVUyZFNlVVg0MzJSMjFw?=
 =?utf-8?B?K21jb25lQ1J0cklwR2V2eUkxUTUva1RZN3owWUoralFFdXY2S1Urb09LOVlp?=
 =?utf-8?B?OEJSakp6YXRKZXFVNU1aV3hiVXlHcXRVaysycFAycVZRVnJxYnVsOHpPQ3lQ?=
 =?utf-8?B?aEZQK3lNRHk0bHY0WHVwNHdZeFBVVHc1dXZuODZMa2Yzb21VUVcyblZMMGFr?=
 =?utf-8?B?QXhlTVhneGl4cStCVFN4TWVwM0xzcnNQRTZaUDBNcUdJLytjRDVNSXRtMmZS?=
 =?utf-8?B?M0FRZlZyeVlOV1BhZ1FIUGNpZWpjRUs2UGVJeE4vZjQ3QVJJWHhUVDZSRGIr?=
 =?utf-8?B?YzE3ZkNReElyUERwcWhwY1RkbUl0OEgxcTZnYjhKeUUxbm56KzBEMGVTczla?=
 =?utf-8?B?Zm5ma084amI0aXlMUHA1dENnYmVkU2lJUk9Qc2c2MVdkeFdBL3Zsek5iQUdW?=
 =?utf-8?B?NlAvZy9MMHlKWU92NytsNVd3R2FvMFNPSUtTai9hazhvbE05VXBqNTR4T1Jw?=
 =?utf-8?B?UEVOZlVKU05GM1cxbFVKRkpYZ1VYbHdlUjBlbnhtQWM5aUhLTWM5aERzVWdh?=
 =?utf-8?B?ZzllRllVRFlreFlUL2tyNTdyc0ZEOVl6T2pBM0tqNnc3ZFc0d1pEdytPdXV4?=
 =?utf-8?B?YnFoVlR6UHdTTHhZeXlRU05UZ3lUSGV1RW81UGp1czRuV1RBb0c0Ykp0b2ly?=
 =?utf-8?B?b0h0L2pnRWltRVlWbzcvaHF5VDBWSEttaW9Nd1NJNGdnVE44b0gzakNnenJy?=
 =?utf-8?B?MEd6ejY1RVFBL1FpNGdxVFFrcEJUZ3pOWHlxdWl5dm8rcm9maEZpK1llZmNt?=
 =?utf-8?B?cGVtZFFDcnhabCtMa2llREE0SU80S2VURzRtU29PWDloSk92dWgvbFUvUEV4?=
 =?utf-8?B?SVRZSmNBMDU1WU9JNnczV2lXd3E4c2VoZnpBNGRJa3kxb0JxQjBXSnIvQzJP?=
 =?utf-8?Q?pAUJ0Adl1vAoPiYh8VBgq4G8k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fe0b2c-7df5-4976-bf52-08db7e6ffe8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:26:08.2006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qX+miyRAtvGr0xzUDsjbqJHc53qyPNGrcdjTgIpHBxRe0WNgL43kZOGAQH9NYrfeqOSKCtCFNoSF0DxmI7x8+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8040
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org
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
From: Shannon Nelson via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Shannon Nelson <shannon.nelson@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 7/6/23 2:07 PM, Randy Dunlap wrote:
> 
> On 7/5/23 18:57, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do *not* add any v6.6 related stuff to your linux-next included
>> branches until after v6.5-rc1 has been released.
>>
>> Changes since 20230705:
>>
> 
> On loongarch, when DEBUG_FS is not set:
> 
> ERROR: modpost: "pds_vdpa_debugfs_del_vdpadev" [drivers/vdpa/pds/pds_vdpa.ko] undefined!
> ERROR: modpost: "pds_vdpa_debugfs_add_vdpadev" [drivers/vdpa/pds/pds_vdpa.ko] undefined!
> ERROR: modpost: "pds_vdpa_debugfs_reset_vdpadev" [drivers/vdpa/pds/pds_vdpa.ko] undefined!
> ERROR: modpost: "pds_vdpa_debugfs_create" [drivers/vdpa/pds/pds_vdpa.ko] undefined!
> ERROR: modpost: "pds_vdpa_debugfs_add_ident" [drivers/vdpa/pds/pds_vdpa.ko] undefined!
> ERROR: modpost: "pds_vdpa_debugfs_destroy" [drivers/vdpa/pds/pds_vdpa.ko] undefined!
> ERROR: modpost: "pds_vdpa_debugfs_add_pcidev" [drivers/vdpa/pds/pds_vdpa.ko] undefined!

Yikes - sorry, will follow up shortly.
sln


> 
> 
> 
> Full randconfig file is attached.
> 
> --
> ~Randy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
