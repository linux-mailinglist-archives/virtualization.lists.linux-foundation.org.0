Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F442360255
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 08:25:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43A7C40FA7;
	Thu, 15 Apr 2021 06:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShkHk9ueKPPs; Thu, 15 Apr 2021 06:25:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DDC740FA8;
	Thu, 15 Apr 2021 06:25:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EB04C0012;
	Thu, 15 Apr 2021 06:25:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8723EC000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 06:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BAF540F8C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 06:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEktvHanq1gt
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 06:25:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A587B405F4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 06:25:48 +0000 (UTC)
IronPort-SDR: /27oOboJwd5CDScilcwwJpSXeN2iU+qkYVjf7GIMsqmUi2Q4SENlK9EZrALp2w03W4zQIAk+GQ
 wRjd8scXAIvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="191607774"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="191607774"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 23:25:47 -0700
IronPort-SDR: zY54dWZOt7m6OJWkJm9OClz48C/KRlYVNxj28nO9i1Ow2gAi24vZ3f0pwI7yaw5r46tPMikjTP
 74pQ++ZiUsUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="421587324"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.55])
 ([10.239.154.55])
 by orsmga007.jf.intel.com with ESMTP; 14 Apr 2021 23:25:41 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To: Viresh Kumar <viresh.kumar@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 wsa@the-dreams.de
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <e93836c3-d444-0b8c-c9df-559de0d5f27e@intel.com>
 <20210414035229.7uqfdcd6dy2ryg3s@vireshk-i7>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <dc5d6f92-8f90-5731-5fce-4b2b6a72c81f@intel.com>
Date: Thu, 15 Apr 2021 14:25:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210414035229.7uqfdcd6dy2ryg3s@vireshk-i7>
Content-Language: en-US
Cc: mst@redhat.com, bjorn.andersson@linaro.org,
 wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, yu1.wang@intel.com, wsa@the-dreams.de,
 u.kleine-koenig@pengutronix.de, kblaiech@mellanox.com,
 virtualization@lists.linux-foundation.org, arnd@arndb.de, stefanha@redhat.com,
 tali.perry1@gmail.com, conghui.chen@intel.com, loic.poulain@linaro.org,
 linux-kernel@vger.kernel.org, Sergey.Semin@baikalelectronics.ru,
 jarkko.nikula@linux.intel.com, shuo.a.liu@intel.com, rppt@kernel.org
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


On 2021/4/14 11:52, Viresh Kumar wrote:
>
>> Is i2c/for-next the right tree to merge it
>> ?
> It should be.

Thanks Viresh.


Hi Wolfram,

Do you have any comments for this patch ? Your opinion will be important 
to improve this patch

since you are the maintainer of I2C.

Thanks,

Jie

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
