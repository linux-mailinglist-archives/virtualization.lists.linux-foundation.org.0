Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF10434539
	for <lists.virtualization@lfdr.de>; Wed, 20 Oct 2021 08:36:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F9C4046B;
	Wed, 20 Oct 2021 06:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PmyamiN7qU3c; Wed, 20 Oct 2021 06:35:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EC350404C2;
	Wed, 20 Oct 2021 06:35:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 744BFC0022;
	Wed, 20 Oct 2021 06:35:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C8C1C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 06:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EBCC834BB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 06:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZ0JpXquFDFs
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 06:35:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32613814A1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 06:35:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="208807015"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="208807015"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 23:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="483596514"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.68])
 ([10.239.154.68])
 by orsmga007.jf.intel.com with ESMTP; 19 Oct 2021 23:35:50 -0700
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
To: Greg KH <gregkh@linuxfoundation.org>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7> <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7> <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7> <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com> <YW+q1yQ8MuhHINAs@kroah.com>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
Date: Wed, 20 Oct 2021 14:35:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YW+q1yQ8MuhHINAs@kroah.com>
Content-Language: en-US
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Wolfram Sang <wsa@kernel.org>,
 kernel@axis.com, linux-i2c@vger.kernel.org
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

On 2021/10/20 13:36, Greg KH wrote:

> On Wed, Oct 20, 2021 at 12:20:13PM +0800, Jie Deng wrote:
>> On 2021/10/20 2:14, Wolfram Sang wrote:
>>>> I think it is set to HZ currently, though I haven't tried big
>>>> transfers but I still get into some issues with Qemu based stuff.
>>>> Maybe we can bump it up to few seconds :)
>>> If you use adapter->timeout, this can even be set at runtime using a
>>> ioctl. So, it can adapt to use cases. Of course, the driver should
>>> initialize it to a sane default if the automatic default (HZ) is not
>>> suitable.
>>
>> I think a big value may solve most cases. but the driver never know how big
>> is enough by static configuration.
>>
>> Can we make this value to be configurable, just let the other side provide
>> this value ?
> If an ioctl can change it, that would mean it is configurable, right?


Yes, but we need to know what's the best value to be configured for a 
specific "other side".

I think the "other side" should be more aware of what value is 
reasonable to be used.



_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
