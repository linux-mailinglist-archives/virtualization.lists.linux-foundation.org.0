Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BED6F4A87
	for <lists.virtualization@lfdr.de>; Tue,  2 May 2023 21:42:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C04DA60E3A;
	Tue,  2 May 2023 19:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C04DA60E3A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rtgBiHSS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1Ot_3vYAt3y; Tue,  2 May 2023 19:42:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6256D60F11;
	Tue,  2 May 2023 19:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6256D60F11
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85D02C0089;
	Tue,  2 May 2023 19:42:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16EBAC002A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 May 2023 19:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D11E560F11
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 May 2023 19:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D11E560F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AztwvL4Zy5SA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 May 2023 19:42:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE4C60E3A
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFE4C60E3A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 May 2023 19:42:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM8uJWeMZcwamClOwlgMMP4Qxr1oDuY8cJ+XJbaHxpXYHL12RCXDoJyQjexuLMc7o5g9iCamBO+5nbEM1uGKv2cTNAMHZ/GQdYYd06C2B2DPwzHcnDfrvEa9kNqAXl7upya/V0vsFWk0MjB2994h0E6dmGbVxR88Ld7vwPfmx/UXULxDGV9dJd8UhDXWQrBiyIBa+oT6zwk/4NnjyivLihaHlS4ifosNW13eGeYdRGcXCWtplT3HkftGrFYMkjZN1mg9LYZ3CP6SzbJ59/khAjZUysQwZ5HHHNSalU7LKfNyd2PmETwuv8ZmDdIVP3tboN7SeieANyt2Z2RfRYZLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwPyEjXtsuhvn3NUJ8nGOzGZxqwhWDyCm4Oz6h+0hVI=;
 b=WNL5GRY8eOLEL8XyrKlG7k/19rMNG7I55Z+qan4NLdPUDDbGKdan3ntPTEsguplvX39h9YVZPzRlsvnwjqbSdFQcuzpUsQNLNUirkADa3hE8/xn5cqIjoWjV74C8caMTMw11/vPDRraJaEtJsEEKEIHei/9n2AqUSSRo/1UV8OoXmAsghptmjaKNIGdd9LbxTLo4VFCAGmRjy4xTPJraYEtLpnOjiMyvWtZQ2f5/OQkzcK6hPRfMn7WVtg0mzV7nOXIQVB7PfbuN6ehkCRgdjJIhz0KjwLpxoQQzfly3C74FQ+5ZK3e1pLQhslIgilqWBEK+NXZqTdxNbdStv/l9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwPyEjXtsuhvn3NUJ8nGOzGZxqwhWDyCm4Oz6h+0hVI=;
 b=rtgBiHSS8Ac/V5YTHdcQpBG6pjN3OS5GITiMT/UUCSSj6h65hwqg2Ee0XUjwFuKW+vBJQly26u6Lv5EYShFfBiA9ek6MAwI53StqnK1h4r+0V/eQyk7+pbSX4SD67rwUb1RgLfyTojSYzdOSgC1gQDaKrjOl1f/2YIPhDCAkO9YaWH0yUVeg1TnQMi/Cy5waPOQ/ZfMe2uWhAoOWPcgVBiJbl19yJeCJy+wVTiK9QDD2B+RjB38bBYK4jqosr27yS0NzgK8W0W2MEw57ra/rG4VWTjJDvbW18BQf/xNrpDkz7E1CldeG+b3K7eikf/wfAvbUp8wKOW4erN5wW8LMcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16)
 by IA0PR12MB8228.namprd12.prod.outlook.com (2603:10b6:208:402::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 19:42:18 +0000
Received: from CY5PR12MB6201.namprd12.prod.outlook.com
 ([fe80::a7a3:1d9d:1fa:5136]) by CY5PR12MB6201.namprd12.prod.outlook.com
 ([fe80::a7a3:1d9d:1fa:5136%6]) with mapi id 15.20.6363.020; Tue, 2 May 2023
 19:42:17 +0000
Message-ID: <a4676198-87d4-7472-425b-16fb4a39704f@nvidia.com>
Date: Tue, 2 May 2023 15:42:13 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH net v2] virtio_net: Fix error unwinding of XDP
 initialization
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20230502174134.32276-1-feliu@nvidia.com>
 <20230502143148-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230502143148-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CY5PR12MB6201.namprd12.prod.outlook.com
 (2603:10b6:930:26::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6201:EE_|IA0PR12MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 907b70dc-6ada-4d22-bfe5-08db4b45562a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yxeuS10Xuy/68Kp8EzmaILn3F3UEA8+HFzQp2Kz0KVYdWChopZPC8k3irr5jCA7+ZLJYYIF8wwWg3e9PIFQEatauUR6hh+byq0YMaQyBiGl6YZ2ZNgq7N7qkF8OR8ooxYGSOFOFNlz9sOxkl2HkCyJ4NZnk0FNJGByp2N81ATGvYWxvYJg2juNe/smdHgFanE2GT/oMiOFvoK/8DQJ8VGhtMbcLscYsDQ5gHnI9c2m7WgN/efAKe6bGvU9wiDl5xRPS9wEpJMu5KhOskOSevEnwKJ+0vOIPc6A0hMiHwed1yns/iGAU1fvYGTBjCnJ1QCtUh/XOR9k/tbASfYQZg3spDpGVOOiLBsD2K/ISgQnE5d7AauSyrjQSwlUFdsQGR769WpoEVcAUxG65nuajSjlxPKumWLrQ1ZqWq2QufZAwVMVeh7ADo4OgUbJlZivnA247g91pCGR91xbkoTo7Yz6Kr3+/ttPAJTwxlU22F+ZXzvfhsP3OnN2iOiB9aLl7ftEy0clPkx2kSV/1zzZr4XDKC1qivkKc0fMBO86qiNCEmnpUJuUlDz8+FHMEWUbQJdO+DGrihUCkW03NltPQgZXpe3KRKCkozlX+GxKK98g0vj7N5Qz7+egZI0+RT3Mp3KHdFxHo/VRrNGAqrOgaK2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6201.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199021)(2616005)(83380400001)(107886003)(478600001)(31686004)(186003)(54906003)(4326008)(6916009)(66556008)(66476007)(66946007)(6486002)(6666004)(6512007)(6506007)(26005)(316002)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1A4MUpIanQzR3FUcjBMNitwcVA3NXBpTzVIamlBeFc0dFJkUVV2RjdSY20y?=
 =?utf-8?B?ZS9LanNIeEI1cmE3Q0NHdG9uOWFhS2ZqQkorejdYWExlRmcvemIyckpiU05M?=
 =?utf-8?B?T2hUckwxdDZqMUpBWG5mSWZzbTdvbHlyWWFDMmpKOG0wQnJ5VlBRVkhnMThv?=
 =?utf-8?B?djdyRm93L0FJTG5sQWREbWk0QUpLOC9yeCtEaHRwWmJ5VmxjR1N5SW9sTmJ5?=
 =?utf-8?B?bzJuTkRENGorSUJIdXNwQ3UrdnFkSThLZi9vT1RDT2s5RjFzWnpXelFRaGd6?=
 =?utf-8?B?V1RUUEVpVUtoM0pPYlU5eVJFZXlqaGtrSjhkdFZ4VjZVNmxwV3ZsdDJMNkli?=
 =?utf-8?B?WnhlUDJNeDh5UUUzclRIUDZpS281eTE4djVOaTJZOTNLb0ZjSlBQTm14SldZ?=
 =?utf-8?B?Q2pBNWN2SGJNVUxZS0tnL2sxUjBvd3ZqRmYwY1NPc0hxak4xZWhYdm5BV1ll?=
 =?utf-8?B?OU1SNjJqYmxzNzJlMHp2QzQ1Z3AvOFE3clRNRW1VdDdZUHJYZzlhTmpCMVlj?=
 =?utf-8?B?K1psVTk0MW13bHdpNWxxbjFSOVR2bEViRlF1SkR4cGtWYnVwYUJ2VjA4dGh6?=
 =?utf-8?B?ZEp2NTJVSDVKUWp2emlSWGtxc3ZNNUx0WWowcS8xdU5oYzFLRm95SkY0bzVx?=
 =?utf-8?B?Y3drR21TUndsMU1JbFF1dkRQT1VuT2o4NXJhenR2WGp5R3JYSXk4TTF0Wlgr?=
 =?utf-8?B?SUdHMjVxcU1jSDJVQ0xjakJsZWJKdERScWdaSmM5NmxaU3pMMzlqTkZwVHRS?=
 =?utf-8?B?VHhBblN2YUtmZWQrVU9taGkzNGlla0FidURIOElucVQ4ai9aTFZFYUl0MDBr?=
 =?utf-8?B?ckRjckdLb2VQNDhmWk9kR3RRRG1DY3lsZTZLcmZuYzc1Zjl3SFluVVUySzFt?=
 =?utf-8?B?TkVqYU9VUHNTc1FnQ1pmVWJObWdEWWloNmEyUllkbW5HdHpVb0Izek1TWWQz?=
 =?utf-8?B?WkxUOUZvcVNybTBQaGQ3UkUxaVlRemQ0ZUd2a2NpbXVPc1NQVzRKTnFKd0Jw?=
 =?utf-8?B?N2ZydTlxRldOWUdlVzh0MXgwNGhtVEZiQUV1VVpucWN2blEwcEJrd1pmTUxR?=
 =?utf-8?B?Yjk3QlkreWpEOXBpYTBBZWlLYVZ2Rkt1alU5cFZmc09obHJvNXdYb2tNNGQ0?=
 =?utf-8?B?Y1J0T1VLR3k2T2ZHNHFLWlVpZU4wTnYxeUZIaDdTeEIwMkN3VlI1TmE0aFJ0?=
 =?utf-8?B?UUhQc1NPbHVPUTZVSVUyZGVyV0poQkQvQUdUdlNkZXdTRmxYMmJXNGVnQisy?=
 =?utf-8?B?eWgzVWErUkh3QnViaExjK1B0cU02ZGVoZ0N4UFpXcmw0SkVzZnhhRGpjYW5o?=
 =?utf-8?B?TitpS3FueUxrbEd3UkorWjFFdGhwVjM0aEU0Wk5lNUMrazRSdEwrbHNONXN6?=
 =?utf-8?B?OXNyN3ZlOTJzQ3p0Q2ZEOVhySWpNOTFiUDlhb250a0wwN0ZsUEVLcWl3aW1G?=
 =?utf-8?B?NlF3SHJTNUxaaWxPckxSV3ZRdFZ6bUdqN0lNa2Jhc2lYTm5vakVOd3NobDZk?=
 =?utf-8?B?bE9TbHkvL3UxZ2NlaGh6bGh5T204ZkF3WUE2K1J1eDJSckgydVZKR2NnenM0?=
 =?utf-8?B?eTNOYWNFSzNYMVdKT1ZVZERxdk9kaEIzdXRZOGV2Q3N5YmhZcG5xZWREMEJq?=
 =?utf-8?B?dVdlVWczMGRGelBvS1lLNTZFZjk5d1lqYzV4WVVaeDhBQ1crYnRTZzh0RFN2?=
 =?utf-8?B?YWtjQkgvRzE5MFZiU2xXQ0g4Q25lZ0RaYzhwQTFlU1p6M3R4c0ZpQlRUQmFm?=
 =?utf-8?B?RnBIc2lEZzhlNWVseDdlOHExWldwdmNLYXlrQmlwWlhKcXhUZ09PN1BKOGM5?=
 =?utf-8?B?d1RNWmpsZi9mYmUvNk5saWN5eVplTWtMZjBtbEkvT1FzV1NtVnhkSHROZ0F5?=
 =?utf-8?B?c0l2SDZTWVVEZFBRSVR4eWxCZlZaTlVNSXp6aUdmd2xoVFFTTk5wakhUUUN4?=
 =?utf-8?B?MVlBRm1WQ2VjYkY0RE11WEVXcG8rUjBVeWozRnpGZXozcHZTSVkzVCsvcGM1?=
 =?utf-8?B?R1ZTQ05DS3QxWS95aC9rQ3RqaXNweTBMb09DMlFNVzJvaEJldmRmYmpvRGh3?=
 =?utf-8?B?MDZUaWp3aVgrckpYNWhQYmJyUlpFYjFHOS9PRWJTVTdud1hyMHdhaTFPNzFL?=
 =?utf-8?Q?YLr9pczwZXGtThX60XAmi6gLx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907b70dc-6ada-4d22-bfe5-08db4b45562a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6201.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 19:42:17.5067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z963/t1PIjHe20hvJI9utYV2uLXlDpY4dfEVVE5fw1xBOm7tllt4NeYgmPM8QKWVGk7CigXZeGk2gWjfWTDiTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8228
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Simon Horman <simon.horman@corigine.com>, William Tu <witu@nvidia.com>,
 bpf@vger.kernel.org
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



