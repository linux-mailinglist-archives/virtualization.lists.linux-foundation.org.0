Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015D75B8B3
	for <lists.virtualization@lfdr.de>; Thu, 20 Jul 2023 22:26:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A48A082323;
	Thu, 20 Jul 2023 20:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A48A082323
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YspDDqBW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zR4Z4Vv2Md24; Thu, 20 Jul 2023 20:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 55A7E8231C;
	Thu, 20 Jul 2023 20:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A7E8231C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1E9CC0DD4;
	Thu, 20 Jul 2023 20:26:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F152C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jul 2023 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E7B282323
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jul 2023 20:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E7B282323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUJL08McNS4B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jul 2023 20:26:25 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::620])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB74B8231C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Jul 2023 20:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB74B8231C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce1Urmn4L+YrcI9cGVGT73H1QxVe5PfRLHvtPUMUPDHptf1/Xci1s6K8JFpTG5cTt7l3qbaYCKmn/a10z1z1ePauZTdcqhNdDTIfZKfEx9jDtXKMacftTxpwfoXPzXev/BcSCWoS8DlS8qY3Jhno1b9SAHNK4X82tXASm51s2EUl0KYJMXQ3PGCLLmSkBT8jGELhKVHV+QabFODDlmU5eVmxTkP9qn7Xv1PpvzgrG5Zpt1aNy+Q7REKegEjfQWRxNM/CjkbjZ7wHnn3KM6Jj4o8bVz2TrhG9Pb20Jn2BZcuxUjx6VVR+aXtkByZufGe6/TBFK9WFT5++limpgy9Tjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUAdYKh7CEyIQiGE9NPwC07z+mzMpq+bbxktdONmAss=;
 b=YW3a7+ac+Y1p2GdKE9Z6YJ6CuS8omVV/etvYtLhXX4bdHhY0NTarzwdj7ubbQVfRjiq7sEo7TRTt5NHkBLGIld+tjCS4IGVEWLL1cWgy422W2AcLjL4qQMk4IcF5p2bFrR3vltlNukFPpG4oqLFWxKOOGDJLZzniqmoeDmMFrlrdlA7IpjovcOmHcFMcOzniGoXAv9YB2JOFlRbsIo6dO4++PFMV8X/7mJVo8Wzo1bYnZ/79vuWPm8wGRmma0EVzen5oh3A+lgsPE3bWhJVWGwueUtwF+nkdTOwZkUA86WaFwop5N7baPw1FpIOULUmph2bkchstuZWYHUEnsypHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUAdYKh7CEyIQiGE9NPwC07z+mzMpq+bbxktdONmAss=;
 b=YspDDqBW3VHXTbBVYtZd4le7IxesiEB3xi2Ag8DGNfjlj1vxkNVzXUkahYny8lA+8qjGUVntkriiqG/2r9qg23uJFG9E2IEPES5aMPlyhR4dBO3Idlo8G9LQrkHlE0DqCr1AZVKTEGPLFM4Vj0rIoWzu0Dh+GVEbT9Excrl5gGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) by
 SJ0PR12MB5424.namprd12.prod.outlook.com (2603:10b6:a03:300::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 20:26:23 +0000
Received: from DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::bf76:da18:e4b4:746b]) by DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::bf76:da18:e4b4:746b%7]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 20:26:23 +0000
Message-ID: <e4eb0162-d303-b17c-a71d-ca3929380b31@amd.com>
Date: Thu, 20 Jul 2023 13:26:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH net-next v4 2/2] virtio-net: add cond_resched() to the
 command waiting loop
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 xuanzhuo@linux.alibaba.com
References: <20230720083839.481487-1-jasowang@redhat.com>
 <20230720083839.481487-3-jasowang@redhat.com>
