Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 276C84345AC
	for <lists.virtualization@lfdr.de>; Wed, 20 Oct 2021 09:04:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A184660766;
	Wed, 20 Oct 2021 07:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5Y2z5riyT8D; Wed, 20 Oct 2021 07:04:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9B710608FE;
	Wed, 20 Oct 2021 07:04:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BEACC0022;
	Wed, 20 Oct 2021 07:04:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7F1CC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 07:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A394C60838
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 07:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qaEk3SU8Q6E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 07:04:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E41560766
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 07:04:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228659418"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="228659418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 00:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="483605079"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.68])
 ([10.239.154.68])
 by orsmga007.jf.intel.com with ESMTP; 20 Oct 2021 00:04:46 -0700
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7> <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7> <YW6pHkXOPvtidtwS@kroah.com>
 <20211019143748.wrpqopj2hmpvblh4@vireshk-i7> <YW8LFTcBuN1bB3PD@ninjato>
 <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com> <YW+q1yQ8MuhHINAs@kroah.com>
 <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
Date: Wed, 20 Oct 2021 15:04:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
Content-Language: en-US
Cc: Greg KH <gregkh@linuxfoundation.org>,
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


On 2021/10/20 14:41, Viresh Kumar wrote:
> On 20-10-21, 14:35, Jie Deng wrote:
>> Yes, but we need to know what's the best value to be configured for a
>> specific "other side".
>>
>> I think the "other side" should be more aware of what value is reasonable to
>> be used.
> If we _really_ need that, then it would require an update to the
> specification first.
>
> I am not sure if the other side is the only party in play here. It
> depends on the entire setup and not just the hardware device.
> Specially with virtualisation things become really slow because of
> context switches, etc. It may be better for the guest userspace to
> decide on the value.
>
> Since this is specially for virtualisation, the kernel may set the
> value to few HZ by default, lets say 10 (Yeah its really high) :).


I'm OK with this way for the simplicity.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