On 2023-05-02 p.m.2:32, Michael S. Tsirkin wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, May 02, 2023 at 01:41:34PM -0400, Feng Liu wrote:
>> When initializing XDP in virtnet_open(), some rq xdp initialization
>> may hit an error causing net device open failed. However, previous
>> rqs have already initialized XDP and enabled NAPI, which is not the
>> expected behavior. Need to roll back the previous rq initialization
>> to avoid leaks in error unwinding of init code.
>>
>> Also extract a helper function of disable queue pairs, and use newly
>> introduced helper function in error unwinding and virtnet_close;
>>
>> Fixes: 754b8a21a96d ("virtio_net: setup xdp_rxq_info")
>> Signed-off-by: Feng Liu <feliu@nvidia.com>
>> Reviewed-by: William Tu <witu@nvidia.com>
>> Reviewed-by: Parav Pandit <parav@nvidia.com>
>> Reviewed-by: Simon Horman <simon.horman@corigine.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   drivers/net/virtio_net.c | 31 +++++++++++++++++++++----------
>>   1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
>> index 8d8038538fc4..5cd78e154d14 100644
>> --- a/drivers/net/virtio_net.c
>> +++ b/drivers/net/virtio_net.c
>> @@ -1868,6 +1868,13 @@ static int virtnet_poll(struct napi_struct *napi, int budget)
>>        return received;
>>   }
>>
>> +static void virtnet_disable_qp(struct virtnet_info *vi, int qp_index)
>> +{
>> +     virtnet_napi_tx_disable(&vi->sq[qp_index].napi);
>> +     napi_disable(&vi->rq[qp_index].napi);
>> +     xdp_rxq_info_unreg(&vi->rq[qp_index].xdp_rxq);
>> +}
>> +
>>   static int virtnet_open(struct net_device *dev)
>>   {
>>        struct virtnet_info *vi = netdev_priv(dev);
>> @@ -1883,20 +1890,27 @@ static int virtnet_open(struct net_device *dev)
>>
>>                err = xdp_rxq_info_reg(&vi->rq[i].xdp_rxq, dev, i, vi->rq[i].napi.napi_id);
>>                if (err < 0)
>> -                     return err;
>> +                     goto err_xdp_info_reg;
>>
>>                err = xdp_rxq_info_reg_mem_model(&vi->rq[i].xdp_rxq,
>>                                                 MEM_TYPE_PAGE_SHARED, NULL);
>> -             if (err < 0) {
>> -                     xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
>> -                     return err;
>> -             }
>> +             if (err < 0)
>> +                     goto err_xdp_reg_mem_model;
>>
>>                virtnet_napi_enable(vi->rq[i].vq, &vi->rq[i].napi);
>>                virtnet_napi_tx_enable(vi, vi->sq[i].vq, &vi->sq[i].napi);
>>        }
>>
>>        return 0;
>> +
>> +     /* error unwinding of xdp init */
> 
> btw we don't really need this comment - it's how all
> error handling is done anyways.
> if you need to roll v3, you can drop it.
> 
Will do, thx

>> +err_xdp_reg_mem_model:
>> +     xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
>> +err_xdp_info_reg:
>> +     for (i = i - 1; i >= 0; i--)
>> +             virtnet_disable_qp(vi, i);
>> +
>> +     return err;
>>   }
>>
>>   static int virtnet_poll_tx(struct napi_struct *napi, int budget)
>> @@ -2305,11 +2319,8 @@ static int virtnet_close(struct net_device *dev)
>>        /* Make sure refill_work doesn't re-enable napi! */
>>        cancel_delayed_work_sync(&vi->refill);
>>
>> -     for (i = 0; i < vi->max_queue_pairs; i++) {
>> -             virtnet_napi_tx_disable(&vi->sq[i].napi);
>> -             napi_disable(&vi->rq[i].napi);
>> -             xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
>> -     }
>> +     for (i = 0; i < vi->max_queue_pairs; i++)
>> +             virtnet_disable_qp(vi, i);
>>
>>        return 0;
>>   }
>> --
>> 2.37.1 (Apple Git-137.1)
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