In-Reply-To: <20230720083839.481487-3-jasowang@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To DS0PR12MB6583.namprd12.prod.outlook.com
 (2603:10b6:8:d1::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6583:EE_|SJ0PR12MB5424:EE_
X-MS-Office365-Filtering-Correlation-Id: c188d924-09b7-4cec-6f0f-08db895f95c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TNORv/RsQnyc3m3k5Zq6tzJ7TrUL1FqLZl/ZZqOxEhus/TvpMrripffY8qHlju2wB44plYNOkyB36tQ62V7xAlbHwLE2qoFrLugetLmDjDycau6EuyYjLG0qhnb+VCNZUcgTF6zCxKdpEDfKuoxCtFKoIfHqwGBeDRZZ+GaRPhs+TLjddDLrSrjDsQOhKzQqe3Jkk5pIRBQARBXole0ZWP7v+6bWnsy/qWSSSGlop4iBi2A1qkREWKnXDB+GnJr8WwNgvfJSLJNfPL979wZ1fRpJTWXgeT2IxMCEh5MJ6Fh6E71Awwu+OGl9G2oxNrwefuFMptg9WuG2Pm4QMQydUI8s133OGJj+pRVZYhkBdIF5EDOoQGC4fWqTQqVwRVAFpBDwPO3K4F/pbQsybkHZSXOSCoYOcieSHddGulLp7DiOwunRrG86jYjEe5Z/wAtIthAl3i2ANTBYbJV2Niz8+rnMzFvF4AY99QTm709FPwRRMdzvP1129luOcmrOXwHMA3sftQL72XKCIFtMrYbzyT/3QTLB4712hlJS0Cbk0w4DsqX8py3JP+jfvKPC2Cmk0qMFti9o/axQBFpZ6R3L4dWG+KuI5L9qLE4xQDnNPSDeu5JpfdCPO94v4bH2FRg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(6512007)(41300700001)(6486002)(6506007)(966005)(44832011)(53546011)(31686004)(26005)(186003)(316002)(5660300002)(66946007)(66556008)(66476007)(4326008)(31696002)(478600001)(86362001)(7416002)(8676002)(8936002)(36756003)(2906002)(2616005)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RCtBOWd0MGJRUmkxTCtDay80SG0vQzQ2cHdQdGFTQzZQZjd4SDNUZ09IRzd0?=
 =?utf-8?B?Z1Y0YmFpQ01QTUpDZytnSUtMOU5na3kvMTVnVzcwM2p5Y2FFcW5BRzlZOGdP?=
 =?utf-8?B?Smp1Ry9PVk9QNGM5UUYrZGVjZEFPUkg0bG9mWlR5YnkwQ3JFM1Vpd0tob215?=
 =?utf-8?B?NFN1YVlQRW1QOGRyMTVxRWh1YUNqTGZSTGcreGdPZDdvVU9KQ1EyNDVsWWpa?=
 =?utf-8?B?ejJnc09oTklkeCtNeFdwbnJvWkludFhlUXVZU0xKUnZFTEhjSGlMUWtDUDA2?=
 =?utf-8?B?R3NUMWFYbmhFUlJKRERBV09QYXIyaU1RNnh1SEx2OXl2WGNvQlNNTlNyakU0?=
 =?utf-8?B?UTA3WnFTVURIUWI3TzNaZ0F5YkQ3cy9yS0xWbEh4S0JiVnpnUFpHbSthL1dt?=
 =?utf-8?B?WDFBOVYzRmcvbWJrd0M4VHZVaXpVSGovMWpyTFJKeGpUSldLN0l3azhTS3pt?=
 =?utf-8?B?d0czYndIYzFVRitvQ0p5MEZoMHBKZm14RVFEVFJuQTBXWFZLMVlFdDY5SnJ6?=
 =?utf-8?B?Vm5WbGUxTmNqKzEvRHNwSUN3TitFL29HNVRLcHNsbFBBSlR6dEl1VGZ3S3R5?=
 =?utf-8?B?anQzakJybnhVK0ZKbWo2UDhXTDloK0VqV0MxQ053cHUzMEZ3Njh3TUZCajBG?=
 =?utf-8?B?TEJjbE1PRkE4dmc3a3l5Z1g5b1VpNjlzUGtnYXlrVjdGMVl3MWdnK2QvQzhO?=
 =?utf-8?B?Rmh2NWc1Yk1iSmd2b004d0pTNkJtcE1VajZ1Mm5nM0ZHdzY5Q1JrMis3QUx2?=
 =?utf-8?B?RHNLWGNnOW50RXQ1Q05EU1FoZFhtYlM3dVI1bVd5Y0hPQzd5Tm1KSUJxRUpK?=
 =?utf-8?B?ek5nR0c3dXVRclVBdzZYR0gxV21TMCt5U09NQUVIamFreWFDVDdsL3NNSVlx?=
 =?utf-8?B?MVBISUF3aTQwY2dMNEdwQXVLWGhPbFQvWm1TWVpzRHV2bXBYRDJrZ29qMlFB?=
 =?utf-8?B?Qnl0L1JpNEttaVBGaDJSSFd0cjMvN1hJaWZOVktqRGFtK0dDRUdtSmpseG5x?=
 =?utf-8?B?WmY3dlFtTFlOeWxYSDF4eiszYjExRFVCRUt0VlNFdklGV3lTYlQ3NGJQdEVu?=
 =?utf-8?B?M1llNnBBVXZ1cEhBMlRBRnhTZXRETDgxalZCTjVsNnJyb3Z0WVVuUndqNXg1?=
 =?utf-8?B?bDdpaVZWdkkwVkRidERLZk1ER2VIQVR0V203VFFjUTg4enBwMVNpSy9MMkZy?=
 =?utf-8?B?WlI4UkdUS1VSVW5NVnNvSGxsblprUHlRMEJCcVpscmcrL3NxSm9Bdm5oTHp3?=
 =?utf-8?B?YW9BWFRtVE5jQ2pBSHphRHNVRGdQdEZ0WW42ejNlaHJlR1Fwdk81V05tTEpY?=
 =?utf-8?B?bGM0MStaQkJIeGQ0QTk0Q3RNUzFKRjViWGowYUhRd2dqRDB0MEsyTnVMZzMw?=
 =?utf-8?B?bTUzOGhMUEF0aGdhQVk3TjNkQ1RVRTlXWWlhYkpSemdiMGw0bGg2SzFCNjNv?=
 =?utf-8?B?Zmw1YXBsaUE2MExVcWdvK3dPcVE4M0NVQVhJUmtCTkRJakdKQzUzMTR6ZTB2?=
 =?utf-8?B?SmxuOWxmRzd6S05TNDRtZVVLam5jTmx3OFRieDVLUjFwMGtuUGw5d2l3dGNm?=
 =?utf-8?B?NlY1MURnbGo3eUZoVFUydkJFcXhGRzBFN2piMFZvdFFhc1dkVDJ2UWQvV3ph?=
 =?utf-8?B?d1d3Z3dvUXMrQ2pRcS93RElUMWlCa2dWN0VzK2RsN1NCak4wSC91SUkwMG1E?=
 =?utf-8?B?UmFxclZUaDhkaEYvQXFDZFRKbWwzU2lEWmdXZkd5OWV5VHU0OE54U0h2VW03?=
 =?utf-8?B?OTMzc2J4SnhsVm5aSmF0RE95ZldDMXlZcW8wU3pBdFJ1VFpxaEpBU1JlYjFB?=
 =?utf-8?B?THlCeGIrbTROMWQvK200UmNYVzIxUWQ3TTZVcEZBYTdraXgra2Q4SXVLNXJB?=
 =?utf-8?B?bU93MUVGM2QrMm5LcjhiRFlCb0ZjM0s3R05sN3U2NWZ6VnpyOUFQb3lHcVRo?=
 =?utf-8?B?a2FjWStZSVRmWm0ydFplYlJtQlVrZmI2aG54NnVpMjFFa0pKTjFRMSt3bkh0?=
 =?utf-8?B?bnBDOEEvR0tPTWYzQzRDQXdnVXJxNVVzVEJiWGphN2lDR3NYSHNDUDRMeDU3?=
 =?utf-8?B?RzExT3hoLzV0ZG1VZXBzS05DSk5BOHBKbnVLbVBOOWNQRHRiZC9PY2NGTXdW?=
 =?utf-8?Q?dnqLQ6BC8JLaQynbBPHZLXZZI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c188d924-09b7-4cec-6f0f-08db895f95c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 20:26:23.2095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vT5X6xvLQT7JtfjsQLkaEiyC2reEiYICzLcp2N9njr0qNNti0UjokJ0m0LUqNg0E3WD//LspHDMYFftplXq7+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5424
Cc: pabeni@redhat.com, netdev@vger.kernel.org, maxime.coquelin@redhat.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, kuba@kernel.org,
 virtualization@lists.linux-foundation.org, davem@davemloft.net
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

On 7/20/23 1:38 AM, Jason Wang wrote:
> 
> Adding cond_resched() to the command waiting loop for a better
> co-operation with the scheduler. This allows to give CPU a breath to
> run other task(workqueue) instead of busy looping when preemption is
> not allowed on a device whose CVQ might be slow.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

This still leaves hung processes, but at least it doesn't pin the CPU 
any more.  Thanks.

Reviewed-by: Shannon Nelson <shannon.nelson@amd.com>


> ---
>   drivers/net/virtio_net.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 9f3b1d6ac33d..e7533f29b219 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2314,8 +2314,10 @@ static bool virtnet_send_command(struct virtnet_info *vi, u8 class, u8 cmd,
>           * into the hypervisor, so the request should be handled immediately.
>           */
>          while (!virtqueue_get_buf(vi->cvq, &tmp) &&
> -              !virtqueue_is_broken(vi->cvq))
> +              !virtqueue_is_broken(vi->cvq)) {
> +               cond_resched();
>                  cpu_relax();
> +       }
> 
>          return vi->ctrl->status == VIRTIO_NET_OK;
>   }
> --
> 2.39.3
> 
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
