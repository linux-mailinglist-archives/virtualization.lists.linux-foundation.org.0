Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D0C6F7957
	for <lists.virtualization@lfdr.de>; Fri,  5 May 2023 00:48:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FD36410AC;
	Thu,  4 May 2023 22:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FD36410AC
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iWqLHHzH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYGxu_Gx3ZYw; Thu,  4 May 2023 22:48:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9F76A417C3;
	Thu,  4 May 2023 22:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F76A417C3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7F08C008A;
	Thu,  4 May 2023 22:47:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35832C002A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 May 2023 22:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08BE3616A4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 May 2023 22:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BE3616A4
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=iWqLHHzH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Zpx-BsXlqIM
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 May 2023 22:47:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3339A60C14
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::611])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3339A60C14
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 May 2023 22:47:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uvldz2/pMK+ScyLf0oMgCi4x+GCCrZJGzT3YTNpa652rNKKmyr95C5Emcm9MNxYnbmVIx+OBkXRHsLYzrxdv5K70SabXY4+fSyN45J9PSZqrzIYTSWVGvI8nqPRXDQZ74o4UsmDc4z4VRKNmvX3ZrvmuvDJnGvdkF1ekadaT5L4ry2Axh8cciLfhmciP12VKbRD7B1EtncR6XrZNOfwPU4embpP/q4NTLAGhawrh1eoS64813JDGJW2ZxIasldU8A9NZ826HChFpAGjdo6O16S155xQ364J4NTApytHGxDmc9FBXl8E6OPdNQ6iUweivn2fxLo/8Y/pYGb0FLcZlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J53oQ94wQjg8AHUQ9UtVhE8e/kGntpsDPA7FF+hYc60=;
 b=inzgdTxEkZp8TbbwD3fnSB55w4ZKPazaqygOsxI+8gj+4xe4FeG6r8kcKZwbewhNCbbvK2ycSBdVifnCrvSK/LoGVdN5RuTItJLVUFKmrvFOlmlGAg7C6PdE4ZqlNmeZHF/VOfFzcz0WkEhxKjKSeYjli+iWRMU70xdWoXBQMNWQP0/+hsqXQwIZ1Lzrldl7+Wu/4pyNOmFUju2Vj1ho7PIevuDFI0Yi9KmS5j1T7PEwoG6DolGeElMIbvVweODiPf/zbsppwna5BGBImtWKwyvxuceU+ofRxQrxirhZjp/dcTT9Bsnb2vsTiwNRGgTUdPW0MJQdgl2ZgGQZq5c/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J53oQ94wQjg8AHUQ9UtVhE8e/kGntpsDPA7FF+hYc60=;
 b=iWqLHHzHrOIwU+zHxnsaPn+qIiUtKtH4p2VcGc85xfmv5ZuszuV1BfiqrEk7eaOJSd6HcfWKKh0/M1JaUUIZqBWP1JoGFEEbS1cuMpkaD8kM3zGlUqZYtJflZg/5O+uk5Z/XJzKH4hozRQLCgZCdGxqg+S7L14/ebaNHTPO191ccCRBOuQDH5spPqG08zj0QV31f/aah7KmGy/34WlVDO1E5PJT3zJhG9aCvJx0bd1eCsqBnXZlP8m1pxzpL4XzWvxCKEanGMGPnIPTRZu0hMetiO2bebOsoDv3aBoPWpVPPZHYrpUgkQwF0p5q+nd3veK6HF1QPaz7QE+34i2APwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) by
 SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Thu, 4 May
 2023 22:47:53 +0000
