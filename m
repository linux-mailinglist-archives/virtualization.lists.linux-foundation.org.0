Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D24403277
	for <lists.virtualization@lfdr.de>; Wed,  8 Sep 2021 04:07:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C48982CA3;
	Wed,  8 Sep 2021 02:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnkaO0uXXUDd; Wed,  8 Sep 2021 02:07:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BF00882C84;
	Wed,  8 Sep 2021 02:07:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50237C000D;
	Wed,  8 Sep 2021 02:07:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 978D9C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 02:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7246780F43
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 02:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzwXII58KOZ4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 02:07:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89B0E80F42
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 02:07:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="207476989"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="207476989"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 19:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="503324076"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.46])
 ([10.239.154.46])
 by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2021 19:07:30 -0700
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210904160059-mutt-send-email-mst@kernel.org>
 <20210906044307.se4dcld2wlblieyv@vireshk-i7>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <5bb91030-c4be-a3c1-fe25-337999348e9a@intel.com>
Date: Wed, 8 Sep 2021 10:07:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210906044307.se4dcld2wlblieyv@vireshk-i7>
Content-Language: en-US
Cc: yu1.wang@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wsa@kernel.org, wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
 stefanha@redhat.com, shuo.a.liu@intel.com, andriy.shevchenko@linux.intel.com,
 conghui.chen@intel.com
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


On 2021/9/6 12:43, Viresh Kumar wrote:
>
>> Let's let the dust settle on them then, then
>> resubmit?
> It doesn't break anything for now since we don't have much users and
> we know zero length transfers don't work. I will submit the necessary
> changes once spec is finalized.

Agree. The currently merged spec and driver are consistent.

We can support zero length request once the following spec change is 
accepted.

[PATCH V3] virtio: i2c: Allow zero-length transactions 
(https://lists.oasis-open.org/archives/virtio-dev/202109/msg00004.html)

So, can we start a ballot for this new feature ?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
