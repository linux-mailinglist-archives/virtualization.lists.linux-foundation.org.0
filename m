Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 586A33B9AD4
	for <lists.virtualization@lfdr.de>; Fri,  2 Jul 2021 05:12:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48A583C90;
	Fri,  2 Jul 2021 03:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtyiBZq2zPZZ; Fri,  2 Jul 2021 03:12:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9E4F383D40;
	Fri,  2 Jul 2021 03:12:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07610C000E;
	Fri,  2 Jul 2021 03:12:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20B51C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 03:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE45C60601
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 03:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qQQehBywGney
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 03:12:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5461605B5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 03:12:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188350754"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="188350754"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 20:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="409158169"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58])
 ([10.239.154.58])
 by orsmga006.jf.intel.com with ESMTP; 01 Jul 2021 20:12:13 -0700
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
To: kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <202107011701.sZA89A1D-lkp@intel.com>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <68b2b36b-f1ee-d1aa-d4a5-d45f36602be6@intel.com>
Date: Fri, 2 Jul 2021 11:12:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <202107011701.sZA89A1D-lkp@intel.com>
Content-Language: en-US
Cc: kbuild-all@lists.01.org, arnd@arndb.de, mst@redhat.com, wsa@kernel.org,
 wsa+renesas@sang-engineering.com, andriy.shevchenko@linux.intel.com
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


On 2021/7/1 18:00, kernel test robot wrote:
> Hi Jie,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on wsa/i2c/for-next]
> [also build test ERROR on linux/master linus/master v5.13 next-20210630]
> [cannot apply to vhost/linux-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Jie-Deng/i2c-virtio-add-a-virtio-i2c-frontend-driver/20210701-112619
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
> config: i386-randconfig-c021-20210630 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>          # https://github.com/0day-ci/linux/commit/e8dedd2a8577148d7655d0affe35adf34efbbf15
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Jie-Deng/i2c-virtio-add-a-virtio-i2c-frontend-driver/20210701-112619
>          git checkout e8dedd2a8577148d7655d0affe35adf34efbbf15
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     In file included from <command-line>:32:
>>> ./usr/include/linux/virtio_i2c.h:12:10: fatal error: linux/bits.h: No such file or directory
>        12 | #include <linux/bits.h>
>           |          ^~~~~~~~~~~~~~
>     compilation terminated.


I didn't see this error. Why did you say no such file? Anything wrong ?

https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/tree/include/linux/bits.h

Thank you !

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
