Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 605713EF788
	for <lists.virtualization@lfdr.de>; Wed, 18 Aug 2021 03:29:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 632D440222;
	Wed, 18 Aug 2021 01:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90sSORLiMIxd; Wed, 18 Aug 2021 01:29:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 162094024C;
	Wed, 18 Aug 2021 01:29:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9771EC000E;
	Wed, 18 Aug 2021 01:29:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B729C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 01:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 580E9606FF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 01:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzRHaH3ByheH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 01:29:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C066760674
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 01:29:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="213110878"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="213110878"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 18:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="531300286"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58])
 ([10.239.154.58])
 by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2021 18:29:38 -0700
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 mst@redhat.com, arnd@arndb.de, jasowang@redhat.com,
 andriy.shevchenko@linux.intel.com, yu1.wang@intel.com,
 conghui.chen@intel.com, viresh.kumar@linaro.org, stefanha@redhat.com,
 gregkh@linuxfoundation.org, vincent.guittot@linaro.org,
 alex.bennee@linaro.org, jiedeng@alumni.sjtu.edu.cn
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
 <YRwagcZ8SUCsncEA@kunai>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <b15f5586-4ffa-e794-aca3-5125dc7378bf@intel.com>
Date: Wed, 18 Aug 2021 09:29:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRwagcZ8SUCsncEA@kunai>
Content-Language: en-US
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


On 2021/8/18 4:22, Wolfram Sang wrote:
>
>   Michael S. Tsirkin <mst@redhat.com>
> Okay, with rc6 being released, I won't wait for an immutable branch
> anymore. I applied this now and we will see if there will be a merge
> conflict. If so, it will be trivial to handle, I'd think. So:
>
> Applied to for-next, thanks!


Thanks Wolfram!


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
