Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC9656732
	for <lists.virtualization@lfdr.de>; Tue, 27 Dec 2022 05:04:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46EBF60BD8;
	Tue, 27 Dec 2022 04:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46EBF60BD8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BRAylVeS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kjvhx7PIGxZY; Tue, 27 Dec 2022 04:04:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 06AF860BD6;
	Tue, 27 Dec 2022 04:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AF860BD6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38519C0078;
	Tue, 27 Dec 2022 04:04:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0B30C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Dec 2022 04:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B93B406E0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Dec 2022 04:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B93B406E0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=BRAylVeS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_K18-gWqNcG
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Dec 2022 04:04:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A6D44067C
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A6D44067C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Dec 2022 04:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672113863; x=1703649863;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+7k6pq3N2K7qb1pownRRK8vmkwWfDtBqWQMIdBkB0fI=;
 b=BRAylVeS7dIpTx6cbrtB2TwHPzU2imhgyNAQLyABz+agjlOUtl4WitzS
 c20whmu3Xe8zxXEXh2dTo7HD0X24cVBa5jdjWbCcGTGyOpEi9643AFqVn
 TNPdLSRzVdp9XdxcpADWU+XOsPBedyxgXEn0s3CXPrMkALzLkk6vyiTGj
 dSd+mRo81UecWeA4bgwvwWOmi5hG/UkOd7+u2rKnTIifUdDJyv/VSdFjF
 VNLXqDvguY9PW5HMtDEhJYdTLCHzGlT8guNtf/57YN3fuyYh/AvKgtFlX
 eyRVrxqjPQwdfG1zb3lXCqsNUtHnynRq0Pj4ZAee6T0TZpMqCmQUjITf2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="304139946"
X-IronPort-AV: E=Sophos;i="5.96,277,1665471600"; d="scan'208";a="304139946"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2022 20:04:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="716224585"
X-IronPort-AV: E=Sophos;i="5.96,277,1665471600"; d="scan'208";a="716224585"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 26 Dec 2022 20:04:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 26 Dec 2022 20:04:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 26 Dec 2022 20:04:21 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 26 Dec 2022 20:04:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkfE0ndxR0sfuWAeLAL6EzanMtxw8mPFJPjqAPGg+15jrbzpCZiHLuOGxRJy7UHcd6nYgE2UN/nmLLXl2w0VXtVGC8uNb4W5bGNbC4ixx499Z/xI77tukmWvNhoySK1vst3Kff1uZ/wGAqN0FvsG1WcmTdFPDA8kS48mFyoNKwWvZt7UJzif53XOF+oAGNHsY0+q6jZkp9owUD4QYy/p+0wb+o6isiXPPCJZI1WzZyCe9i1+gJoxgQjLtXziPbhBN+Qm2xjx1msIeO6X252CEQxs1+U3IEHKZccEXPPRJaBp07TZePaOATheUKtctgJym1LaWSWKVaIR2c79myCD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwkYwVj9NG+q4g5Lg55xwcA1JGGJ3fS1HMnnoncbzZo=;
 b=TwPQ651FYnkoDyUSCaWMIoD4OMcoNzKqA7mWAdstEcF4W6tboaTODw7C45/SFTcL23h4SzprEdi/OTv0kNRls+ck7gq+IA80rc+sWt/tK50aQc+5O9SYQWJfxzMBL3QM2TNOVLLez7IYX5lTQxQg4pw0m5q/FnV1nju8i7ZrF9L237ACZbVW3EK9qZDrFXQ4eRgPfTfFtoFkbvgvIvRoH00Ow1iRBX1CHpmcscOlAvzZQjTCyEnaRQd5hYznBnah6kuRhdePCT3AQsbItCRTA714rdeUT888TMK0VslwfcA77+D87yh80KvYlRfOthRs7IVye/zeGtQKbHX6it8CDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Tue, 27 Dec
 2022 04:04:19 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9976:f25a:e9d3:2a0b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9976:f25a:e9d3:2a0b%5]) with mapi id 15.20.5924.016; Tue, 27 Dec 2022
 04:04:19 +0000
