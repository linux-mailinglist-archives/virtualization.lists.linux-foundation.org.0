Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE813BBA9A
	for <lists.virtualization@lfdr.de>; Mon,  5 Jul 2021 11:56:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB7F60789;
	Mon,  5 Jul 2021 09:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 240x_T8y0Jtm; Mon,  5 Jul 2021 09:56:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B02D26078F;
	Mon,  5 Jul 2021 09:56:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24D00C0022;
	Mon,  5 Jul 2021 09:56:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF302C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 09:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD03E82E22
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 09:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueHfpO_lp6Fm
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 09:56:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA46282E19
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 09:56:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="208910694"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="208910694"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 02:56:38 -0700
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="644154191"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 02:56:34 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1m0LL2-008XrQ-Oh; Mon, 05 Jul 2021 12:56:28 +0300
Date: Mon, 5 Jul 2021 12:56:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH net-next 0/2] refactor the ringtest testing for ptr_ring
Message-ID: <YOLXTB6VxtLBmsuC@smile.fi.intel.com>
References: <1625457455-4667-1-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1625457455-4667-1-git-send-email-linyunsheng@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: yury.norov@gmail.com, nickhu@andestech.com, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, joe@perches.com,
 ndesaulniers@gooogle.com, green.hu@gmail.com, ojeda@kernel.org,
 kuba@kernel.org, akpm@linux-foundation.org, deanbo422@gmail.com,
 davem@davemloft.net
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

On Mon, Jul 05, 2021 at 11:57:33AM +0800, Yunsheng Lin wrote:
> tools/include/* have a lot of abstract layer for building
> kernel code from userspace, so reuse or add the abstract
> layer in tools/include/ to build the ptr_ring for ringtest
> testing.

...

>  create mode 100644 tools/include/asm/cache.h
>  create mode 100644 tools/include/asm/processor.h
>  create mode 100644 tools/include/generated/autoconf.h
>  create mode 100644 tools/include/linux/align.h
>  create mode 100644 tools/include/linux/cache.h
>  create mode 100644 tools/include/linux/slab.h

Maybe somebody can change this to be able to include in-tree headers directly?

Besides above, had you tested this with `make O=...`?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