Received: from DM4PR12MB6207.namprd12.prod.outlook.com
 ([fe80::b886:ed22:51ce:fd53]) by DM4PR12MB6207.namprd12.prod.outlook.com
 ([fe80::b886:ed22:51ce:fd53%6]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 22:47:51 +0000
Message-ID: <034d79ac-1925-6a6b-a456-a17271632dd0@nvidia.com>
Date: Thu, 4 May 2023 18:47:29 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] virtio-vdpa: Fix unchecked call to NULL set_vq_affinity
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20230504135053.2283816-1-dtatulea@nvidia.com>
 <26ee2c04-7844-14fe-5cba-fe30172f075f@nvidia.com>
 <20230504145110-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230504145110-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To DM4PR12MB6207.namprd12.prod.outlook.com
 (2603:10b6:8:a6::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6207:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf1b7e1-74b9-4f5e-58a6-08db4cf18d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +r41LVnt9V448DDMRi93QknJaPs4UIykYiIn0iZTK/aFHSUP/KuKVIk+gtSrh5qbdzMZ2dwH/AP/87xPoUS9NxNfNPqFQ+Fd1TAqJ2ox3qJW6OP5W0KoLe+j/+LllciRrcJSVKZNwRCh4SckIuJYFUaviOTfrKpmEQVcoSwUKgcEhZJSdLZjC1E9yyWVDclAcDFrj146a3A6AYgs/rnldGHGdCPLIcxXm9v6xsSx1U7WtNaQoVWIpYez+0Vx5SA5aNgDb+VnCMucBCPTof3o540wj0fniVy4G1QKJgsoqLPRDOFqjNJn2QRN8t4ZwFBeQY5VxU2ibSLNBNznaC0rZLt/bqqHHoVRJi4I62eQOD0R4b76IHDMfL4KkANBAiA2NidAKWEc79q8cfY0j4bB0WNb7BDp6dvrU8zh6xZ/QuVe5kwTYQJMb0PypU5VmFJv4o91W7R7jmhheBSijn16GtZ/pasiw6pcI4EkE7gjPPehcLo1TOC8a66XvHl7IJuU5/6HM95cy9aAVz+rlPSNYt01h5s9kqtjwnYpDO2dwbct1vBmJs2CmdMYUiUU514lLBUQh/wazPVBxMTWXwXtRLxfzEgz4VuVIWaPl1TE2coOkwX8/IrGaFRvcHe1yLISQSarwYMhVespn1ozXvdLsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6207.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(316002)(66476007)(478600001)(6916009)(4326008)(66946007)(66556008)(83380400001)(38100700002)(41300700001)(6486002)(6666004)(31686004)(186003)(26005)(54906003)(6506007)(6512007)(5660300002)(8936002)(8676002)(2616005)(2906002)(36756003)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXlTdStGK0JiNkRVbStsSjVnb3hVNHB0bUQrL0MvYzVPMjlSSzBxQlFLQkdW?=
 =?utf-8?B?TCttZlBteDNGU2Q4akg1L2hVMUZxMjFpN0Uwbm9ia25QYU9lbndjVFk5TEVJ?=
 =?utf-8?B?WXUyc3I4RUxJQ3pSNXVZUC9rTG9FTVYvMjJDaHhNYW4yODJlWHpvWnFEYnFl?=
 =?utf-8?B?R3pHV2ZQckl6eDQ2WEtjZ3BqdmowQk5LSnloR20wRjJoTWFpOXNJNm9yVVdL?=
 =?utf-8?B?VUlhTnQveDVHRUp5UThyZVVlS2Q2V0QyMm8yWFhUYlYwdWhxZlpPMlV1UVNH?=
 =?utf-8?B?RGtaRDVvME9zYnFhR2ZxR3dqU2hGYWM4RFAxQU8zSVVXNVFocjJSelk5d3BR?=
 =?utf-8?B?UVM0N3F3VHdkME1uMWRqTVE0emxwZi80dzJuQjh1NjduMmlFV3pHRUk2Q0Vk?=
 =?utf-8?B?TmtkWG5ZS0YvTXJjeU9iUzNMRWJnaW5KdzlpcEF6V3dhdUNEUW1NN2xuV1dD?=
 =?utf-8?B?eDduZWdXbmllV3BFVWJpS2wxTEZqcnBmSFN6SHJVOFR1QjJ5YkJPT0g5K2Er?=
 =?utf-8?B?VVAreTBCR2RxRHFsYXJLbWNjaHZKeVo2a1ZkWERyZEJHMTBhc3grcjZkcm9n?=
 =?utf-8?B?OGNxWFZialQrUzFsTU1VVTdzSzJoSmxONDZTSmRJeWlNbWpLSDU3VktFYnFE?=
 =?utf-8?B?S1ZMb3Q2aWw0QzNwYjJlS1hKdmV6dXFQQzFscDZEYTh2dW10aGlDYkIrdDlY?=
 =?utf-8?B?VmpzOGtRV0RsL0I5cFNkKzBkd2hBU1ZZNDFKbUpBOUliZHJ3WFh5SVM2VFpH?=
 =?utf-8?B?N3dSbXdyMUl5NUlEM29EUHdVMXdjYlRLSHhOWlBnSGs5WWJJbzFBd0JHWTdX?=
 =?utf-8?B?cUN3NUpZcnVyQmxQZXRYbkF3WDhnZFNNaTBPTmtSUmNNcDJmVXJnOVd4Ym90?=
 =?utf-8?B?eFM2ZUxYcjQ2UlV2R0hRRHhCWjhycDJSaFdVSllORXhUQUdQVUFkNFYxUFVT?=
 =?utf-8?B?aHRtellac3J0bk1DdEJGSURkMEh6V1RTUXNEclJjWitxbklnSVpCRjdnTnlp?=
 =?utf-8?B?U1pXWnU5N054aEdjMVQxeVAwQlRSV3hnTGF6eE9Nd0ZPS0dpemNSUUNGeTlD?=
 =?utf-8?B?Y0JzRTN5WGZPYTIzdGFNaHFwa0E1UVRwalNzODhnY3ROWXJ6T2hNUjN4YXdE?=
 =?utf-8?B?YzJsd3ZBYzFRdVBvUVI4dkxDeEFFN0FxeUNYQTNBSGdTSG5GdWtxbDRyVnZK?=
 =?utf-8?B?RXBkNkU1OWRUbGY0STFxZGdjczE4RW9xd01UL2xiVmxtdm5xNGY0NVhCKzFV?=
 =?utf-8?B?b1gwMFlBKytDRFFKMm11MmhPOTJ0UHpBUzRQOXpweG0yMEcxQy9WSGRmbk1T?=
 =?utf-8?B?M01hNi8zOTJ0Mi95UTFHNGpiUkc4cW43MlNLUHRLOEdBUWxva09MRC92OURS?=
 =?utf-8?B?UW1uTWJqZFV0L1E0UTI4Z1p3V2xtZUdJUTVjeTZuaW1OUUZRdVdPR1hrQXdJ?=
 =?utf-8?B?ZjR2Z1ZZYTByNk12c213cDNCY281Q2Y2SituRDJOeEFFdUJTNFVwMUVjUUMw?=
 =?utf-8?B?ODZlbGlPOWdYWVAzc2M2Sk5FRUllNzUrN202Y1Y5dEY1WFJaK0RQcU1rWmV4?=
 =?utf-8?B?R3lmaGNZT1NZbXZjV2ptU1hyMGhlaVZyUWx1SDJvb3hhSGlGNXByZ0luMWNQ?=
 =?utf-8?B?QVdVempNY0dYMUpaTFBJdnAwSURzTG45UHpYQzZVczR5alVYVGpuY1JoUFJn?=
 =?utf-8?B?T1hXWDlMODQ5OXEzdkZGcHM5TnBrbzNoNk42NWlLdGVEcFN0aHJBQ2VzTGtw?=
 =?utf-8?B?dXdpQnhlOHlFeEI3cllLaCs2RVNTQTFic3o0cDA3MDlWVCtwNHV5eko5WGU1?=
 =?utf-8?B?RnZDdEFsYlZSOTN4V0E0OFlnZnBIOUtESWRjdjNyQTl0ZjJWNlgxV01vdXBW?=
 =?utf-8?B?WFlyQmdPVGpOdk5VZUtreURocmZ6K3owMVM2aDFrY2diakoxOEpya0ZiQ1JN?=
 =?utf-8?B?QzRreGFlbnZYS2VoZVFaUkNOeTlPSXZETXNVUnVIQmFtclRBQTJVbWVaNFVW?=
 =?utf-8?B?ODhVVTZEY2hRdE9Zc2FDYUxUSTY3bUZtTThGN3R1SXFZbFRUaHo0dURiSEhx?=
 =?utf-8?B?Z2JMelFZelJ0M2VPaFNyeWxBOUZzNDhjYUl0emJhZ1BETWVMOGNjSUhVMVMy?=
 =?utf-8?Q?pN1QOUwk8pPvP8fsGLru3yjxW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf1b7e1-74b9-4f5e-58a6-08db4cf18d58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6207.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 22:47:51.4083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lST8bTDFpDYvpCtOv2xT67rkFcVIcxcFcGtOo4QeBvsuEr/mQcrG0q9tAI5bh6b6m8BTZWtWvFnqYH1vU+FDqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, Gal Pressman <gal@nvidia.com>
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
From: Feng Liu via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Feng Liu <feliu@nvidia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



On 2023-05-04 p.m.2:51, Michael S. Tsirkin wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Thu, May 04, 2023 at 01:08:54PM -0400, Feng Liu wrote:
>>
>>
>> On 2023-05-04 a.m.9:50, Dragos Tatulea wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> The referenced patch calls set_vq_affinity without checking if the op is
>>> valid. This patch adds the check.
>>>
>>> Fixes: 3dad56823b53 ("virtio-vdpa: Support interrupt affinity spreading mechanism")
>>> Reviewed-by: Gal Pressman <gal@nvidia.com>
>>> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
>>> ---
>>>    drivers/virtio/virtio_vdpa.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
>>> index eb6aee8c06b2..989e2d7184ce 100644
>>> --- a/drivers/virtio/virtio_vdpa.c
>>> +++ b/drivers/virtio/virtio_vdpa.c
>>> @@ -385,7 +385,9 @@ static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
>>>                           err = PTR_ERR(vqs[i]);
>>>                           goto err_setup_vq;
>>>                   }
>>> -               ops->set_vq_affinity(vdpa, i, &masks[i]);
>>> +
>>> +               if (ops->set_vq_affinity)
>>> +                       ops->set_vq_affinity(vdpa, i, &masks[i]);
>> if ops->set_vq_affinity is NULL, should give an error code to err, and
>> return err
> 
> Given we ignore return code, hardly seems like a critical thing to do.
> Is it really important? affinity is an optimization isn't it?
> 
Yes, it is an optimization, got it.

>>>           }
>>>
>>>           cb.callback = virtio_vdpa_config_cb;
>>> --
>>> 2.40.1
>>>
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