Message-ID: <3557e69a-0c17-0a24-0706-8b48c350b75a@intel.com>
Date: Tue, 27 Dec 2022 12:04:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.1
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Conghui <conghui.chen@intel.com>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
 <20221214063352-mutt-send-email-mst@kernel.org>
From: "Chen, Jian Jun" <jian.jun.chen@intel.com>
In-Reply-To: <20221214063352-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: SG2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:3:17::14) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf4e20e-9d69-4b3a-4da5-08dae7bf6d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRSuivYW/toyUGZI2xMEx6UYvhf4G5cy/RFE5eGe0jQAnMPe5mJE+WK/9SiTGxvOUCERBTjvO9p4CR0roqvYvtNA55wISaQsv/S/33t3EjCFj6c2Vr4BPODsxaAD4HLNdcEmA7bsx4rev9oPS1Hv/1SgstK4AqtsM0/7SM1Gb6lWPaGjly4onjWRkDBCksygnWUwvGpy3jByRoVjwW61r+x7AvQHn3+NKG3NhO27WnkSrcLe9Lj00uF5y0Kj9xSXQXYFVrQhnc4XGhPaBuSVGsi+0G0lnr9yt0M6CPpvu58oGE1zyuZKjMPkZw+/Ix9dOae6umANA42+wb3UUqQb7FVtdwVr8pAqPkyge8XDpIpqYuaJoqJj0ItRpAAOtJtipedHQnocCAf03uC32kiyATu/s3sZ4gulN0NSimf0WCBXprdjqqM7WSz403byb9TPW2en8RywuqAo9sfRrPWm+u/c/lNkwVIxb3nd220b2tFL5s5zqXSeT1WVRzaLq0ySmjv0ItKABqWjrj8mOjqdDvcHHycFIsCQQ52RwDZMmmThW20MBd/WQ2J6wiohSO9rRneXiwegmfRrUBGZGfII5LGv/fpH84JLJ8tTPxX8YJ9Hq+Vsz/ND24esvtBAbNWOrfKeaL/7wbIn/iIKtQZ18Yv7hOTXEeF0M6OenasUUe+S/KgKMbnK8FuzhdV1+UIpfNc8dq+ni0mDcEr9sBMjdMeVigp5qTj6a4PoLKMHvh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199015)(83380400001)(86362001)(31696002)(38100700002)(8936002)(82960400001)(2906002)(15650500001)(41300700001)(5660300002)(6666004)(478600001)(6506007)(186003)(2616005)(26005)(53546011)(6486002)(4326008)(6512007)(8676002)(316002)(6636002)(66946007)(110136005)(31686004)(66556008)(66476007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0h6NzljTzZjbUpZaDBTZllaZ3hhdUw4L2RVdlhoV2xYZFFIdVhQeE5MUzNW?=
 =?utf-8?B?ckN4RGd5TnU5cHRHTHUvM3Q3UGcyV1hBRXRpMDU0ckpzdWNNOXBGd2ZrVWFp?=
 =?utf-8?B?ZG5oYTk4UFU1Y3Biam9XNURwSFhBZmJZRUEzRzF4cGdQLzZ4QS9BTUxycDla?=
 =?utf-8?B?c1hQMU9IUG5IWWRVb3ZiZ0M2aXM0NXFieGdtcFB4aXluQS9zNjBlZm9YWnAx?=
 =?utf-8?B?QnNwaFYyNmw4ZEpOay9PcnJxazI2cHFWTEpZT3NEaTNDblNSdXVtdVZvMHRX?=
 =?utf-8?B?eGU3RElmMHgvSVYrSk1wdUgxUW9zZUE0WjIyczNnOUdlQStKMmhTbVZoQTJt?=
 =?utf-8?B?WlBFa0F5WmpjSzkwelBNU3JVOWY1aTQ1cDFHUDVGNVNGbmIxZ3VIVEU3dUp5?=
 =?utf-8?B?aFAyQVFlYzk5c3FaZW45YXkrdUtDWVBheVBiWWFuSnZmK3JBakpKV29lcXM4?=
 =?utf-8?B?L2dTd28vMUJUeFpFalhuTGY1Rk5sc2lIK05mTXo0K0dOMnB2WlR6b0tUaDZB?=
 =?utf-8?B?VXFOcVkycmZmR0NxNS91SGlFekhDeXJaNVQzUVRyTmR4SFFJYkIwNzMzU1NO?=
 =?utf-8?B?RzJXMzFXRjNrMXRCSllVTFdCUm5BNzg0WjgzS2hNb01kWmhEM04zd1AyWVF1?=
 =?utf-8?B?Q0pIaStyTjYyNWtjQU94bndLd1dmSmd0SCtONldwd3FJcU9QRTJhcWFqVW9I?=
 =?utf-8?B?NHJKNzBzaHpqbkFkYTRRaTBYQ2NCaGxWUEZNbDQvY0Y1ZjNsbzZQeCtDcEh6?=
 =?utf-8?B?VktLZm04MTBLTks0RFg1ZkpBTnlGTm5sNERXQ0pFVHFBSXVucGoreG1HQzNk?=
 =?utf-8?B?QVcvSjNENFU3T29wb0Vza3lNVFU2MkxDL1FJdFNPc2ZubTZjSmZhTkNIUTR3?=
 =?utf-8?B?SUJ3eXoyQ2RHRnBUYkU1OW9tYmNENHQxL0dqcDNROFZYWFM5dmh1WDRWTHZ1?=
 =?utf-8?B?aW5VM3lsck4yRDgwa0FoZzRNdDU1WTNWOWtFZ1hRYzhYaHFzVStJOHFTcXFR?=
 =?utf-8?B?d05IZklvMTh6cFJUNnFWeXk5NUlETmc1aVNKWTNUS0VqSEI1Q2szQTgrRnpy?=
 =?utf-8?B?L200YzhDMkYwRThkV1BRS1BNeTd4V0t0dFFZKzd4ODVwYi9scENBeFdCYTdk?=
 =?utf-8?B?MDRyTnBzZmx1Z2dWMDdIV1ZpdllCVWRMQVN1QS9Uek1rY2tuS3FnaTQ0bVVi?=
 =?utf-8?B?QzVqdnhzZFp6aVRGSG5BVEV3QURRSU5GRC90Ukt3K1BIZmxhQmFqY1FZRVMv?=
 =?utf-8?B?b1BBbUxXQlY1d2hwRm95ZVo2STQzN05nNmlDTG5SYW5ZZDVDZmhyS1RZeEJk?=
 =?utf-8?B?RzMzYUZWMGVmTUpKUVNrVEZlRlh5djhBUjRia3l1MzVvWS9yRTlCY29DOEtW?=
 =?utf-8?B?bnFETDB3a3lTMHhMSGU1K00vZGRuREtNek1sZHNQRUNTdVpKUjhRZlhEdzJs?=
 =?utf-8?B?STAxcHM1bFpRNlJZZVVUdDJXVERPTlA2NUU3YThVMXFMbDB5K1V6YUVYNEZD?=
 =?utf-8?B?M3l1d2ZscEdCOEwyVWwyZjdLeDVRTmMzdHJQWGloZUlVbE1ERE1ZZ3dDakZR?=
 =?utf-8?B?eUVOY0VQVmZqTUZRMkRSRXJPTWN6SEY2SHM0bisyc1JPdVRJUG5aTlpKZnBr?=
 =?utf-8?B?K05JenhpN2pXZGlUbkpmSlA3djc2VE45YnpzQnpYcCthdmVHUjdnWE5TZGln?=
 =?utf-8?B?OExOZHVnVnF5cnI3ZnZCMVdFYzlLRENONzhIYnd2WnU5Qi9YbjRSUlQ5ZTI4?=
 =?utf-8?B?UVdPNW5qNVZzMGFzVXgzWnVCOGM2MXpNbG1ycGdPQmNheEpPY0VUd1gwTTcv?=
 =?utf-8?B?NEw0UWx0WUlSRm5NbTFBRVlUQitSMVk1NStnTnQycTRiNE12YTdpOElyMlMr?=
 =?utf-8?B?eVVnanNsalJ3NWN2a1ljN3p2TnFVdFgwb09LWEpaYWRHZCsvVG5qVjBHSzFD?=
 =?utf-8?B?VjFKYzNaWkJxK29rb0J6eGdOcVNOQmN1emxFWkR2TFAyRnNNTWRSSkhqVHQ3?=
 =?utf-8?B?N0hqZlcxMEUzZU5VSG93R2NLUTBOWk5YMmNFOC9MSUNDYnM2UkQ3UDNlbkJw?=
 =?utf-8?B?M3J1Nk11a1Q3NkNqNXU3cVVLaStoajV0YnNQd05Ia1dXY0xmcU1KMXhKUjJr?=
 =?utf-8?B?RW1kVTE4RWRBYUJmYTd1R0RRbU9Yek9Vb2F5NTZ2ejlLRlJmWVZTM2RTWmJw?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf4e20e-9d69-4b3a-4da5-08dae7bf6d93
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2022 04:04:19.2454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGj0rrn9lwqX2l2r0W6Z+d1VJ67wz/aqx7L0Ng3In5dqBhqbMHK/ue4KwTpM1y4tJDLXS9K7iOMGmSCTsX3O3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
X-OriginatorOrg: intel.com
Cc: asowang@redhat.com, viresh.kumar@linaro.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, wsa@kernel.org,
 linux-i2c@vger.kernel.org
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


On 12/14/2022 19:37, Michael S. Tsirkin wrote:
> On Wed, Dec 14, 2022 at 01:36:31PM +0800, Conghui wrote:
>> This updates the maintainer for virtio i2c drvier
> I got that, but what is going on here exactly?
> I generally expect a new maintainer to be active in the
> project for a while first.
> I don't see contributions or reviews for this driver or
> for that matter for any virtio or i2c drivers from Jian Jun Chen.
> It looks like you are no longer interested in maintaining
> this? In that case pls just send a patch removing yourself.
>
> Jian Jun Chen, if you are interested in reviewing
> patches please start doing so, you don't need to
> be listed as a maintainer for this to happen.
> Once you do this for a while and write some patches,
> you can become a maintainer, this is not a high bar
> to clear.

Hi Michael,

Yes. I am interested in the virtio I2C maintenance. I have lots of 
virtio experience in ACRN device model development and was involved in 
the early phase virtio I2C discussion in ACRN before Jie/Conghui 
upstream the virtio I2C spec. Sure, I will start to collaborate first.

>> Signed-off-by: Conghui <conghui.chen@intel.com>
>> Acked-by: Jian Jun Chen <jian.jun.chen@intel.com>
>> ---
>>   MAINTAINERS | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a8c8f6b42436..44747f4641a6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21920,7 +21920,7 @@ F:	include/uapi/linux/virtio_snd.h
>>   F:	sound/virtio/*
>>   
>>   VIRTIO I2C DRIVER
>> -M:	Conghui Chen <conghui.chen@intel.com>
>> +M:	Jian Jun Chen <jian.jun.chen@intel.com>
>>   M:	Viresh Kumar <viresh.kumar@linaro.org>
>>   L:	linux-i2c@vger.kernel.org
>>   L:	virtualization@lists.linux-foundation.org
>> -- 
>> 2.25.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
