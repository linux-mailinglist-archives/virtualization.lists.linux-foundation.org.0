Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F08E35EA97
	for <lists.virtualization@lfdr.de>; Wed, 14 Apr 2021 04:07:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D766160D5D;
	Wed, 14 Apr 2021 02:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGGNd_6IxF_n; Wed, 14 Apr 2021 02:07:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C1B60D5F;
	Wed, 14 Apr 2021 02:07:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B53CC000A;
	Wed, 14 Apr 2021 02:07:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 598B9C000A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 02:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E60860D5D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 02:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lslj1oJLR0CM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 02:07:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49AC6606F1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 02:07:10 +0000 (UTC)
IronPort-SDR: Xw9QeQ5LsnoUYMfc/H10lKRchAkiF/1b4O3GFV1e1O/inRCY1IH+PkO4BUmu5q4SPNw4DyA832
 Tk0hv9xQp0Pw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="194572055"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; d="scan'208";a="194572055"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 19:07:09 -0700
IronPort-SDR: +w9i91SN6CtVYLJO9ax4un4cg75+8DVQcmUMFkRuCDAFDcXhTl5aKJfs39VWOSRweZ+DgRi8c+
 xBtZY/FF6zGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; d="scan'208";a="418105391"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
 by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2021 19:07:01 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To: wsa@kernel.org, wsa@the-dreams.de, mst@redhat.com,
 linux-i2c@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <e93836c3-d444-0b8c-c9df-559de0d5f27e@intel.com>
Date: Wed, 14 Apr 2021 10:07:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
Content-Language: en-US
Cc: Sergey.Semin@baikalelectronics.ru, bjorn.andersson@linaro.org,
 loic.poulain@linaro.org, yu1.wang@intel.com, arnd@arndb.de, mst@redhat.com,
 viresh.kumar@linaro.org, shuo.a.liu@intel.com, tali.perry1@gmail.com,
 wsa@kernel.org, wsa+renesas@sang-engineering.com,
 jarkko.nikula@linux.intel.com, stefanha@redhat.com,
 u.kleine-koenig@pengutronix.de, kblaiech@mellanox.com,
 andriy.shevchenko@linux.intel.com, conghui.chen@intel.com, rppt@kernel.org
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

Hi maintainers,

What's the status of this patch ? Is i2c/for-next the right tree to 
merge it ?

Thanks,

Jie


On 2021/3/23 22:19, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
>
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
>
> The device specification can be found on
> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
>
> By following the specification, people may implement different
> backend drivers to emulate different controllers according to
> their needs.
>
> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Jie Deng <jie.deng@intel.com>
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
