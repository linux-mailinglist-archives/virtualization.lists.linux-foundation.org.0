Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352F3B9A64
	for <lists.virtualization@lfdr.de>; Fri,  2 Jul 2021 03:05:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8206D83D4F;
	Fri,  2 Jul 2021 01:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RijBQqm6gCU; Fri,  2 Jul 2021 01:05:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E63983D53;
	Fri,  2 Jul 2021 01:05:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9388C0022;
	Fri,  2 Jul 2021 01:05:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F89BC000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 01:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D1F483D50
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 01:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJB4vOYHNOJv
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 01:05:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A5D483D4F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 01:05:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="206830674"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="206830674"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 18:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="409132402"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58])
 ([10.239.154.58])
 by orsmga006.jf.intel.com with ESMTP; 01 Jul 2021 18:05:23 -0700
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <YN2cs0H+5C892kM4@smile.fi.intel.com>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <a0ee5b05-0316-2529-143f-7da42ed56994@intel.com>
Date: Fri, 2 Jul 2021 09:05:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YN2cs0H+5C892kM4@smile.fi.intel.com>
Content-Language: en-US
Cc: yu1.wang@intel.com, arnd@arndb.de, mst@redhat.com, viresh.kumar@linaro.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wsa@kernel.org, wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
 stefanha@redhat.com, shuo.a.liu@intel.com, conghui.chen@intel.com
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


On 2021/7/1 18:45, Andy Shevchenko wrote:
> On Thu, Jul 01, 2021 at 11:24:46AM +0800, Jie Deng wrote:
>> Add an I2C bus driver for virtio para-virtualization.
>>
>> The controller can be emulated by the backend driver in
>> any device model software by following the virtio protocol.
>>
>> The device specification can be found on
>> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
>>
>> By following the specification, people may implement different
>> backend drivers to emulate different controllers according to
>> their needs.
>> 	- Use #ifdef CONFIG_PM_SLEEP to replace the "__maybe_unused".
> Why is that?


Please refer to https://lkml.org/lkml/2021/3/23/285.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
