Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F1D2B2486
	for <lists.virtualization@lfdr.de>; Fri, 13 Nov 2020 20:31:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8473E87982;
	Fri, 13 Nov 2020 19:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYDK9WYWw4x2; Fri, 13 Nov 2020 19:31:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0420187912;
	Fri, 13 Nov 2020 19:31:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF499C0800;
	Fri, 13 Nov 2020 19:31:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E249DC0800
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 19:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DDB5B875E2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 19:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zbKmwED3i5m
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 19:31:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 50A18875DF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 19:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=V15TCrSdvvl0eHQ2B5KeRVDPQVrQ+kR6/+KoOQhbZ/o=; b=h8iwUL9yiUS6zCfmZDBAT9LyMs
 7dhIDTRIGMkIjouCJ+HYUriz/t25CM3meKDmRWwcJMvrKE69YlN8qM36XUXpri1HDV4t1GxoMdjUt
 RnEPvQG5btbMaf2MBVBJRjgjYHE+/E/ZLPKIdi1w9u25rFSI6mFtyj6XbZ/NC3IpU3dY51TGo263y
 5ubwVc/SxN8kL5wErA4n1WLV/Vd8liqKZRjjgbvgx0rXzA2ulH3zMDKkbzNS06/TeCX6kXUxoqpro
 QhNnyDQX5kP928cPGXmBKC8p3+LWXncW64oXFvsEzSDJu24Y8fmukRV493xeD1HgWf6p2GZNmH97/
 cKgmby0g==;
Received: from [2601:1c0:6280:3f0::662d]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdemv-0006eS-BS; Fri, 13 Nov 2020 19:31:14 +0000
Subject: Re: [PATCH] vdpasim: fix "mac_pton" undefined error
From: Randy Dunlap <rdunlap@infradead.org>
To: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org
References: <20201113155706.599434-1-lvivier@redhat.com>
 <fdab06b3-039b-df4b-243e-9cb0e940cc15@infradead.org>
Message-ID: <1578a773-edef-4bbf-676f-cf8d52dc0a4e@infradead.org>
Date: Fri, 13 Nov 2020 11:31:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fdab06b3-039b-df4b-243e-9cb0e940cc15@infradead.org>
Content-Language: en-US
Cc: virtualization@lists.linux-foundation.org,
 kernel test robot <lkp@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 11/13/20 10:49 AM, Randy Dunlap wrote:
> On 11/13/20 7:57 AM, Laurent Vivier wrote:
>>    ERROR: modpost: "mac_pton" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
>>
>> mac_pton() is defined in lib/net_utils.c and is not built if NET is not set.
>>
>> Select GENERIC_NET_UTILS as vdpasim doesn't depend on NET.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> On Nov. 2, 2020:
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
> https://lore.kernel.org/lkml/d3d50a94-cdc5-572b-e9ca-3ee5638d21ee@infradead.org/
> 
> 
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>  drivers/vdpa/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
>> index d7d32b656102..358f6048dd3c 100644
>> --- a/drivers/vdpa/Kconfig
>> +++ b/drivers/vdpa/Kconfig
>> @@ -13,6 +13,7 @@ config VDPA_SIM
>>  	depends on RUNTIME_TESTING_MENU && HAS_DMA
>>  	select DMA_OPS
>>  	select VHOST_RING
>> +	select GENERIC_NET_UTILS
>>  	default n
>>  	help
>>  	  vDPA networking device simulator which loop TX traffic back
>>
> 
> Thanks for the patch.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

-- 
~Randy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
